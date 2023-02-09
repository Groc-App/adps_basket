import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:your_basket/Services/api_service.dart';
// import 'package:your_basket/Services/product_api_service.dart';
import 'package:your_basket/models/category/category.dart';
import '../Services/cart_api_service.dart';
import '../models/cart/cartitem.dart';
import '../models/product/productdetail.dart';
import 'package:your_basket/models/product/products.dart';
import '../Services/category_api_service.dart';
import '../Services/product_api_service.dart';
// import 'package:your_basket/Services/category_api_service.dart';

// class Counter extends Notifier<int> {
//   @override
//   int build() {
//     return 1;
//   }

//   void increment() {
//     state++;
//   }

//   void decrement() {
//     state--;
//   }
// }

// final counterProvider = NotifierProvider<Counter, int>(() {
//   return Counter();
// });

final mostsellingproductProvider = FutureProvider<List<Product>?>(
  (ref) {
    final apiRespository = ref.watch(productApiService);

    return apiRespository.getAllProdcutsMostSelling();
  },
);

final maincategorylistProvider = FutureProvider<List<Category>?>(
  (ref) {
    final apiRespository = ref.watch(categoryApiService);

    return apiRespository.getmainCategory();
  },
);

final categoriesProvider = FutureProvider.family<List<Category>?, String>(
  (ref, mainCategoryId) {
    final apiRespository = ref.watch(categoryApiService);

    return apiRespository.getCategory(mainCategoryId);
  },
);

final cartItemProvider = FutureProvider.family<List<CartItem>?, String>(
  (ref, userid) {
    final apiRespository = ref.watch(cartApiService);

    return apiRespository.getCartItem(userid);
  },
);

final productByidProvider = FutureProvider.family<ProductItem?, String>(
  (ref, productid) {
    final apiRespository = ref.watch(authApiService);

    return apiRespository.getproductDetail(productid);
  },
);

final cartItemUpdateProvider =
    FutureProvider.family<Product?, Map<String, dynamic>>(
  (ref, cartitemdet) {
    final apiRespository = ref.watch(cartApiService);

    apiRespository.updateCartitemquantity(cartitemdet);
    return null;
  },
);

final productsByCategoryProvider =
    FutureProvider.family<List<Product>?, Map<String, String>>(
  (ref, map) {
    print("\n\nIn the product providerrrrrrrrrrrrrrrrr");
    final productApiRepository = ref.watch(productApiService);
    return productApiRepository.getAllProdcutsByCategory(map);
  },
);

final allProductProvider = FutureProvider<List<Product>?>(
  (ref) {
    final apiRespository = ref.watch(productApiService);

    return apiRespository.getAllProduct();
  },
);
