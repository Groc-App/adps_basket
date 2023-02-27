import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:your_basket/Services/api_service.dart';
import 'package:your_basket/Services/offer_api_service.dart';
// import 'package:your_basket/Services/product_api_service.dart';
import 'package:your_basket/models/category/category.dart';
import 'package:your_basket/models/offer/offer.dart';
import '../Services/address_api_service.dart';
import '../Services/cart_api_service.dart';
import '../Services/user_api_service.dart';
import '../application/notifier/addressbook_notifier.dart';
import '../application/notifier/cart_notifier.dart';
import '../application/state/addressbook_state.dart';
import '../application/state/cart_state.dart';
import '../models/address/address.dart';
import '../models/address/selectedaddress.dart';
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
// final authCheckProvider = StateProvider<User?>((ref) => new User());

final cartItemsProvider = StateNotifierProvider<CartNotifier, CartState>(
  (ref) => CartNotifier(
    ref.watch(cartApiService),
  ),
);

final addressBokkProvider =
    StateNotifierProvider<AddressBookNotifier, AddressBookState>(
  (ref) => AddressBookNotifier(
    ref.watch(addressApiService),
  ),
);

// final addnewaddressProvider =
//     FutureProvider.family<Future<void>, Map<String, String?>>(
//   (ref, mp) {
//     final apiRespository = ref.watch(addressApiService);

//     return apiRespository.addnewaddress(mp);
//   },
// );

// final addressListProvider = FutureProvider.family<List<Address>?, String?>(
//   (ref, number) {
//     final apiRespository = ref.watch(addressApiService);

//     return apiRespository.fetchalladdressbyid(number);
//   },
// );

final selectedAddressProvider =
    FutureProvider.family<SelectedAddress?, String?>(
  (ref, number) {
    final apiRespository = ref.watch(addressApiService);

    return apiRespository.fetchselectedaddress(number);
  },
);

final createuserProvider = FutureProvider.family<void, String?>(
  (ref, number) {
    final apiRespository = ref.watch(userApiService);

    return apiRespository.createuserifnotexist(number);
  },
);

// final updatecartitem = FutureProvider.family<void, Map<String, String>>(
//   (ref, mp) {
//     final apiRespository = ref.watch(cartApiService);

//     return apiRespository.addorupdateProduct(mp);
//   },
// );

final yourordersProvider = FutureProvider.family<List<Orders>?, String>(
  (ref, userid) {
    final apiRespository = ref.watch(orderApiService);

    return apiRespository.getOrdersbyId(userid);
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

final categoriesProvider = FutureProvider.family<List<Category>?, String>(
  (ref, mainCategoryId) {
    final apiRespository = ref.watch(categoryApiService);

    return apiRespository.getCategory(mainCategoryId);
  },
);

// final cartItemProvider = FutureProvider.family<List<CartItem>?, String?>(
//   (ref, userid) {
//     final apiRespository = ref.watch(cartApiService);

//     return apiRespository.getCartItem(userid);
//   },
// );

final productByidProvider = FutureProvider.family<ProductItem?, String>(
  (ref, productid) {
    final apiRespository = ref.watch(authApiService);

    return apiRespository.getproductDetail(productid);
  },
);

// final cartItemUpdateProvider =
//     FutureProvider.family<Product?, Map<String, dynamic>>(
//   (ref, cartitemdet) {
//     final apiRespository = ref.watch(cartApiService);

//     apiRespository.updateCartitemquantity(cartitemdet);
//     return null;
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

final allProductProvider = FutureProvider<List<Product>?>(
  (ref) {
    final apiRespository = ref.watch(productApiService);

    return apiRespository.getAllProduct();
  },
);
final allOfferProvider =
    FutureProvider.autoDispose.family<List<Offer>?, Map<String, String>>(
  (ref, map) {
    final apiRespository = ref.watch(offerApiService);
    print("inside all of provider ${apiRespository.getAllOffers(map)}");
    return apiRespository.getAllOffers(map);
  },
);

// final connectivity Provider
// final connect = ChangeNotifierProvider((ref) {
//   final connectivityRepo = ref.watch(connectService);
//   return connectivityRepo.startMonitoring();
// });
