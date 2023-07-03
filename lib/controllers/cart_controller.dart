import 'package:datum/models/cart_item.dart';
import 'package:get/get.dart';

class CartController extends GetxController {
  List<CartItem> _cartItems = [];

  List<CartItem> get cartItems => _cartItems;

  ///
  /// Add/Update to cart
  addUpdateToCart(CartItem item) {
    bool alreadyAddedItem = false;

    for (int i = 0; i < _cartItems.length; i++) {
      // Check if already added
      if (cartItems.elementAt(i).itemName == item.itemName) {
        alreadyAddedItem = true;
        // Item already exist - Update
        cartItems[i] = item;
        break;
      }
    }

    if (!alreadyAddedItem) {
      // Item doesn't exist in cart - Add
      _cartItems.add(item);
    }

    update();
  }

  /// Delete cart item action
  deleteCartItem(index) {
    _cartItems.removeAt(index);
    update();
  }

  ///
  /// Calculate Cart Total
  double cartTotal() {
    double total = 0.0;

    for (int i = 0; i < cartItems.length; i++) {
      total = total + cartItems.elementAt(i).total;
    }

    return total;
  }
}
