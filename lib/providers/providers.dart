import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:your_basket/Services/api_service.dart';
// import 'package:your_basket/Services/product_api_service.dart';
import 'package:your_basket/models/category/category.dart';
import '../Services/cart_api_service.dart';
import '../Services/user_api_service.dart';
import '../models/cart/cartitem.dart';
import '../models/product/productdetail.dart';
import 'package:your_basket/models/product/products.dart';
import '../Services/category_api_service.dart';
import '../Services/product_api_service.dart';
import 'connectivityProvider.dart';
import '../Services/order_api_service.dart';
import 'package:your_basket/models/orders/orders.dart';
import 'package:firebase_auth/firebase_auth.dart';

// import 'package:your_basket/Services/category_api_service.dart';

final authCheckProvider = StateProvider<User?>((ref) => null);

final createuserProvider = FutureProvider.family<void, String?>(
  (ref, number) {
    final apiRespository = ref.watch(userApiService);

    return apiRespository.createuserifnotexist(number);
  },
);

// final yourordersProvider = FutureProvider.family<List<Orders>?, String>(
//   (ref, userid) {
//     print("\nInside api repo");
//     final apiRespository = ref.watch(orderApiService);

//     return apiRespository.getOrdersbyId(userid);
//   },
// );
final yourordersProvider = FutureProvider.family<List<Orders>?, String>(
  (ref, userid) {
    final apiRespository = ref.watch(orderApiService);

    return apiRespository.getOrdersbyId(userid);
  },
);
final categoriesProvider = FutureProvider.family<List<Category>?, String>(
  (ref, mainCategoryId) {
    final apiRespository = ref.watch(categoryApiService);

    return apiRespository.getCategory(mainCategoryId);
  },
);

final placeorderProvider = FutureProvider.family<String?, Map<String, dynamic>>(
  (ref, obj) {
    final apiRespository = ref.watch(orderApiService);

    return apiRespository.placeorder(obj);
  },
);

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

// final connectivity Provider
final connectivityProvider =
    ChangeNotifierProvider<ConnectivityProvider>((ref) {
  return ConnectivityProvider();
});
