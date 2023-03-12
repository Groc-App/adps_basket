import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:your_basket/models/cart/cart.dart';
import 'package:your_basket/models/cart/cartitem.dart';

import '../../Services/cart_api_service.dart';
import '../../providers/providers.dart';
import '../state/cart_state.dart';

class CartNotifier extends StateNotifier<CartState> {
  final APIServiceCart _apiService;
  String phonenumber;

  CartNotifier(this._apiService, this.phonenumber) : super(const CartState()) {
    getCartitems(phonenumber);
  }

  Future<void> getCartitems(String number) async {
    state = state.copyWith(isLoading: true);

    var cartdata = await _apiService.getCartitemsApi(number);
    print("This is cartdata from Cart Notifier $cartdata");
    state = state.copyWith(cartModel: cartdata);
    state = state.copyWith(isLoading: false);
  }

  Future<void> addCartItems(number, productId) async {
    await _apiService.addCartItem(number, productId);

    await getCartitems(number);
  }

  Future<void> removeCartItems(userid, productid) async {
    await _apiService.removeCartItem(userid, productid);

    var isCartItemExist = state.cartModel!.products
        .firstWhere((prd) => prd.Item.productId == productid);

    var updatedItems = state.cartModel!.products.toList();

    updatedItems.remove(isCartItemExist);

    Cart newcart =
        new Cart(Number: state.cartModel!.Number, products: updatedItems);

    state = state.copyWith(cartModel: newcart);

    // await getCartitems();
  }

  Future<void> updateCartItem(number, qty, prductId) async {
    await _apiService.updatecartitem(number, qty, prductId);

    var isCartItemExist = state.cartModel!.products
        .firstWhere((prd) => prd.Item.productId == prductId);
    CartItem cartProduct =
        CartItem(Item: isCartItemExist.Item, ItemCount: int.parse(qty));
    var updatedItems = state.cartModel!.products.toList();
    updatedItems.remove(isCartItemExist);
    updatedItems.add(cartProduct);
    Cart newcart =
        new Cart(Number: state.cartModel!.Number, products: updatedItems);
    state = state.copyWith(cartModel: newcart);

    await getCartitems(number);
  }

  Future<void> placeOrder(number, tamount, productList, addressmap) async {
    await _apiService.placeorder(number, tamount, productList, addressmap);

    var updatedItems = state.cartModel!.products.toList();

    updatedItems.clear();

    Cart newcart =
        new Cart(Number: state.cartModel!.Number, products: updatedItems);

    state = state.copyWith(cartModel: newcart);
  }
}
