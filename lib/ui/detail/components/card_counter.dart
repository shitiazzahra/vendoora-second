import 'package:flutter/material.dart';
import 'package:skl_ecommerce_2/consts.dart';

class CartCounter extends StatefulWidget {
  const CartCounter({super.key});

  @override
  State<CartCounter> createState() => _CartCounterState();
}

class _CartCounterState extends State<CartCounter> {

  int numOfItems = 1;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        OutlinedButton(
          style: OutlinedButton.styleFrom(
            minimumSize: const Size(35, 35),
            padding: EdgeInsets.zero,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            )
          ),
          onPressed: () {
            setState(() {
              if (numOfItems > 1) {
                setState(() {
                  numOfItems--; // increment
                });
              }
            });
          }, 
          child: const Icon(Icons.remove)
        ),
        const SizedBox(width: defaultPadding),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: defaultPadding),
          child: Text(
            //padleft buat kasih padding di depannya, biar kalau angka cuma 1 ga error
            numOfItems.toString().padLeft(2, "0"),
            style: const TextStyle(
              fontSize: 18,
              color: textColor
            ),
          ),
        ),
        const SizedBox(width: defaultPadding),
        OutlinedButton(
          style: OutlinedButton.styleFrom(
            minimumSize: const Size(35, 35),
            padding: EdgeInsets.zero, 
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10)
              )
            ),
          onPressed: () {
            setState(() {
              numOfItems++; // decrement
            });
          }, 
          child: const Icon(Icons.add)
        ),
      ],
    );
  }
}