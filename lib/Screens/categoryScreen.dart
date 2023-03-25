// ignore: file_names
// ignore_for_file: file_names, duplicate_ignore

import 'package:flutter/material.dart';
import 'package:your_basket/Widgets/Categories/categoriesSlider.dart';
import 'package:your_basket/Widgets/Categories/searchBar.dart';
import 'package:your_basket/Widgets/Errors/Dataloadingerror.dart';
import 'package:your_basket/Widgets/Homepage/ProductItem.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:your_basket/Widgets/Sinners/productCategorysinner.dart';
import 'package:your_basket/models/product/products.dart';
import 'package:your_basket/providers/connectivityProvider.dart';
import '../Widgets/Sinners/productsinner.dart';
import '../providers/providers.dart';
import '../models/category/category.dart';

class CategoryScreen extends ConsumerStatefulWidget {
  late String mainCategoryId;

  CategoryScreen({super.key, required this.mainCategoryId});

  @override
  _CategoryScreenState createState() =>
      _CategoryScreenState(mainCategoryId: mainCategoryId);
}

class _CategoryScreenState extends ConsumerState<CategoryScreen> {
  late String mainCategoryId;

  _CategoryScreenState({required this.mainCategoryId});

  late Map<String, String> mapp = {
    "mainCategoryId": mainCategoryId,
    "subCategoryId": "null"
  };

  Widget categoriesList(WidgetRef ref, String mainCategoryId, String imgUrl) {
    final categories = ref.watch(categoriesProvider(mainCategoryId));

    return categories.when(
      data: (list) {
        /* --------------------------- All Cateogry Logic --------------------------- */

        Map<String, dynamic> map = {
          "Name": "All",
          "categoryId": "null",
          "imageurl": imgUrl
        };

        Category c = Category.fromJson(map);

        if (list!.elementAt(0) != c) {
          list.insert(0, c);
        }

        /* -------------------------------------------------------------------------- */

        return buildCategory(list);
      },
      error: (_, __) => DataError(),
      loading: () => const Center(child: ProductCategorySinner()),
    );
  }

  Widget productList(WidgetRef ref, Map<String, String> map) {
    final products = ref.watch(productsByCategoryProvider(map));
    return products.when(
      data: (list) {
        return buildProducts(list);
      },
      error: (_, __) => DataError(),
      loading: () => const Center(
        child: ProductSinner(),
      ),
    );
  }

