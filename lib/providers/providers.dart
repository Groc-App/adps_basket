import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:your_basket/Services/api_service.dart';
import 'package:your_basket/models/category/category.dart';
import '../models/cart/cartitem.dart';
import '../models/product/productdetail.dart';

final categoriesProvider = FutureProvider<List<Category>?>(
  (ref) {
    final apiRespository = ref.watch(apiService);

    return apiRespository.getCategory();
  },
);

final cartItemProvider = FutureProvider.family<List<CartItem>?, String>(
  (ref, userid) {
    final apiRespository = ref.watch(apiService);

    return apiRespository.getCartItem(userid);
  },
);

final productByidProvider = FutureProvider.family<Product?, String>(
  (ref, productid) {
    final apiRespository = ref.watch(apiService);

    return apiRespository.getproductDetail(productid);
  },
);

// final cartItemUpdateProvider = FutureProvider.family<Product?, String>(
//   (ref, cartitemid) {
//     final apiRespository = ref.watch(apiService);

//     return apiRespository.updateCartitemquantity(cartitemid);
//   },
// );
