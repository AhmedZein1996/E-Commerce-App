import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Product with ChangeNotifier {
  final String productId;
  final String title, description;
  final List<String> images;
  final List<Color> colors;
  final double rating, price;
  bool isFavorite, isPopular;

  Product({
    @required this.productId,
    @required this.images,
    @required this.colors,
    @required this.title,
    @required this.price,
    @required this.description,
    this.rating = 0.0,
    this.isFavorite = false,
    this.isPopular = false,
  });
  void toggleFavoriteStatus() async {
    var oldFavoriteStatus = isFavorite;
    isFavorite = !isFavorite;
    notifyListeners();
    final url =
        'https://grad-project-eef28-default-rtdb.firebaseio.com/userFavorites/$productId.json';
    try {
      final response = await http.put(url, body: json.encode(isFavorite));
      if (response.statusCode >= 400) {
        isFavorite = oldFavoriteStatus;
        notifyListeners();
        // throw HttpException(message: 'Could not change favorite status.');
      }
    } catch (error) {
      isFavorite = oldFavoriteStatus;
      notifyListeners();
      // throw HttpException(message: 'Could not change favorite status.');
    }
  }
}

// Our demo Products

class Products with ChangeNotifier {
  List<Product> _products = [
//    Product(
//      id: 1,
//      images: [
//        "assets/images/ps4_console_white_1.png",
//        "assets/images/ps4_console_white_2.png",
//        "assets/images/ps4_console_white_3.png",
//        "assets/images/ps4_console_white_4.png",
//      ],
//      colors: [
//        Color(0xFFF6625E),
//        Color(0xFF836DB8),
//        Color(0xFFDECB9C),
//        Colors.white,
//      ],
//      title: "Wireless Controller for PS4™",
//      price: 64.99,
//      description: description,
//      rating: 4.8,
//      isFavorite: true,
//      isPopular: true,
//    ),
//    Product(
//      id: 2,
//      images: [
//        "assets/images/Image Popular Product 2.png",
//      ],
//      colors: [
//        Color(0xFFF6625E),
//        Color(0xFF836DB8),
//        Color(0xFFDECB9C),
//        Colors.white,
//      ],
//      title: "Nike Sport White - Man Pant",
//      price: 50.5,
//      description: description,
//      rating: 4.1,
//      isPopular: true,
//    ),
//    Product(
//      id: 3,
//      images: [
//        "assets/images/glap.png",
//      ],
//      colors: [
//        Color(0xFFF6625E),
//        Color(0xFF836DB8),
//        Color(0xFFDECB9C),
//        Colors.white,
//      ],
//      title: "Gloves XC Omega - Polygon",
//      price: 36.55,
//      description: description,
//      rating: 4.1,
//      isFavorite: true,
//      isPopular: true,
//    ),
//    Product(
//      id: 4,
//      images: [
//        "assets/images/wireless headset.png",
//      ],
//      colors: [
//        Color(0xFFF6625E),
//        Color(0xFF836DB8),
//        Color(0xFFDECB9C),
//        Colors.white,
//      ],
//      title: "Logitech Head",
//      price: 20.20,
//      description: description,
//      rating: 4.1,
//      isFavorite: true,
//      isPopular: true,
//    ),
//    Product(
//      id: 5,
//      images: [
//        "assets/images/bagpack.png",
//      ],
//      colors: [
//        Color(0xFFF6625E),
//        Color(0xFF836DB8),
//        Color(0xFFDECB9C),
//        Colors.white,
//      ],
//      title: "Bagpack",
//      price: 25.90,
//      description: description,
//      rating: 4.4,
//      isFavorite: true,
//      isPopular: true,
//    ),
//    Product(
//      id: 6,
//      images: [
//        "assets/images/violin.png",
//      ],
//      colors: [
//        Color(0xFFF6625E),
//        Color(0xFF836DB8),
//        Color(0xFFDECB9C),
//        Colors.white,
//      ],
//      title: "Violin",
//      price: 49.99,
//      description: description,
//      rating: 4.7,
//      isFavorite: false,
//      isPopular: true,
//    ),
//    Product(
//      id: 7,
//      images: [
//        "assets/images/cooking_pan.png",
//      ],
//      colors: [
//        Color(0xFFF6625E),
//        Color(0xFF836DB8),
//        Color(0xFFDECB9C),
//        Colors.white,
//      ],
//      title: "cooking pan",
//      price: 44.99,
//      description: description,
//      rating: 4.3,
//      isFavorite: true,
//      isPopular: true,
//    ),
//    Product(
//      id: 8,
//      images: [
//        "assets/images/headphones.png",
//      ],
//      colors: [
//        Color(0xFFF6625E),
//        Color(0xFF836DB8),
//        Color(0xFFDECB9C),
//        Colors.white,
//      ],
//      title: "Headphone",
//      price: 30.99,
//      description: description,
//      rating: 4.2,
//      isFavorite: false,
//      isPopular: true,
//    ),
//    Product(
//      id: 9,
//      images: [
//        "assets/images/kettle.png",
//      ],
//      colors: [
//        Color(0xFFF6625E),
//        Color(0xFF836DB8),
//        Color(0xFFDECB9C),
//        Colors.white,
//      ],
//      title: "Kettle",
//      price: 19.99,
//      description: description,
//      rating: 4.0,
//      isFavorite: true,
//      isPopular: true,
//    ),
  ];

  Future<void> fetchProducts() async {
    var url =
        'https://grad-project-eef28-default-rtdb.firebaseio.com/products.json';
    try {
      final response = await http.get(url);
      print(response.body);
      final fetchedData = json.decode(response.body) as Map<String, dynamic>;
      if (fetchedData == null) {
        return;
      }
      url =
          'https://grad-project-eef28-default-rtdb.firebaseio.com/userFavorites/.json';
      final favoriteResponse = await http.get(url);
      final favoriteData = json.decode(favoriteResponse.body);
      final List<Product> _loadedProducts = [];
      fetchedData.forEach((productId, product) {
        _loadedProducts.add(
          Product(
            productId: productId,
            title: product['title'],
            description: product['description'],
            price: product['price'],
            images: [
              product['imageUrl'],
            ],
            colors: [
              Color(0xFFF6625E),
              Color(0xFF836DB8),
              Color(0xFFDECB9C),
              Colors.white,
            ],
            isPopular: true,
            isFavorite:
                favoriteData == null ? false : favoriteData[productId] ?? false,
          ),
        );
      });
      _products = _loadedProducts;
      notifyListeners();
    } catch (error) {
      throw error;
    }
  }

  List<Product> get allProducts {
    return [..._products];
  }

  List<Product> get favoritesProducts {
    return _products.where((product) => product.isFavorite).toList();
  }

  void removeFromFavorites() {
    notifyListeners();
  }
}

const String description =
    "Wireless Controller for PS4™ gives you what you want in your gaming from over precision control your games to sharing …";