  Widget buildProducts(List<Product>? products) {
    return GridView.builder(
        physics: const NeverScrollableScrollPhysics(),
        padding: const EdgeInsets.symmetric(horizontal: 5),
        shrinkWrap: true,
        itemBuilder: (context, index) {
          return ProductItem(
            product: products[index],
            key: Key(products[index].productId),
          );
        },
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          childAspectRatio: 0.60,
          crossAxisCount: 2,
          crossAxisSpacing: 3,
          mainAxisSpacing: 3,
        ),
        itemCount: products!.length);
  }

  final ScrollController _controller = ScrollController();

  // This is what you're looking for!
  void _scrollDown() {
    _controller.animateTo(
      _controller.position.extentAfter,
      duration: Duration(seconds: 2),
      curve: Curves.fastOutSlowIn,
    );
  }

  int selected = 0;

  void tapHandler(WidgetRef ref, String val, String catId, int index) {
    mapp = {'mainCategoryId': mainCategoryId, 'subCategoryId': catId};
    ref.read(categoryProvider(mainCategoryId).notifier).update((state) => mapp);
    setState(() {
      selected = index;
    });
  }

  Widget categoryBuilding(List<Category>? categories, int index) {
    return GestureDetector(
      onTap: () {
        tapHandler(ref, mainCategoryId, categories[index].categoryId, index);
      },
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: Column(children: [
          selected == index
              ? Container(
                  margin: const EdgeInsets.all(2),
                  width: 55,
                  height: 75,
                  alignment: Alignment.center,
                  child: Image.network(
                    categories![index].imageurl,
                    fit: BoxFit.fitHeight,
                    height: 75,
                  ),
                )
              : Container(
                  margin: const EdgeInsets.all(8),
                  width: 50,
                  height: 60,
                  alignment: Alignment.center,
                  child: Image.network(
                    categories![index].imageurl,
                    fit: BoxFit.cover,
                    height: 60,
                  ),
                ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                categories[index].Name,
                style: TextStyle(
                  color: selected == index
                      ? Theme.of(context).primaryColor
                      : Colors.black,
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ]),
      ),
    );
  }

  Widget buildCategory(List<Category>? categories) {
    return Stack(
      alignment: Alignment.centerRight,
      children: [
        Container(
            height: 135,
            alignment: Alignment.center,
            // width: sc_width * 0.9,
            child: ListView.separated(
              separatorBuilder: (context, index) => const SizedBox(
                width: 20,
              ),
              shrinkWrap: true,
              physics: const ClampingScrollPhysics(),
              padding: const EdgeInsets.all(10),
              itemCount: categories!.length,
              scrollDirection: Axis.horizontal,
              controller: _controller,
              /* --------------------- Building Slider category Items --------------------- */
              itemBuilder: ((context, index) =>
                  categoryBuilding(categories, index)),
            )),
        if (categories.length > 3)
          IconButton(
              splashColor: Colors.white,
              alignment: Alignment.centerRight,
              onPressed: _scrollDown,
              icon: Icon(Icons.arrow_forward)),
      ],
    );
  }

  Widget bodyContent(map, imgUrl) {
    return ListView(
      padding: EdgeInsets.only(top: 0),
      children: [
        /* ---------------------------- Top SLider Bar ---------------------------- */
        // GestureDetector(
        //     onTap: () {
        //       Navigator.of(context).pushNamed('/searchScreen');
        //     },
        //     child: SearchBar()),
        // Text(connectivityStatusProvider == ConnectivityStatus.isConnected
        //     ? 'Is Connected to Internet'
        //     : 'Is Disconnected from Internet'),
        categoriesList(ref, mainCategoryId, imgUrl),
        /* ------------------------------Body Pane----------------------------- */
        SizedBox(child: productList(ref, map))
      ],
    );
  }

  _buildSilverAppBarBackground(context, height, name) {
    return Container(
      decoration: BoxDecoration(
          // border: Border.all(),
          color: Colors.white),
      // color: Colors.white,
      height: 25,
      child: Stack(
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
              color: Colors.green[400],
              // color: Colors.white,bo
              borderRadius: BorderRadius.vertical(bottom: Radius.circular(10)),
            ),
            // Background
            child: Center(
              child: Text(
                "$name",
                style: TextStyle(
                    fontSize: 25.0,
                    fontWeight: FontWeight.w600,
                    color: Colors.white),
              ),
            ),

            height: height + 25,
            width: MediaQuery.of(context).size.width,
          ),

          // Container(), // Required some widget in between to float AppBar
//
          Positioned(
            // To take AppBar Size only
            top: 100.0,
            left: 20.0,
            right: 20.0,
            child: AppBar(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12

                    // bottom: Radius.circular(8),
                    ),
              ),
              backgroundColor: Colors.white,
              leading: Icon(
                Icons.menu,
                color: Theme.of(context).primaryColor,
              ),
              primary: false,
              title: TextField(
                  decoration: InputDecoration(
                      hintText: "Search order repeat",
                      border: InputBorder.none,
                      hintStyle: TextStyle(color: Colors.grey))),
              actions: <Widget>[
                IconButton(
                  icon:
                      Icon(Icons.search, color: Theme.of(context).primaryColor),
                  onPressed: () {},
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    var categ = (ModalRoute.of(context)?.settings.arguments ??
        <String, dynamic>{}) as Map;

    var imgUrl = categ['imageUrl'];

    // ref.read(categoryProvider.notifier).update((state) => mapp);

    mainCategoryId = categ['maincategoryid'];
    // mapp['categoryId'] = "null";
    // ConnectivityProvider connect =
    //     ref.watch(connectivityProvider).startMonitoring();
    var connectivityStatusProvider = ref.watch(connectivityStatusProviders);

    Map<String, String> map =
        ref.watch(categoryProvider(categ['maincategoryid']));
    /* ------------------------------- dummy Data ------------------------------- */
    // var dummyList = List.generate(20, (index) => Catalog().products[0]);

    /* --------------------------- Screen Intilization -------------------------- */
    final scSize = MediaQuery.of(context).size;
    final scHeight = scSize.height;

    /* -------------------------------- Scaffold -------------------------------- */
    return Scaffold(
      backgroundColor: Colors.white,
      /* --------------------------------- appBar --------------------------------- */
      // appBar: AppBar(
      //   // centerTitle: true,
      //   // ignore: prefer_const_constructors
      //   elevation: 1,
      //   title: Text(
      //     categ['name'],
      //     softWrap: true,
      //     style: const TextStyle(fontWeight: FontWeight.w700, fontSize: 15),
      //   ),
      // ),

      /* ---------------------------------- body ---------------------------------- */
      body: NestedScrollView(
        body: bodyContent(map, imgUrl),
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return <Widget>[
            SliverAppBar(
              titleSpacing: 0,
              iconTheme: IconThemeData(
                color: Colors.white, //change your color here
              ),
              leadingWidth: 30,
              // leading: ,
              backgroundColor: Colors.green[400],
              centerTitle: true,
              expandedHeight: 130,
              elevation: 5.0,
              floating: false,
              pinned: true,
              title: innerBoxIsScrolled
                  ? Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10.0),
                      child: SearchBar(),
                    )
                  : null,
              flexibleSpace: FlexibleSpaceBar(
                  background: _buildSilverAppBarBackground(
                      context, 100.0, categ['name'])),
            ),
          ];
        },
        // connect.isOnline != null ?
        //         Column(
        //   children: [
        //     /* ---------------------------- Top SLider Bar ---------------------------- */
        //     GestureDetector(
        //         onTap: () {
        //           Navigator.of(context).pushNamed('/searchScreen');
        //         },
        //         child: SearchBar()),
        //     // Text(connectivityStatusProvider == ConnectivityStatus.isConnected
        //     //     ? 'Is Connected to Internet'
        //     //     : 'Is Disconnected from Internet'),
        //     categoriesList(ref, mainCategoryId, imgUrl),

        //     // Carousel(),

        //     /* -------------------------------------------------------------------------- */

        //     /* ------------------------------Body Pane----------------------------- */
        //     // ProductData(),2
        //     // ProductDataWidgets(),
        //     SizedBox(child: productList(ref, map))
        //   ],
        // )
        // : InternetConnection(),
      ),
    );
  }
}
