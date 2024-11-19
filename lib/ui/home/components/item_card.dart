//item itu untuk mendefinidiksn bagaiman asebuah objek akan terjadi
//menjadikan semua object reusable

import 'package:skl_ecommerce_2/consts.dart';
import 'package:skl_ecommerce_2/models/product.dart';
import 'package:flutter/material.dart';

class ItemsCard extends StatelessWidget {
  const ItemsCard({super.key, required this.product, required this.press});

  final Product product;//ini itu sub class dari anak anak yg punya banyak data
  final VoidCallback press; //mengasih sebuah feed back ke user

  //mvvm adalah model view-view model
  //model itu detail data
  //item itu untuk mendefinidiksn bagaiman sebuah objek akan terjadi
  //menjadikan semua object reusable
  //ui sama view sama
  
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: press,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(//buat mengisi kekosongan yg ada, biar isinya proposinal
            child: Container(
              padding: const EdgeInsets.all(defaultPadding),
              decoration: BoxDecoration(
                color: product.color,
                borderRadius: BorderRadius.circular(16)
                ),
                child: Hero(
                  tag: "${product.id}", // untuk mendefinisikan tiap product, buat ambil id
                  child: Image.asset(product.image), // ini buat isian nya
                ),
                        
              ),
          ),
          
          Text(
            product.title,
            style:  const TextStyle(color: textColor),
            ),

          Text(
            "Rp ${product.price}"
          )
        ],
      ),
    );
  }
}
