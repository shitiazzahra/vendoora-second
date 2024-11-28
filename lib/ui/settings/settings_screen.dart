import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:skl_ecommerce_2/state-management/theme_provider.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // inisialisasi provider
    final themeProvider = Provider.of<ThemeProvider>(context);
    
    return Scaffold(
      appBar: AppBar(
        backgroundColor: themeProvider.isDarkTheme ? Colors.black : Colors.white,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: () {
            Navigator.pushNamed(context, '/cataloge');
          },
        ),
        title: const Text('Settings'),
        elevation: 1,
        centerTitle: true,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          // Theme Toggle Section
          ListTile(
            leading: Icon(
              themeProvider.isDarkTheme ? Icons.dark_mode : Icons.light_mode,
              color: themeProvider.isDarkTheme ? Colors.white : Colors.amber,
            ),
            title: const Text('Dark Mode'),
            trailing: Switch(
              value: themeProvider.isDarkTheme,
              onChanged: (value) {
                themeProvider.toggleTheme(value);
              },
            ),
          ),
          const Divider(),

          // Language Section
          ListTile(
            leading: const Icon(Icons.language, color: Colors.blueAccent),
            title: const Text('Language'),
            subtitle: const Text('English'),
            trailing: const Icon(Icons.arrow_forward_ios),
            onTap: () {
              // Tambahkan logika untuk language selection
              showDialog(
                context: context,
                builder: (context) => AlertDialog(
                  title: const Text("Choose Language"),
                  content: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      ListTile(
                        title: const Text("English"),
                        onTap: () {
                          Navigator.pop(context);
                          // Tambahkan aksi language
                        },
                      ),
                      ListTile(
                        title: const Text("Bahasa Indonesia"),
                        onTap: () {
                          Navigator.pop(context);
                          // Tambahkan aksi language
                        },
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
          const Divider(),

          // Notification Settings
          ListTile(
            leading: const Icon(Icons.notifications, color: Colors.orange),
            title: const Text('Notifications'),
            subtitle: const Text('Manage notification settings'),
            trailing: const Icon(Icons.arrow_forward_ios),
            onTap: () {
              // Tambahkan logika untuk notification settings
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text("Notifications settings clicked")),
              );
            },
          ),
          const Divider(),

          // Account Section
          ListTile(
            leading: const Icon(Icons.person, color: Colors.green),
            title: const Text('Account'),
            subtitle: const Text('Manage account settings'),
            trailing: const Icon(Icons.arrow_forward_ios),
            onTap: () {
              // Tambahkan logika untuk account settings
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text("Account settings clicked")),
              );
            },
          ),
          const Divider(),

          // About Section
          ListTile(
            leading: const Icon(Icons.info, color: Colors.blueGrey),
            title: const Text('About'),
            subtitle: const Text('App version 1.0.0'),
            onTap: () {
              // Tambahkan logika untuk about
              showAboutDialog(
                context: context,
                applicationName: "Vendoora",
                applicationVersion: "1.0.0",
                applicationLegalese: "© 2024 Vendoora",
              );
            },
          ),
        ],
      ),
    );
  }
}