import 'package:skl_ecommerce_2/consts.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Categories extends StatefulWidget {
  const Categories({super.key});

  @override
  State<Categories> createState() => _CategoriesState();
}
// state atas untuk menyimpen apa yg digunakan oleh super class
//state bawah buat variable variable kecil

class _CategoriesState extends State<Categories> {
  //list itu kurung kotak []
  //kalo map itu kurung kurawal{}
  //kalo ini list, pengembailan nya juga harus list, gabisa langsung dipanggil
  List<String> categories = [
    "Signature Scents",
    "Niche Fragrances",
    "Luxury Collections",
    "Seasonal Scents",
    "Unisex Fragrances",
    "Limited Edition"
  ];

  int selectedIndex = 0; //untuk ngasih tau selected index dimulai dari 0, ngasih tau pertama itu mulai dari mana, ya pertama ito zero lahh

  @override
  Widget build(BuildContext context) {
    return Padding( 
      padding: const EdgeInsets.symmetric(vertical: defaultPadding),
      child: SizedBox(
        height: 25,
        //listview dibuat untuk ngeslide horizontal, utk create a scrollable linear array horizontal
        
        //builder utk menampung data, untuk ngebuild ui nya
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: categories.length,
          itemBuilder: (context, index) => _buildCategory(index) // itemBuilder untuk menampung atau membangun data
          ),
      ),
    ); 
  }

  //gesture detector itu kayak buat deteksi pergerakan menggunakan pen, tapi bisa juga tidak menggunakan pen/ jadi pakai tangan
  //Boiler Plate Code itu kalo itu udh di defind, trus kita defind ulang, jadi numpuk2
  // index itu buat data array

  //buat index nya itu menjadi zero,di default in index nya jadi 0 dibagian sebelm override

  // kalo to many positional argument berarti coba tambahin child, pokoknya hrrq nya salah
  
  GestureDetector _buildCategory(int index) {
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedIndex = index; 
        }
        );
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: defaultPadding),
        child: Column(
          children: [
            Text(
              categories [index],
                style: TextStyle(
                  color: selectedIndex == index ? primaryColor : secondaryColor,  //ini itu if else  Warna titik aktif dan tidak aktif 
                ),
            ),
            Container(
              margin: const EdgeInsets.only(
                top: 3
              ),
              height: 2,
              width: 30,
              color: selectedIndex == index ? primaryColor : secondaryColor,
            )
          ],
        ),
      ),
    );
  }
}