import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:skl_ecommerce_2/consts.dart';
import 'package:skl_ecommerce_2/state-management/cart_provider.dart';
import 'package:skl_ecommerce_2/state-management/theme_provider.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // inisialisasi provider
    final cartProvider = Provider.of<CartProvider>(context);
    final themeProvider = Provider.of<ThemeProvider>(context);

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(Icons.arrow_back_ios,
                color:
                    themeProvider.isDarkTheme ? Colors.white : Colors.black)),
        title: const Text('Order'),
        centerTitle: true,
      ),
      // ternary operator
      body: cartProvider.items.isEmpty
          ? const Center(child: Text('Your cart is empty'))
          : ListView.builder(
              itemCount: cartProvider.items.length,
              itemBuilder: (context, index) {
                final cartItem = cartProvider.items.values.toList()[index];
                return Card(
                  margin:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  elevation: 5, // Adds a shadow
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12), // Rounded corners
                  ),
                  child: ListTile(
                    contentPadding: const EdgeInsets.symmetric(
                        vertical: 12, horizontal: 16),
                    leading: CircleAvatar(
                      backgroundImage: AssetImage(cartItem.image),
                      radius: 28, // Larger avatar for a more prominent look
                    ),
                    title: Text(
                      cartItem.title,
                      style: const TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 16),
                    ),
                    subtitle: Text(
                      'Quantity: ${cartItem.quantity}',
                      style: TextStyle(color: Colors.grey[600]),
                    ),
                    trailing: IconButton(
                      icon: Icon(Icons.delete,
                          color: themeProvider.isDarkTheme
                              ? Colors.grey[500]
                              : Colors.black),
                      onPressed: () {
                        cartProvider.removeItem(cartItem.id);
                      },
                    ),
                  ),
                );
              }),
      bottomNavigationBar: Container(
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 20),
        decoration: BoxDecoration(
          color: themeProvider.isDarkTheme ? Colors.grey[700] : Colors.white,
          borderRadius: BorderRadius.circular(15), // Soft rounded corners
          boxShadow: [
            BoxShadow(
              color: Colors.black
                  .withOpacity(0.1), // Lighter shadow for a floating effect
              spreadRadius: 2,
              blurRadius: 8,
              offset: const Offset(0, 4), // Slight downward shadow for depth
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Total:",
              style: TextStyle(
                fontSize: 22,
                fontWeight:
                    FontWeight.w600, // Slightly lighter weight for elegance
                color: themeProvider.isDarkTheme
                    ? Colors.white
                    : Colors.grey[900], // A softer black color
              ),
            ),
            Text(
              "${cartProvider.totalPrice}",
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.w600,
                color: themeProvider.isDarkTheme
                    ? Colors.blue[200]
                    : primaryColor, // Your chosen brand color
              ),
            ),
          ],
        ),
      ),
    );
  }
}
