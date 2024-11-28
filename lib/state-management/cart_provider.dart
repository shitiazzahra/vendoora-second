import 'package:flutter/material.dart';

class CartItem {
  final String id;
  final String title;
  final int price;
  final String image;
  int quantity;

  // untuk nyimpen data yg mau dipanggil
  CartItem({
    required this.id, 
    required this.title, 
    required this.price, 
    required this.image, 
    // default quantity value
    this.quantity = 1
    });
}

// to knowing what's the differences betweenn OOP and FV (functional programming)
class CartProvider with ChangeNotifier {
  Map<String, CartItem> _items = {};

  Map<String, CartItem> get items => _items;

  // handle perhitungan total price yg ada di keranjang
  int get totalPrice {
    return _items.values.fold(
      // initial status sebelum operasi matematika dilakukan
      0,
      // ini operasi nya
      // sum untuk menandakan proses pertambahan
      (sum, item) => sum + item.price * item.quantity
    );
  }

  void addItem(String id, String title, int price, String image, int quantity) {
    // menambah item ke keranjang dgn jumlah yg ditentukan dari cart counter
    if (_items.containsKey(id)) {
      // bahwa var yg ga null
      // ! jd untuk null safety disini
      _items[id]!.quantity += quantity; // kalau quantitas lebih/sama dgn 1
    } else {
      _items[id] = CartItem(id: id, title: title, price: price, image: image, quantity: quantity);
    }
    notifyListeners();
  }

  void removeItem(String id) {
    if (_items.containsKey(id)) {
      _items[id]!.quantity--; // ini hapus dari keranjang satu satu
    
    if (_items[id]!.quantity <= 0) { // jika kuantitas di keranjang menjadi 0, maka hapus item dari keranjang
      _items.remove(id);
    }
  }
  notifyListeners();
  }
}