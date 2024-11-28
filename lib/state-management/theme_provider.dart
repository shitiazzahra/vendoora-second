import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

// ini pakai ChangeNotifier si pewaris nya itu
// extends itu pewarisan
// mengimplementasikan konsep OOP -> Inheritance
class ThemeProvider extends ChangeNotifier {
  // ini setter
  // buat di pakai di file ini aja (private)
  bool _isDarkTheme = false;

  ThemeProvider() {
    // untuk melakukan perubahan tema
    _loadTheme();
  }

  // ini getter
  // bisa dipakai di file lain (public)
  bool get isDarkTheme => _isDarkTheme;

  // void nilai kembalian yg ga punya nilai return
  // async bisa jalanin proses bersamaan
  // pakein is buat var bool
  void toggleTheme(bool isDark) async {
    // ini buat handle perubahan code secara bersamaan.
    SharedPreferences prefs = await SharedPreferences.getInstance();
    _isDarkTheme = isDark;
    await prefs.setBool("isdarkTheme", isDark);
    // record activity yg terjadi di state management
    notifyListeners();
  }

  void _loadTheme() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    // ?? Elvis Operator untuk define default di variable kita (untuk menghindari NPE Null Pointer Exception)
    _isDarkTheme = prefs.getBool("isdarkTheme") ?? false;
    notifyListeners();
  }
}