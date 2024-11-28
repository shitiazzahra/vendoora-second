import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:skl_ecommerce_2/consts.dart';
import 'package:skl_ecommerce_2/state-management/cart_provider.dart';
import 'package:skl_ecommerce_2/state-management/theme_provider.dart';
import 'package:skl_ecommerce_2/state-management/wishlist_provider.dart';
import 'package:skl_ecommerce_2/ui/auth/login_screen.dart';
import 'package:skl_ecommerce_2/ui/auth/register_screen.dart';
import 'package:skl_ecommerce_2/ui/cart/cart_screen.dart';
import 'package:skl_ecommerce_2/ui/home/catalogue_screen.dart';
import 'package:skl_ecommerce_2/ui/settings/settings_screen.dart';
import 'package:skl_ecommerce_2/ui/splash/splash_screen.dart';
import 'package:skl_ecommerce_2/ui/wishlist/wishlist_screen.dart';

void main() {
  runApp(
    // MultiProvider dipake kalau punya banyak provider
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ThemeProvider()),
        ChangeNotifierProvider(create: (_) => CartProvider()),
        ChangeNotifierProvider(create: (_) => WishlistProvider()),
      ],
      child: const FloShop()
    )
  );
} 

class FloShop extends StatefulWidget {
  const FloShop({super.key});

  @override
  State<FloShop> createState() => _FloShopState();
}

class _FloShopState extends State<FloShop> {

  //compile: adalah proses penerjemahan code ke bahasa mesin/proses nya.
  //runtime: alatnya, di vs code udah tertanam alatnya.

  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeProvider>(
      builder: (context, themeProvider, child) { 
        return Consumer<ThemeProvider>(
          builder: (BuildContext context, ThemeProvider value, Widget? child) { 
            return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Vendoora',
          theme: ThemeData(
            brightness: themeProvider.isDarkTheme ? Brightness.dark : Brightness.light,
            scaffoldBackgroundColor: themeProvider.isDarkTheme ? Colors.black : Colors.white,
            fontFamily: 'Muli',
            visualDensity: VisualDensity.adaptivePlatformDensity,
            textTheme: const TextTheme(
              bodyMedium: TextStyle(color: textColor),
              bodySmall: TextStyle(color: textColor)
            )
          ),
          initialRoute: '/',
          routes: {
            // format pasangan key : value adalah => nama rute : kelas yang dituju
            '/' : (context) => const SplashScreen(),
            '/login' : (context) => LoginPage(),
            '/register' : (context) => RegisterPage(),
            '/wishlist' : (context) => const WishlistScreen(),
            '/cataloge' : (context) => const CatalogueScreen(),
            '/settings' : (context) => const SettingsScreen(),
            '/cart' : (context) => const CartScreen(),
            },
          );
           },
        );
      }, 
    );
  }
}