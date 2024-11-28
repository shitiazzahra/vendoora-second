import 'package:flutter/material.dart';

// ini dalah satu' nya acuan untuk data yg digunakan
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
  });
}

List<Product> product = [
  Product(
      id: 1,
      title: "Aventus",
      price: 513,
      size: 30,
      description: dummyText,
      image: "assets/images/aventus.png",
      color: const Color(0xFFDDDCD7)),
  Product(
      id: 2,
      title: "Black Opium",
      price: 300,
      size: 45,
      description: dummyText,
      image: "assets/images/black_opium.png",
      color: const Color(0xFFEFB1A6)),
  Product(
      id: 3,
      title: "Chanel No.5",
      price: 342,
      size: 50,
      description: dummyText,
      image: "assets/images/chanel_no5.png",
      color: const Color(0xFFF1D996)),
  Product(
      id: 4,
      title: "J'adore l'Or",
      price: 285,
      size: 30,
      description: dummyText,
      image: "assets/images/jadore_ior.png",
      color: const Color(0xFFF4D45F)),
  Product(
      id: 5,
      title: "Oud Wood",
      price: 234,
      size: 100,
      description: dummyText,
      image: "assets/images/oud_wood.png",
      color: const Color(0xFF937D6C)),
  Product(
    id: 6,
    title: "Peony & Blush Suede",
    price: 219,
    size: 70,
    description: dummyText,
    image: "assets/images/peony_blush_sade.png",
    color: const Color(0xFFFFE49E)),
  Product(
    id: 6,
    title: "Shalimar",
    price: 196,
    size: 35,
    description: dummyText,
    image: "assets/images/shalimar.png",
    color: const Color(0xFF74D0F0)),
  Product(
    id: 6,
    title: "Terre d'Hermès",
    price: 249,
    size: 60,
    description: dummyText,
    image: "assets/images/terre_dhermes.png",
    color: const Color(0xFFD39771)),
];

String dummyText =
    "This luxurious fragrance captures the essence of elegance and sophistication. With a blend of floral, woody, and citrus notes, it evokes a sense of freshness and warmth. Perfect for any season, it’s designed to complement your style, leaving a lasting impression wherever you go.";