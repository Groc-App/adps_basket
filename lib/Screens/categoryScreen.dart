// ignore: file_names
// ignore_for_file: file_names, duplicate_ignore, must_be_immutable, no_logic_in_create_state

import 'package:flutter/material.dart';
import 'package:your_basket/Widgets/Categories/categoriesSlider.dart';
import 'package:your_basket/Widgets/Categories/searchBar.dart';
import 'package:your_basket/Widgets/Errors/Dataloadingerror.dart';
import 'package:your_basket/Widgets/Homepage/ProductItem.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:your_basket/Widgets/Sinners/productCategorysinner.dart';
import 'package:your_basket/models/product/products.dart';
import '../Widgets/Sinners/productsinner.dart';
import '../providers/providers.dart';
import '../models/category/category.dart';

class CategoryScreen extends ConsumerStatefulWidget {
  late String mainCategoryId;

  CategoryScreen({super.key, required this.mainCategoryId});

  @override
  // ignore: library_private_types_in_public_api
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
      error: (_, __) => const DataError(),
      loading: () => const Center(child: ProductCategorySinner()),
    );
  }

  Widget productList(WidgetRef ref, Map<String, String> map) {
    final products = ref.watch(productsByCategoryProvider(map));
    return products.when(
      data: (list) {
        return buildProducts(list);
      },
      error: (_, __) => const DataError(),
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

  void _scrollDown() {
    _controller.animateTo(
      _controller.position.extentAfter,
      duration: const Duration(seconds: 2),
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
              icon: const Icon(Icons.arrow_forward)),
      ],
    );
  }

  Widget bodyContent(map, imgUrl) {
    return ListView(
      padding: const EdgeInsets.only(top: 0),
      children: [
        /* ---------------------------- Top SLider Bar ---------------------------- */

        categoriesList(ref, mainCategoryId, imgUrl),
        /* ------------------------------Body Pane----------------------------- */
        SizedBox(child: productList(ref, map))
      ],
    );
  }

  _buildSilverAppBarBackground(context, height, name) {
    return Container(
      decoration: const BoxDecoration(color: Colors.white),
      height: 30,
      child: Stack(
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
              color: Colors.green[400],
              image: const DecorationImage(
                  fit: BoxFit.fitHeight,
                  image: NetworkImage(
                      "https://firebasestorage.googleapis.com/v0/b/your-basket-515fc.appspot.com/o/Category%20App%20Bar%20Bg%2FOnly%20img%2FNew%20Project%20(1).png?alt=media&token=484d9c49-0722-4cc3-a447-a7c4d92b2baa")),
              // color: Colors.white,bo
              borderRadius:
                  const BorderRadius.vertical(bottom: Radius.circular(10)),
            ),
            height: height + 30,
            width: MediaQuery.of(context).size.width,
          ),
          Positioned(
            top: 100.0,
            left: 20.0,
            right: 20.0,
            child: AppBar(
              leadingWidth: 50,
              titleSpacing: 0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              backgroundColor: Colors.white,
              leading: Icon(
                Icons.search,
                color: Theme.of(context).primaryColor,
              ),
              primary: false,
              title: TextField(
                  onTap: () {
                    FocusScope.of(context).unfocus();
                    Navigator.of(context).pushNamed('/searchScreen');
                  },
                  decoration: InputDecoration(
                      hintText: "Search in $name",
                      border: InputBorder.none,
                      hintStyle: const TextStyle(color: Colors.grey))),
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

    mainCategoryId = categ['maincategoryid'];

    Map<String, String> map =
        ref.watch(categoryProvider(categ['maincategoryid']));
    /* ------------------------------- dummy Data ------------------------------- */

    /* --------------------------- Screen Intilization -------------------------- */

    /* -------------------------------- Scaffold -------------------------------- */
    return Scaffold(
      backgroundColor: Colors.white,
      /* --------------------------------- appBar --------------------------------- */

      /* ---------------------------------- body ---------------------------------- */
      body: NestedScrollView(
        body: bodyContent(map, imgUrl),
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return <Widget>[
            SliverAppBar(
              titleSpacing: 0,
              iconTheme: const IconThemeData(
                color: Colors.white,
              ),
              leadingWidth: 30,
              backgroundColor: const Color.fromRGBO(102, 187, 106, 1),
              centerTitle: true,
              expandedHeight: 140,
              elevation: 5.0,
              floating: false,
              pinned: true,
              title: innerBoxIsScrolled
                  ? const Padding(
                      padding: EdgeInsets.symmetric(vertical: 10.0),
                      child: SearchBar(),
                    )
                  : null,
              flexibleSpace: FlexibleSpaceBar(
                  background: _buildSilverAppBarBackground(
                      context, 100.0, categ['name'])),
            ),
          ];
        },
      ),
    );
  }
}
