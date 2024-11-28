import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:skl_ecommerce_2/state-management/theme_provider.dart';
import 'package:skl_ecommerce_2/state-management/wishlist_provider.dart';

class WishlistScreen extends StatelessWidget {
  const WishlistScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final wishlistProvider = Provider.of<WishlistProvider>(context);
    final themeProvider = Provider.of<ThemeProvider>(context);

    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: const Icon(Icons.arrow_back_ios),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          title: const Text("Wishlist"),
          centerTitle: true,
        ),
        body: wishlistProvider.wishlistItems.isEmpty
            ? const Center(child: Text("Your wishlist is empty!"))
            : ListView.builder(
                itemCount: wishlistProvider.wishlistItems.length,
                itemBuilder: (context, index) {
                  final wishlistItem =
                      wishlistProvider.wishlistItems.values.toList()[index];
                  return Container(
                    margin:
                        const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
                    decoration: BoxDecoration(
                      color: themeProvider.isDarkTheme ? Colors.black : Colors.white,
                      borderRadius: BorderRadius.circular(12),
                      boxShadow: [
                        BoxShadow(
                          color: themeProvider.isDarkTheme ? Colors.white.withOpacity(0.1) : Colors.grey.withOpacity(0.1),
                          blurRadius: 5,
                          spreadRadius: 2,
                          offset: const Offset(0, 3),
                        ),
                      ],
                    ),
                    child: ListTile(
                      contentPadding:
                          const EdgeInsets.symmetric(vertical: 10, horizontal: 12),
                      leading: CircleAvatar(
                        backgroundImage: AssetImage(wishlistItem.image),
                        radius: 25,
                      ),
                      title: Text(
                        wishlistItem.title,
                        style: const TextStyle(
                            fontWeight: FontWeight.w500, fontSize: 16),
                      ),
                      trailing: IconButton(
                        icon: Icon(Icons.delete, color: themeProvider.isDarkTheme ? Colors.grey[400] : Colors.black),
                        onPressed: () {
                          wishlistProvider.removeItemFromFav(wishlistItem.id);
                        },
                      ),
                    ),
                  );
                }));
  }
}
