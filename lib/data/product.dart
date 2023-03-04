import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:your_basket/models/product/products.dart';
import '../providers/providers.dart';

List<Product>? product_list;

class ProductData extends ConsumerWidget {
  const ProductData({super.key});

  Widget setData(WidgetRef ref) {
    final productsData = ref.watch(allProductProvider);

    // print("\n\nInside productData function");
    print(product_list);
    return productsData.when(data: (list) {
      // print("\n\nInside productData list");
      // product_list = list;
      // print("\n\n\n\nThis is listttt");
      // print(list);
      return Text("");
    }, error: (_, __) {
      print("\n\nInside productData error");
      return Text("");
    }, loading: () {
      print("Loading");
      return Text("");
    });
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // print("\n\nInside productData widget");
    setData(ref);

    return Container();
  }
}
