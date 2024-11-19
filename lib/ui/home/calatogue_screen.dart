import 'package:skl_ecommerce_2/consts.dart';
import 'package:skl_ecommerce_2/models/product.dart';
import 'package:skl_ecommerce_2/ui/detail/detail_screen.dart';
import 'package:skl_ecommerce_2/ui/home/components/button_nav_bar.dart';
import 'package:skl_ecommerce_2/ui/home/components/categories.dart';
import 'package:skl_ecommerce_2/ui/home/components/item_card.dart';
import 'package:flutter/material.dart';
import 'package:skl_ecommerce_2/ui/profile/profile_screen.dart';
import 'package:skl_ecommerce_2/ui/settings/settings_screen.dart';
import 'package:skl_ecommerce_2/ui/wishlist/wishlist.dart';

class CatalogueScreen extends StatefulWidget {
  const CatalogueScreen({super.key});

  @override
  State<CatalogueScreen> createState() => _CatalogueScreenState();
}

class _CatalogueScreenState extends State<CatalogueScreen> {
  int _selectedIndex = 0;

  //Langkah Implementasi State Management
  // - Devinisikan library pada pubspec.yaml
  // - Tambahkan ChangeNotifier pada file terkait
  // - Adjust main.dart

  // daftar tampilan untuk setiap tab
  // ini buat option condition (else)
  final List<Widget> _widgetOptions = [
    const CatalogueScreen(), //Home
    WishlistScreen(), //Wishlist
    const SettingsScreen(), // Settings
    const ProfileScreen(), // Profile
  ];

  // buat ketika di tap dan beerdasarkan index yg aktif
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        elevation: 0,
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.search)),
          IconButton(
              onPressed: () {}, icon: const Icon(Icons.shopping_cart_outlined))
        ],
      ),
      // ternary operator
      // untuk nampilin catalog screen == kondisi
      body: _selectedIndex == 0
      // ? penghubung kalau kondisi true
          ? Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: defaultPadding),
                  child: Text(
                    "Women",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
                  ),
                ),
                const Categories(),
                Expanded(
                    child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: defaultPadding),
                  child: GridView.builder(
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            mainAxisSpacing: defaultPadding,
                            crossAxisSpacing: defaultPadding,
                            childAspectRatio: 0.75),
                    itemCount: product.length,
                    itemBuilder: (context, index) => ItemsCard(
                        product: product[index],
                        press: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => DetailScreen(product: product[index])))),
                  ),
                )
                )
              ],
            )
            // kalau kondisi else
          : _widgetOptions[_selectedIndex], // Tampilan widget berdasarkan index
      bottomNavigationBar: BottomNavBar(
        selectedIndex: _selectedIndex,
        onItemTapped: _onItemTapped,
      ),
    );
  }
}
