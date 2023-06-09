import 'package:flutter/foundation.dart';

import 'product.dart';

class CartItem {
  final String id;
  final String title;
  final double price;
  final List<String> images;
  int quantity;

  CartItem({
    @required this.id,
    @required this.title,
    @required this.price,
    @required this.images,
    this.quantity = 0,
  });
}

class Cart with ChangeNotifier {
  Map<String, CartItem> _items = {};

  Map<String, CartItem> get items {
    return {..._items};
  }

  int get itemsCount {
    return _items.length;
  }

  String get totalAmount {
    double total = 0.0;
    _items.forEach((key, cartItem) {
      total += cartItem.price * cartItem.quantity;
    });
    return total.toStringAsFixed(2);
  }

  void addItemToCart(String key, String title, double price, dynamic images) {
    _items.putIfAbsent(
      key,
      () => CartItem(
          id: DateTime.now().toString(),
          title: title,
          price: price,
          images: images,
          quantity: 1),
    );
    notifyListeners();
  }

  void increaseQuantity(String key) {
    if (_items.containsKey(key)) {
      // Change Quantity Only... Add one item to exist product
      if (_items[key].quantity < 100) {
        _items.update(
          key,
          (oldCartItem) => CartItem(
              id: oldCartItem.id,
              title: oldCartItem.title,
              price: oldCartItem.price,
              images: oldCartItem.images,
              quantity: oldCartItem.quantity + 1),
        );
      } else {
        return;
      }
    }
    notifyListeners();
  }

  void decreaseQuantity(String key) {
    if (!_items.containsKey(key)) {
      return;
    }
    // Change Quantity Only... remove one item from exist product
    if (_items[key].quantity > 1) {
      _items.update(
        key,
        (oldCartItem) => CartItem(
            id: oldCartItem.id,
            title: oldCartItem.title,
            price: oldCartItem.price,
            images: oldCartItem.images,
            quantity: oldCartItem.quantity - 1),
      );
    } else {
      _items.remove(key);
    }
    notifyListeners();
  }

  int numberOfProductPieces(String key) {
    if (_items.containsKey(key)) {
      return _items[key].quantity;
    } else {
      return 0;
    }
  }

  void updateItemQuantityInputByUser(key, inputQuantity) {
    if (_items.containsKey(key)) {
      _items.update(
        key,
        (oldCartItem) => CartItem(
            id: oldCartItem.id,
            title: oldCartItem.title,
            price: oldCartItem.price,
            images: oldCartItem.images,
            quantity: inputQuantity),
      );
    }
    notifyListeners();
  }

  void removeItem(String key) {
    _items.remove(key);
    notifyListeners();
  }

  void removeSingleItem(String key, Product product) {
    if (!_items.containsKey(key)) {
      return;
    }
    if (_items[key].quantity > 1) {
      _items.update(
        key,
        (oldCartItem) => CartItem(
            id: oldCartItem.id,
            title: oldCartItem.title,
            price: oldCartItem.price,
            images: oldCartItem.images,
            quantity: oldCartItem.quantity - 1),
      );
    } else {
      _items.remove(key);
    }
    notifyListeners();
  }

  bool isInCart(String key) {
    return _items.containsKey(key);
  }

  void clear() {
    _items = {};
    notifyListeners();
  }
}
