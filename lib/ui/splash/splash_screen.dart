import 'package:flutter/material.dart';
import 'package:skl_ecommerce_2/size_config.dart';
import 'package:skl_ecommerce_2/ui/splash/components/body.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context); // harus panggil ini di stating screen
    return const Scaffold(
      body: Body(),
    );
  }
}