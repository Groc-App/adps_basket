import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:your_basket/Services/api_service.dart';
// import 'package:your_basket/Services/product_api_service.dart';
import 'package:your_basket/models/category/category.dart';
import 'package:your_basket/models/product/products.dart';
import '../Services/category_api_service.dart';
import '../Services/product_api_service.dart';
// import 'package:your_basket/Services/category_api_service.dart';

final categoriesProvider = FutureProvider<List<Category>?>(
  (ref) {
    final apiRespository = ref.watch(categoryApiService);

    return apiRespository.getCategory();
  },
);

final productsByCategoryProvider =
    FutureProvider.family<List<Product>?, String>(
  (ref, String name) {
    final productApiRepository = ref.watch(productApiService);
    print("In the product provider");
    return productApiRepository.getAllProdcutsByCategory(name);
  },
);
