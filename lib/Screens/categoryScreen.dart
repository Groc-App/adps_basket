// ignore: file_names
// ignore_for_file: file_names, duplicate_ignore

import 'package:flutter/material.dart';
import 'package:your_basket/Widgets/Categories/CategoriesGrid.dart';
import 'package:your_basket/Widgets/Categories/categoriesSlider.dart';
import 'package:your_basket/Widgets/Categories/searchBar.dart';
import 'package:your_basket/Widgets/Homepage/ProductItem.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:your_basket/models/product/products.dart';
import '../providers/providers.dart';
import '../models/category/category.dart';

class CategoryScreen extends ConsumerWidget {
  // CategoryScreen({super.key});

  // setState(){}
  // var category = "Bread";
  late String mainCategoryId;

  Map<String, String> mapp = {
    "mainCategoryId": "63e00827b56990c02866bba5",
    "subCategoryId": "null"
  };

  // ignore: use_key_in_widget_constructors
  CategoryScreen({required this.mainCategoryId});

  Widget categoriesList(WidgetRef ref, String mainCategoryId) {
    final categories = ref.watch(categoriesProvider(mainCategoryId));

    return categories.when(
      data: (list) {
        print("\nThisssssssssssssssssss is list" + '${list}');
        return buildCategory(list);
      },
      error: (_, __) => const Center(child: Text("ERR")),
      loading: () => const Center(child: CircularProgressIndicator()),
    );
  }

  Widget productList(WidgetRef ref, Map<String, String> map) {
    print("\nthis is category name ..........................||||||||||||");
    print(map);
    final products = ref.watch(productsByCategoryProvider(map));
    return products.when(
      data: (list) {
        print(
            "\n\n\n\n\n\n\nThisssssssssssssssssss is list of products::::::::::::::::::::::::::::" +
                '${list}');

        return buildProducts(list);
      },
      error: (_, __) => const Center(child: Text("ERR")),
      loading: () => const Center(
        child: CircularProgressIndicator(),
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
            imageUrl: products[index].ImageUrl,
            name: products[index].Name,
            desc: products[index].Description,
            price: products[index].Price,
            quantity: products[index].Quantity,
          );
        },
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          childAspectRatio: 0.7,
          crossAxisCount: 2,
          crossAxisSpacing: 3,
          mainAxisSpacing: 3,
        ),
        itemCount: products!.length);
  }

  Widget buildCategory(List<Category>? categories) {
    return Container(
      height: 130,
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

        /* --------------------- Building Slider category Items --------------------- */
        itemBuilder: ((context, index) => CategorySliderItems(
              map: mapp,
              categoryId: categories[index].categoryId,
              catergoryURL: categories[index].imageurl,
              categoryName: categories[index].Name,
              mainCategoryId: mainCategoryId,
            )),
      ),
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var categ = (ModalRoute.of(context)?.settings.arguments ??
        <String, dynamic>{}) as Map;

    // mapp['mainCategoryId'] = categ['maincategoryid'];
    // mapp['categoryId'] = "null";

    Map<String, String> map = ref.watch(categoryProvider);
    print("\n||||||||This is update cateogry ||||||||");
    print(map);
    /* ------------------------------- dummy Data ------------------------------- */
    // var dummyList = List.generate(20, (index) => Catalog().products[0]);

    /* --------------------------- Screen Intilization -------------------------- */
    final scSize = MediaQuery.of(context).size;
    final scHeight = scSize.height;

    /* -------------------------------- Scaffold -------------------------------- */
    return Scaffold(

        /* --------------------------------- appBar --------------------------------- */
        appBar: AppBar(
            centerTitle: true,
            // ignore: prefer_const_constructors
            title: Text(
              "Milk And Bakery",
              style: const TextStyle(fontWeight: FontWeight.w700, fontSize: 30),
            ),
            backgroundColor: const Color.fromARGB(255, 237, 230, 230)),
        backgroundColor: const Color.fromARGB(255, 237, 230, 230),

        /* ---------------------------------- body ---------------------------------- */
        body: SingleChildScrollView(
            child: Column(
          children: [
            /* ---------------------------- Top SLider Bar ---------------------------- */
            const SearchBar(),
            categoriesList(ref, mainCategoryId),
            // Carousel(),

            /* -------------------------------------------------------------------------- */

            /* ------------------------------Body Pane----------------------------- */

            SizedBox(
                // height: scHeight * 0.8,
                // width: sc_width * 0.s8,
                // height: double.maxFinite,

                /* ---------------------- Building Categories Item Grid --------------------- */
                child: productList(ref, map))
          ],
        )));
  }
}
