// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:your_basket/models/product/products.dart';
import '../providers/providers.dart';

List<Product>? product_list;

class ProductData extends ConsumerWidget {
  const ProductData({super.key});

  Widget setData(WidgetRef ref) {
    final productsData = ref.watch(allProductProvider);

    return productsData.when(data: (list) {
      return const Text("");
    }, error: (_, __) {
      return const Text("");
    }, loading: () {
      return const Text("");
    });
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    setData(ref);

    return Container();
  }
}
