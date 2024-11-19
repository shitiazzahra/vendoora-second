import 'package:flutter/material.dart';
import 'package:skl_ecommerce_2/consts.dart';
import 'package:skl_ecommerce_2/size_config.dart';

class SplashContent extends StatelessWidget {
  const SplashContent({
    // text dan image maksud nya untuk  menampilkan text dan gambar di splash screen
    super.key, required this.text, required this.image,
  });
  final String text, image;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Spacer(),
        Text(
          'Vendoora', 
          style: TextStyle(
            color: primaryColor,
            fontSize: getProportionateScreenWidht(36.0)
          ),
        ),
        Text(
          text,
          textAlign: TextAlign.center,
          ),
        Image.asset(image)
      ],
    );
  }
}