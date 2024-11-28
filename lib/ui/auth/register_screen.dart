import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';
import 'package:skl_ecommerce_2/consts.dart';
import 'package:skl_ecommerce_2/state-management/theme_provider.dart';

class RegisterPage extends StatelessWidget {
  //const LoginPage({super.key});

  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);

    return Scaffold(
      body: Container(
        height: double.infinity,
        decoration: BoxDecoration(
          color: themeProvider.isDarkTheme ? Colors.black : Colors.white
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
              Text(
                  'Create an Account',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: themeProvider.isDarkTheme ? Colors.white : textColor
                  ),
                ),
                const SizedBox(height: 20),
                TextFormField(
                  controller: _nameController,
                  decoration: const InputDecoration(
                    labelText: "Name",
                    border: OutlineInputBorder(),
                  ),
                  // ini sebagai validator jd kalau ga diisi nanti tampilin required
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Name is required";
                    }
                    // endWith buat nentuin belakang nya
                    if (!value.endsWith("@gmail.com")) {
                      return "Please fill with valid email";
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 20),
                TextFormField(
                  controller: _emailController,
                  decoration: const InputDecoration(
                    labelText: "Email*",
                    border: OutlineInputBorder()
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Email is required";
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 20),
                TextFormField(
                  controller: _passwordController,
                  obscureText: true,
                  decoration: const InputDecoration(
                    labelText: "Password*",
                    border: OutlineInputBorder(),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Password is required";
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      // if the validation success, it will showed the toast
                      Fluttertoast.showToast(
                        msg: "Register Success",
                        toastLength: Toast.LENGTH_SHORT,
                        gravity: ToastGravity.BOTTOM, 
                        backgroundColor: const Color.fromARGB(255, 195, 192, 192),
                        textColor: Colors.black
                      );
        
                      // ini buat pindah dan ganti
                      Navigator.pushReplacementNamed(
                        context, '/');
                    }
                  }, 
                  child: const Text("Register")
                ),
                const SizedBox(height: 10),
                TextButton(
                  onPressed: () {
                    Navigator.pushNamed(
                      context, '/login');
                  },
                  child: Text("Login disini!", style: TextStyle(color: themeProvider.isDarkTheme ? textColor : Colors.black))
                )
              ],
            )
          ),
        ),
      ),
    );
  }
}