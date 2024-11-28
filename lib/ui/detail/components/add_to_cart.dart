import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:skl_ecommerce_2/consts.dart';
import 'package:skl_ecommerce_2/models/products.dart';
import 'package:skl_ecommerce_2/state-management/cart_provider.dart';
import 'package:skl_ecommerce_2/state-management/theme_provider.dart';

class AddToCart extends StatelessWidget {
  const AddToCart({super.key, required this.product, required this.quantity});

  final Product product;
  final int quantity;

  @override
  Widget build(BuildContext context) {
    final cartProvider = Provider.of<CartProvider>(context, listen: false);
    final themeprovider = Provider.of<ThemeProvider>(context);

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: defaultPadding),
      child: Row(
        children: <Widget>[
          Container(
            margin: const EdgeInsets.only(right: defaultPadding),
            height: 50,
            width: 54,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(18),
              border: Border.all(
                color: product.color,
              )
            ),
            child: IconButton(
              icon: const Icon(Icons.add_shopping_cart),
              onPressed: () {
                cartProvider.addItem(
                  // toString data type converter
                  product.id.toString(),
                  product.title,
                  product.price,
                  product.image,
                  quantity
                );
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text("Successfuly add ${product.title} to cart"),
                    duration: const Duration(seconds: 2)
                  )
                );
              }, 
            ),
          ),
          Expanded(
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: product.color,
                maximumSize: const Size.fromHeight(50),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18)
                )
              ),
              onPressed: () {
                cartProvider.addItem(
                  product.id.toString(),
                  product.title,
                  product.price,
                  product.image,
                  quantity
                );
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text("${product.title} is purchased"),
                    duration: const Duration(seconds: 2)
                  )
                );
              }, 
              child: Text(
                "Buy Now",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: themeprovider.isDarkTheme ? Colors.grey[900] : Colors.white
                ),
              )
            ),
          )
        ],
      ),
    );
  }
}