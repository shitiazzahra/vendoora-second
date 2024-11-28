import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:skl_ecommerce_2/models/products.dart';
import 'package:skl_ecommerce_2/state-management/wishlist_provider.dart';

class FavButton extends StatelessWidget {
  const FavButton({super.key, required this.product});

  // bentuk inisialisasi variable
  final Product product;

  @override
  Widget build(BuildContext context) {
    // inisialisasi provider
    final wishlistProvider = Provider.of<WishlistProvider>(context);

    // untuk memeriksa apakah product ada di wishlist atau tidak
    final isFavorite = wishlistProvider.wishlistItems.containsKey(product.id.toString());

    return IconButton(
      onPressed: () {
        if (isFavorite) {
          // untuk menghapus item dari wishlist via btn love, jd kalau ada kita bisa hapus
          wishlistProvider.removeItemFromFav(product.id.toString());
        } else {
          // untuk nambahin
        wishlistProvider.addItemToFav(
          // ini di urutin sesuai type data (hover ada functionnya)
          product.id.toString(),
          product.title,
          product.price,
          product.image
        );
        }
      }, 
      // ini condition merah ngga nya btn fav
      icon: Icon(
        isFavorite ? Icons.favorite : Icons.favorite_border_outlined,
        color: isFavorite ? Colors.red : Colors.grey.shade500
      )
    );
  }
}