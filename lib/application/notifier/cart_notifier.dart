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

    final cartdata = await _apiService.getCartitems();

    state = state.copyWith(cartModel: cartdata);
    state = state.copyWith(isLoading: false);
  }

  // Future<void> addCartItems(productId, qty) async {
  //   await _apiService.addCartItem(productId, qty);

  //   await getCartitems();
  // }

  // Future<void> removeCartItems(productId, qty) async {
  //   await _apiService.removeCartItem(productId, qty);

  //   await getCartitems();
  // }

  Future<void> updateCartItem(number, qty, prductId) async {
    // var cartItem = state.cartModel!.CartItem
    //     .firstWhere((element) => element.Item.productId == prductId);

    // var updatedItems = state.cartModel;

    await _apiService.updatecartitem(number, qty, prductId);
    // if(cartItem.quantity > 1)
    // {
    //   CartItem cartProduct = new CartItem(Item: cartItem.Item, ItemCount: cartItem.ItemCount)
    // }

    await getCartitems();
  }
}
