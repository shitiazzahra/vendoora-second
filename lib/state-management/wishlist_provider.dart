import 'package:flutter/material.dart';

// data class, acuan satu' nya
class WishlistItem {
  final String id;
  final String title;
  final int price;
  final String image;

  WishlistItem(this.image, {required this.id, required this.title, required this.price});
}

class WishlistProvider with ChangeNotifier {
  // setter
  final Map<String, WishlistItem> _wishlistItems = {};

  // getter
  Map<String, WishlistItem> get wishlistItems => _wishlistItems;

  // getter
  int get itemCount => _wishlistItems.length;

  void addItemToFav (String id, String title, int price, String image) {
    if (_wishlistItems.containsKey(id)) {
      // jika sudah ada item yg ditambahkan ke wishlist
      return;
    } else {
      // untuk kalau gaada item di keranjang
      _wishlistItems.putIfAbsent(
        id,
        () => WishlistItem(image, id: id, title: title, price: price)
      );
    }
    notifyListeners();
  }

  void removeItemFromFav (String id) {
    _wishlistItems.remove(id);
    notifyListeners();
  }

  // untuk memebersihkan cache, jd buat perfoma biar cepat
  void clearWishlist() {
    _wishlistItems.clear();
    notifyListeners();
  }
}