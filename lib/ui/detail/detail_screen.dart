import 'package:flutter/material.dart';
import 'package:skl_ecommerce_2/consts.dart';
import 'package:skl_ecommerce_2/models/product.dart';
import 'package:skl_ecommerce_2/ui/detail/components/add_to_cart.dart';
import 'package:skl_ecommerce_2/ui/detail/components/card_counter.dart';
import 'package:skl_ecommerce_2/ui/detail/components/color_and_size.dart';
import 'package:skl_ecommerce_2/ui/detail/components/description.dart';
import 'package:skl_ecommerce_2/ui/detail/components/fav_button.dart';
import 'package:skl_ecommerce_2/ui/detail/components/product_title.dart';

class DetailScreen extends StatelessWidget {
  const DetailScreen({super.key, required this.product});
  // kalau var di luar sini berati public tp klo di dalam itu private
  final Product product;

  @override
  Widget build(BuildContext context) {
  // the way that used for making the widget become responsive, as the device size
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: product.color,
      appBar: AppBar(
        backgroundColor: product.color,
        elevation: 0,
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.search),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.shopping_cart_outlined),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            SizedBox(
              height: size.height,
              // stack untuk numpukin widget
              child: Stack(
                children: [
                  Container(
                    // biar tinggi container nya 35% dari keseluruhan height
                    margin: EdgeInsets.only(top: size.height * 0.35), 
                    padding: const EdgeInsets.only(
                      top: defaultPadding,
                      left: defaultPadding,
                      right: defaultPadding,
                    ),
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(24),
                        topRight: Radius.circular(24),
                      ),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 50,),
                        ColorAndSize(product: product),
                        const SizedBox(height: defaultPadding),
                        Description(product: product),
                        const SizedBox(height: defaultPadding),
                        const Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            CartCounter(),
                            FavButton()
                          ],
                        ),
                        const SizedBox(height: defaultPadding),
                        AddToCart(product: product),
                      ],
                    ),
                  ),
                  // Title widget placed above the image
                  Positioned( // widget untuk ngatur tata letak dengan spesifik dan ini emang harus pake stack
                    top: size.height * 0.05,
                    left: defaultPadding,
                    right: defaultPadding,
                    child: ProductTitle(product: product)
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}