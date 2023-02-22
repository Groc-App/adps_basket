import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:your_basket/models/cart/cart.dart';
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

    var cartdata = await _apiService.getCartitemsApi();
    print("This is cartdata from Cart Notifier $cartdata");
    state = state.copyWith(cartModel: cartdata);
    state = state.copyWith(isLoading: false);
  }

  Future<void> addCartItems(number, productId) async {
    await _apiService.addCartItem(number, productId);

    await getCartitems();
  }

  Future<void> removeCartItems(userid, productid) async {
    // print('inside removeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee');
    // print('inside remove cart item ${productid}');

    await _apiService.removeCartItem(userid, productid);

    var isCartItemExist = state.cartModel!.products
        .firstWhere((prd) => prd.Item.productId == productid);

    // print('\ncartitttttttttttttttttttttttemm');
    // print(isCartItemExist);

    var updatedItems = state.cartModel!.products.toList();
    // print('\ndebugginggggggggggggg\n');
    // print(updatedItems);
    // print('\ndebugginggggggggggggg doneeeeeeeeeeeeeee\n');

    updatedItems.remove(isCartItemExist);
    // print('\nafter deletingggggggggggggggggggggggg\n');
    // print(updatedItems);

    // print('\n brfore doneeeeeeeeeeeeeee\n');

    Cart newcart =
        new Cart(Number: state.cartModel!.Number, products: updatedItems);

    state = state.copyWith(cartModel: newcart);
    // print(state.cartModel!.products);
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
  }

  Future<void> placeOrder(number, tamount, productList, addressmap) async {
    print('In place order');
    print('$number\n');
    print('$tamount\n');
    print('$productList\n');

    print('hiii');

    await _apiService.placeorder(number, tamount, productList, addressmap);

    print('hiii 22');

    var updatedItems = state.cartModel!.products.toList();

    print('before deleting $updatedItems');

    updatedItems.clear();

    print('after deleting $updatedItems');

    Cart newcart =
        new Cart(Number: state.cartModel!.Number, products: updatedItems);

    state = state.copyWith(cartModel: newcart);
  }
}
