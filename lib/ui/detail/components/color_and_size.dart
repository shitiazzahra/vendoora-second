import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:skl_ecommerce_2/consts.dart';
import 'package:skl_ecommerce_2/models/products.dart';
import 'package:skl_ecommerce_2/state-management/theme_provider.dart';

class ColorAndSize extends StatelessWidget {
  const ColorAndSize({super.key, required this.product});

  final Product product;

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    return Row(
      children: [
        // expended mengisi kekosongan yg ada
           Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Scent Intensity", 
              style: TextStyle(color: themeProvider.isDarkTheme ? Colors.white : Colors.black),
              ),
              const Row(
                children: [
                  ColorPicker(
                    color: Color(0xFF6FBF4D),
                    isSelected: true,
                    ),
                  ColorPicker(
                    color: Color(0xFF989493),
                    isSelected: false,
                    ),
                  ColorPicker(
                    color: Color(0xFFBF4D4F),
                    isSelected: false,
                    )
                ],
              )
            ],
          )
        ),
        
        Expanded(
          // tujuan nya sama' buat styling dan modified text:
          // -text: superclass
          // -textspan: subclass dari superclass richtext

          // other way to showing and modifying the text
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Size",
                style: TextStyle(color: themeProvider.isDarkTheme ? Colors.white : textColor),
                ),
                const SizedBox(height: 14),
              RichText( //RichText untuk text yang punya tema terang dan gelap
                text: TextSpan(
                  style: TextStyle(color: themeProvider.isDarkTheme ? Colors.white : textColor),
                  children: [
                    TextSpan(
                      text: "${product.size} ml",
                      style: Theme.of(context)
                      .textTheme
                      .titleLarge!
                      .copyWith(fontWeight: FontWeight.bold)
                    )
                  ]
                ),
              ),
            ],
          )
        )
      ],
    );
  }
}

class ColorPicker extends StatelessWidget {
const ColorPicker({super.key, required this.color, required this.isSelected});

  final Color color;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return Container(
      // untuk color picker
      margin: const EdgeInsets.only(
        top: defaultPadding,
        right: defaultPadding
      ),
      padding: const EdgeInsets.all(2.5),
      width: 25,
      height: 25,
      // ini buat garis luar nya/stroke
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(
          color: isSelected ?  color : Colors.transparent //kalau circle nya aktif dia ada border nya warna grey kalau ngga bakal trasparent
        )
      ),

      child: DecoratedBox( //buat lebih luas lagi si boxdecoration nya, ada argument child disini.
        // ini buat color picker nya
        decoration: BoxDecoration(
          color: color,
          shape: BoxShape.circle
        )
      ),
    );
  }
}