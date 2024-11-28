import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:skl_ecommerce_2/consts.dart';
import 'package:skl_ecommerce_2/state-management/theme_provider.dart';

class BottomNavBar extends StatelessWidget {
  final int selectedIndex;
  final ValueChanged<int> onItemTapped;

  const BottomNavBar(
      {super.key, required this.selectedIndex, required this.onItemTapped});

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);

    return BottomNavigationBar(
  items: const <BottomNavigationBarItem>[
    BottomNavigationBarItem(
      icon: Icon(Icons.home),
      label: 'Home',
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.favorite),
      label: 'Wishlist',
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.settings),
      label: 'Settings',
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.person),
      label: 'Profile',
    ),
  ],
  currentIndex: selectedIndex,
  selectedItemColor: primaryColor,
  unselectedItemColor: Colors.grey,
  backgroundColor: themeProvider.isDarkTheme ? Colors.grey[900] : Colors.white,
  elevation: 10,
  type: BottomNavigationBarType.fixed,
  onTap: onItemTapped,
  selectedIconTheme: const IconThemeData(size: 30),  // Ukuran ikon saat dipilih
  unselectedIconTheme: const IconThemeData(size: 24),  // Ukuran ikon saat tidak dipilih
);
  }
}
