import 'package:flutter/material.dart';

class Product {



  final String image, title, description;
  final int price, size, id;
  final Color color;

  Product({
    required this.id,
    required this.image,
    required this.title,
    required this.price,
    required this.description,
    required this.size,
    required this.color,
  }
    
);
}

List<Product> product = [
  Product(
      id: 1,
      title: "Aventus",
      price: 5130216,
      size: 12,
      description: dummyText,
      image: "assets/images/aventus.png",
      color: const Color(0xFFDDDCD7)),
  Product(
      id: 2,
      title: "Black Opium",
      price: 3000000,
      size: 8,
      description: dummyText,
      image: "assets/images/black_opium.png",
      color: const Color(0xFFEFB1A6)),
  Product(
      id: 3,
      title: "Chanel No.5",
      price: 3420000,
      size: 10,
      description: dummyText,
      image: "assets/images/chanel_no5.png",
      color: const Color(0xFFF1D996)),
  Product(
      id: 4,
      title: "J'adore l'Or",
      price: 2850000,
      size: 11,
      description: dummyText,
      image: "assets/images/jadore_ior.png",
      color: const Color(0xFFF4D45F)),
  Product(
      id: 5,
      title: "Oud Wood",
      price: 234,
      size: 1136051,
      description: dummyText,
      image: "assets/images/oud_wood.png",
      color: const Color(0xFF937D6C)),
  Product(
    id: 6,
    title: "Peony & Blush Suede",
    price: 2197853,
    size: 12,
    description: dummyText,
    image: "assets/images/peony_blush_sade.png",
    color: const Color(0xFFFFE49E)),
  Product(
    id: 6,
    title: "Shalimar",
    price: 1969038,
    size: 12,
    description: dummyText,
    image: "assets/images/shalimar.png",
    color: const Color(0xFF74D0F0)),
  Product(
    id: 6,
    title: "Terre d'Hermès",
    price: 2499164,
    size: 12,
    description: dummyText,
    image: "assets/images/terre_dhermes.png",
    color: const Color(0xFFD39771)),
];

String dummyText =
    "Lorem Ipsum dolor sit amet";