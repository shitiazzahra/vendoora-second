import 'package:provider/provider.dart';
import 'package:skl_ecommerce_2/consts.dart';
import 'package:skl_ecommerce_2/models/products.dart';
import 'package:skl_ecommerce_2/state-management/theme_provider.dart';
import 'package:skl_ecommerce_2/ui/detail/detail_screen.dart';
import 'package:skl_ecommerce_2/ui/home/components/button_nav_bar.dart';
import 'package:skl_ecommerce_2/ui/home/components/carousel.dart';
import 'package:skl_ecommerce_2/ui/home/components/categories.dart';
import 'package:skl_ecommerce_2/ui/home/components/item_card.dart';
import 'package:flutter/material.dart';
import 'package:skl_ecommerce_2/ui/profile/profile_screen.dart';
import 'package:skl_ecommerce_2/ui/settings/settings_screen.dart';
import 'package:skl_ecommerce_2/ui/wishlist/wishlist_screen.dart';

class CatalogueScreen extends StatefulWidget {
  const CatalogueScreen({super.key});

  @override
  State<CatalogueScreen> createState() => _CatalogueScreenState();
}

class _CatalogueScreenState extends State<CatalogueScreen> {
  int _selectedIndex = 0;

  // daftar tampilan untuk setiap tab
  // ini buat option condition (else)
  final List<Widget> _widgetOptions = [
    const CatalogueScreen(), //Home
    const WishlistScreen(), //Wishlist
    const SettingsScreen(), // Settings
    const ProfileScreen(), // Profile
  ];

  // buat ketika di tap dan berdasarkan index yg aktif
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);

    return Scaffold(
      // menyatakan bahwa initial akan menampilkan object yg berada pada index ke 0
      appBar: _selectedIndex == 0
          ? AppBar(
              automaticallyImplyLeading: false,
              backgroundColor:
                  themeProvider.isDarkTheme ? Colors.black : Colors.white,
              elevation: 0,
              title: TextField(
                decoration: InputDecoration(
                  prefixIcon: const Icon(Icons.search, color: Colors.grey),
                  hintText: "Search the entire shop",
                  hintStyle: const TextStyle(color: Colors.grey),
                  filled: true,
                  fillColor: themeProvider.isDarkTheme
                      ? Colors.grey[900]
                      : Colors.white,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: BorderSide(
                      color: themeProvider.isDarkTheme
                          ? Colors.grey[700]!
                          : Colors.grey[400]!,
                      width: 1.5,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: BorderSide(
                      color: themeProvider.isDarkTheme
                          ? Colors.blueGrey
                          : Colors.blue,
                      width: 2,
                    ),
                  ),
                  contentPadding: const EdgeInsets.symmetric(
                      vertical: 10), // Tinggi internal
                ),
              ),
              centerTitle: false,
              actions: [
                IconButton(
                  onPressed: () {
                    Navigator.pushNamed(context, "/cart");
                  },
                  icon: Icon(Icons.shopping_cart_outlined,
                      color: themeProvider.isDarkTheme
                          ? Colors.grey
                          : Colors.black),
                ),
              ],
            )
          : null,
      // ternary operator
      // untuk nampilin catalog screen == kondisi
      // ? penghubung kalau kondisi true
      body: _selectedIndex == 0
          ? Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
              child: SingleChildScrollView(
                //---- ini tambahin courasel
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const ImageCarousel(),
                    const SizedBox(height: defaultPadding),
                    // Banner Section
                    Container(
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: themeProvider.isDarkTheme
                            ? Colors.blue[200]
                            : Colors.blue[50],
                        borderRadius: BorderRadius.circular(12),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.1),
                            blurRadius: 8,
                            offset: const Offset(0, 4),
                          ),
                        ],
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Special Offer!",
                                  style: TextStyle(
                                    color: Colors.blueAccent,
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                SizedBox(height: 4),
                                Text(
                                  "Delivery is 50% cheaper today.",
                                  style: TextStyle(
                                    color: Colors.black54,
                                    fontSize: 14,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Image.network(
                            'https://cdn-icons-png.flaticon.com/512/897/897377.png',
                            height: 50,
                          ),
                        ],
                      ),
                    ),

                    // Categories Section
                    const Categories(),

                    // Product Grid Section
                    GridView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        mainAxisSpacing: 16,
                        crossAxisSpacing: 16,
                        childAspectRatio: 0.75,
                      ),
                      itemCount: product.length,
                      itemBuilder: (context, index) => Container(
                        decoration: BoxDecoration(
                          color: themeProvider.isDarkTheme
                              ? Colors.grey[900]
                              : Colors.white,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: ItemsCard(
                          product: product[index],
                          press: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  DetailScreen(product: product[index]),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
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
