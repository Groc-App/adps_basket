import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:your_basket/Services/api_service.dart';
import 'package:your_basket/Services/offer_api_service.dart';
import 'package:your_basket/Services/subscription_api_service.dart';
import 'package:your_basket/models/category/category.dart';
import 'package:your_basket/models/offer/offer.dart';
import 'package:your_basket/models/subscription/subscription.dart';
import '../Services/address_api_service.dart';
import '../Services/cart_api_service.dart';
import '../Services/coupon_api_service.dart';
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
import '../models/user/user.dart';
import 'connectivityProvider.dart';
import '../Services/order_api_service.dart';
import 'package:your_basket/models/orders/orders.dart';
import 'package:firebase_auth/firebase_auth.dart';

final authCheckProvider = StateProvider<User?>((ref) => null);

final cartItemsProvider = StateNotifierProvider<CartNotifier, CartState>(
  (ref) {
    String number;
    var user = ref.watch(authCheckProvider);
    if (user == null) {
      number = '';
    } else {
      number = user.phoneNumber!;
    }
    return CartNotifier(ref.watch(cartApiService), number);
  },
);

final addressBokkProvider =
    StateNotifierProvider<AddressBookNotifier, AddressBookState>(
  (ref) => AddressBookNotifier(
      ref.watch(addressApiService), ref.watch(authCheckProvider)!.phoneNumber),
);

final getrefferalIdProvider = FutureProvider.family<UserN?, String>(
  (ref, number) {
    final apiRespository = ref.watch(userApiService);

    return apiRespository.getrefferalId(number);
  },
);

final checkcouponprovider = FutureProvider.family<String, Map<String, String>>(
  (ref, mp) {
    final apiRespository = ref.watch(couponApiService);

    return apiRespository.checkcoupon(mp);
  },
);
final verifyCouponProvider = FutureProvider<String>(
  (ref) {
    final apiRespository = ref.watch(couponApiService);
    String number;
    var user = ref.watch(authCheckProvider);
    if (user == null) {
      number = '';
    } else {
      number = user.phoneNumber!;
    }

    return apiRespository.verifyReferral(number);
  },
);

final selectedAddressProvider =
    FutureProvider.family<SelectedAddress?, String?>(
  (ref, number) {
    final apiRespository = ref.watch(addressApiService);

    return apiRespository.fetchselectedaddress(number);
  },
);

final createuserProvider = FutureProvider.family<String, Map<String, String?>>(
  (ref, mp) {
    final apiRespository = ref.watch(userApiService);

    return apiRespository.createuserifnotexist(mp);
  },
);

final yourordersProvider = FutureProvider.family<List<Orders>?, String>(
  (ref, userid) {
    print('insideeeeeeeeeeeeeeeeee');
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

final productByidProvider = FutureProvider.family<ProductItem?, String>(
  (ref, productid) {
    final apiRespository = ref.watch(authApiService);

    return apiRespository.getproductDetail(productid);
  },
);

final productsByCategoryProvider =
    FutureProvider.family<List<Product>?, Map<String, String>>(
  (ref, map) {
    final productApiRepository = ref.watch(productApiService);
    return productApiRepository.getAllProdcutsByCategory(map);
  },
);

final allProductProvider = FutureProvider<List<Product>>(
  (ref) {
    final apiRespository = ref.watch(productApiService);

    return apiRespository.getAllProduct();
  },
);

final allOfferProvider =
    FutureProvider.autoDispose.family<List<Offer>?, Map<String, String>>(
  (ref, map) {
    final apiRespository = ref.watch(offerApiService);
    return apiRespository.getAllOffers(map);
  },
);

final subscriptionByUserProvider =
    FutureProvider.autoDispose<List<Subscription>?>(
  (ref) {
    final apiRespository = ref.watch(subscriptionApiService);
    String number;
    var user = ref.watch(authCheckProvider);
    if (user == null) {
      number = '';
    } else {
      number = user.phoneNumber!;
    }
    return apiRespository.getSubscriptionbyUser(number);
  },
);

// final connectivity Provider
// final connect = ChangeNotifierProvider((ref) {
//   final connectivityRepo = ref.watch(connectService);
//   return connectivityRepo.startMonitoring();
// });
