import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:skl_ecommerce_2/consts.dart';
import 'package:skl_ecommerce_2/models/products.dart';
import 'package:skl_ecommerce_2/state-management/theme_provider.dart';

class ProductTitle extends StatelessWidget {
  const ProductTitle({super.key, required this.product});
  final Product product;

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    final Size size = MediaQuery.of(context).size;

    // definisikan ukuran proposional gambar sebagai variable const
    const double imageWidthRatio = 0.60; // 60% dari lebar layar
    const double imageHeightRatio = 0.28; // dambir 28% dari tinggi latar
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: defaultPadding),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start, // Aligns text to the start
        children: [
           Text(
            "High Value Parfume", // Static title
            style: TextStyle(color: themeProvider.isDarkTheme ? Colors.grey[900] : Colors.white),
          ),
          Text(
            product.title, // Dynamic product title
            style: TextStyle(
              color: themeProvider.isDarkTheme ? Colors.grey[900] : Colors.white,
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: defaultPadding),
          Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Price",
                      style: TextStyle(color: themeProvider.isDarkTheme ? Colors.grey[900] : Colors.white),
                    ),
                    Text(
                      "${product.price}",
                      style: TextStyle(
                        color: themeProvider.isDarkTheme ? Colors.grey[900] : Colors.white,
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              // ini buat efek
              Hero(
                tag: "${product.id}",
                child: Image.asset(
                  product.image,
                  width: size.width * imageWidthRatio, // gunakan rasio untuk lebar gambar
                  height: size.height * imageHeightRatio, // gunakan rasio untuk  tinggi gambar
                  fit: BoxFit.contain, // Ensure proper scaling
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}