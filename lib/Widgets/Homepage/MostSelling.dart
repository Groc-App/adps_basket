// ignore: file_names
// ignore_for_file: file_names, duplicate_ignore

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:your_basket/Widgets/Errors/Dataloadingerror.dart';
import 'package:your_basket/Widgets/Homepage/ProductItem.dart';
import 'package:your_basket/Widgets/Sinners/productsinner.dart';
import 'package:your_basket/providers/providers.dart';

import '../../models/product/products.dart';

class MostSelling extends StatelessWidget {
  const MostSelling({super.key});

  Widget productList(WidgetRef ref, scWidth) {
    final categories = ref.watch(mostsellingproductProvider);
    return categories.when(
      data: (list) {
        return buildproduct(list, scWidth);
      },
      error: (_, __) => DataError(),
      loading: () => const Center(child: ProductSinner()),
    );
  }

  Widget buildproduct(List<Product>? list, scWidth) {
    return Container(
      height: scWidth * ((0.48 / 0.6) * 3) + 50,
      child: list != null
          ? GridView.builder(
              padding: EdgeInsets.symmetric(horizontal: 5),
              physics: NeverScrollableScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 0.6,
                  crossAxisSpacing: 3,
                  mainAxisSpacing: 3),
              itemCount: list.length,
              itemBuilder: (BuildContext context, int index) {
                return Container(
                  child: ProductItem(
                    product: list[index],
                  ),
                );
              })
          : Text('Empty List'),
    );
  }

  @override
  Widget build(BuildContext context) {
    final scSize = MediaQuery.of(context).size;
    final scHeight = scSize.height;
    final scWidth = scSize.width;
    final tempHeight = scWidth * 0.48 / 0.7 * 3;

    return Container(
      // height: scWidth * 0.48 / 0.7 * 3,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            margin: const EdgeInsets.symmetric(vertical: 20, horizontal: 0),
            child: const Text(
              'Most Selling Products',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Consumer(builder: (context, ref, child) {
            return productList(ref, scWidth);
          }),
        ],
      ),
    );
  }
}
