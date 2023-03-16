import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../models/product/products.dart';
import '../providers/providers.dart';

class SearchData {
  static List<Product> data = [];

  static void initialize(WidgetRef ref) {
    final pdata = ref.watch(allProductProvider);
    pdata.when(
        data: (value) {
          data = value;
        },
        error: (_, __) {},
        loading: () {});
  }
}
