import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:your_basket/Services/api_service.dart';
// import 'package:your_basket/Services/product_api_service.dart';
import 'package:your_basket/models/category/category.dart';
import '../models/cart/cartitem.dart';
import '../models/product/productdetail.dart';
import 'package:your_basket/models/product/products.dart';
import '../Services/category_api_service.dart';
import '../Services/product_api_service.dart';
// import 'package:your_basket/Services/category_api_service.dart';

final categoriesProvider = FutureProvider.family<List<Category>?, String>(
  (ref, mainCategoryId) {
    final apiRespository = ref.watch(categoryApiService);

    return apiRespository.getCategory(mainCategoryId);
  },
);

final cartItemProvider = FutureProvider.family<List<CartItem>?, String>(
  (ref, userid) {
    final apiRespository = ref.watch(authApiService);

    return apiRespository.getCartItem(userid);
  },
);

final productByidProvider = FutureProvider.family<ProductItem?, String>(
  (ref, productid) {
    final apiRespository = ref.watch(authApiService);

    return apiRespository.getproductDetail(productid);
  },
);

// final cartItemUpdateProvider = FutureProvider.family<Product?, String>(
//   (ref, cartitemid) {
//     final apiRespository = ref.watch(apiService);

//     return apiRespository.updateCartitemquantity(cartitemid);
//   },
// );
final productsByCategoryProvider =
    FutureProvider.family<List<Product>?, Map<String, String>>(
  (ref, map) {
    print("\n\nIn the product providerrrrrrrrrrrrrrrrr");
    final productApiRepository = ref.watch(productApiService);
    return productApiRepository.getAllProdcutsByCategory(map);
  },
);
