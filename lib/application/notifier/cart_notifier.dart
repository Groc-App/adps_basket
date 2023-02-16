import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:your_basket/models/cart/cartitem.dart';

import '../../Services/cart_api_service.dart';
import '../state/cart_state.dart';

class CartNotifier extends StateNotifier<CartState> {
  final APIServiceCart _apiService;

  CartNotifier(this._apiService) : super(const CartState()) {
    getCartitems();
  }

  Future<void> getCartitems() async {
    state = state.copyWith(isLoading: true);

    final cartdata = await _apiService.getCartitemsApi();
    print("This is cartdata from Cart Notifier $cartdata");
    state = state.copyWith(cartModel: cartdata);
    state = state.copyWith(isLoading: false);
  }

  Future<void> addCartItems(number, productId) async {
    await _apiService.addCartItem(number, productId);

    await getCartitems();
  }

  Future<void> removeCartItems(userid, productid) async {
    print('inside removeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee');
    print('inside remove cart item ${productid}');

    // var cartItem = state.cartModel!.products
    //     .firstWhere((element) => element.Item.productId == productid);

    // var cartItem;
    // var data = state.cartModel!.products;
    // for (int i = 0; i < data.length; i++) {
    //   if (data[i].Item.productId == productid) {
    //     cartItem = data[i];
    //     state.cartModel!.products.remove(cartItem);
    //     break;
    //   }
    // }

    // var updatedItems = state.cartModel!.products;

    await _apiService.removeCartItem(userid, productid).whenComplete(() async {
      print('after removingggggggggggggggg');
      await getCartitems();
    });

    // Future.delayed(Duration(milliseconds: 800){
    //
    // });

    // updatedItems.remove(cartItem);
  }

  Future<void> updateCartItem(number, qty, prductId) async {
    var cartItem = state.cartModel!.products
        .firstWhere((element) => element.Item.productId == prductId);

    var updatedItems = state.cartModel!.products;

    await _apiService.updatecartitem(number, qty, prductId);
    CartItem cartProduct = CartItem(Item: cartItem.Item, ItemCount: int.parse(qty));

    updatedItems.remove(cartItem);
    updatedItems.add(cartProduct);

    // await getCartitems();
  }
}
