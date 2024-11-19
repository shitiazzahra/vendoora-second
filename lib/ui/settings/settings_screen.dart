import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:skl_ecommerce_2/state-management/theme_provider.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
        actions: [
          IconButton(
            onPressed: () {
              themeProvider.toggleTheme(!themeProvider.isDarkTheme);
            }, 
            icon: 
            Icon(
              themeProvider.isDarkTheme ? Icons.dark_mode : Icons.light_mode, 
              color: themeProvider.isDarkTheme ? Colors.white : Colors.amber,
            )
          )
        ],
      ),
      body: const Center(
        child: Placeholder(),
      ),
    );
  }
}