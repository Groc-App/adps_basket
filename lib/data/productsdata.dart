import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../models/product/products.dart';
import '../providers/providers.dart';

class SearchData {
  static List<Product> data = [];

  static void initialize(WidgetRef ref) async {
    List<Product> pdata = await ref.watch(allProductProvider.future);
    // pdata.when(
    //     data: (value) {
    //       data = value;
    //     },
    //     error: (_, __) {},
    //     loading: () {});
    data = pdata;
  }
}
