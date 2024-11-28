import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:skl_ecommerce_2/consts.dart';
import 'package:skl_ecommerce_2/models/products.dart';
import 'package:skl_ecommerce_2/state-management/cart_provider.dart';
import 'package:skl_ecommerce_2/state-management/theme_provider.dart';

class CardCounter extends StatefulWidget {
  final Product product;

  const CardCounter({super.key, required this.product});

  @override
  State<CardCounter> createState() => _CardCounterState();
}

class _CardCounterState extends State<CardCounter> {
  // untuk default jumlah quantity
  int quantity = 1;

  @override
  Widget build(BuildContext context) {
    //inisialisasi provider
    final cartProvider = Provider.of<CartProvider>(context);
    final themeProvider = Provider.of<ThemeProvider>(context);

    return Row(
      children: <Widget>[
        // logika untuk tombol decrement/pengurangan
        OutlinedButton(
          style: OutlinedButton.styleFrom(
            minimumSize: const Size(35, 35),
            padding: EdgeInsets.zero,
            shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
            )
          ),
          // apabila quantity lebih dari 1 maka decrement
          onPressed: quantity > 1
          ? () {
            setState(() {
              // akan mengurangi quantity kalau lebih dari 1
              quantity--;
            });
            // untuk mengirim quantity terbaru
            // cartProvider disini untuk remove item
            cartProvider.removeItem(widget.product.id.toString());
          }
          // null akan disable tombol jika kuantitas <= 1 jd ga lakuin apa'
        : null,
          child: Icon(Icons.remove, color: themeProvider.isDarkTheme ? Colors.white : textColor)
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: defaultPadding),
          child: Text(
            quantity.toString().padLeft(2, '0'),
            style: TextStyle(fontSize: 18, color: themeProvider.isDarkTheme ? Colors.white : textColor),
          ),
        ),
        OutlinedButton(
          style: OutlinedButton.styleFrom(
            minimumSize: const Size(35, 35),
            padding: EdgeInsets.zero,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10)
            )
          ),
          child: Icon(Icons.add, color: themeProvider.isDarkTheme ? Colors.white : textColor),
          onPressed: () {
            setState(() {
              // menambahkan kuantitas
              quantity++;
            });
            // ini deklarasi informasi yg akan dikirim ke addToCart (tombol keranjang)
            // ini starting point quantitas akan di bawa oleh si trigger ke keranjang
            cartProvider.addItem(
              widget.product.id.toString(),
              widget.product.title,
              widget.product.price,
              widget.product.image, 
              1
            );
          },
        )
      ],
    );
  }
}