import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:skl_ecommerce_2/consts.dart';
import 'package:skl_ecommerce_2/state-management/theme_provider.dart';

class LoginPage extends StatelessWidget {
  //const LoginPage({super.key});

  // ini variable private, kalau yg public di define nya di material app
  final _formKey = GlobalKey<FormState>();//globalkey nya untuk memberitaukan developer kalo misal
  //pokoknya globalkey label dari login page
  //jadi kalo developer mau cari, itu tuh udh ada labelnya
  //kalo error udah muncul di devtools nya
  //menandakan bahwa proses yg terjadi di login screen
  //form key dipanggil lagi waktu pembuatan form nya
  final _emailController = TextEditingController();// handle textfield email
  final _passwordController = TextEditingController();// yg ini untuk pw

  LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);

    return Scaffold(
        body: Container(
          height: double.infinity,
          decoration: BoxDecoration(
            color: themeProvider.isDarkTheme ? Colors.black : Colors.white
          ),
          child: Padding( //body buat masukin isi isiannya, kyk body html
            padding: const EdgeInsets.all(16.0),
            child: Form(
              key: _formKey,//ini yg tadi kita buat di atas, di dalam form key ada global key. buat handle from field
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Welcome Back!",
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: themeProvider.isDarkTheme ? Colors.white : textColor
                    ),
                  ),
                  const SizedBox(height: 20),
                  TextFormField(
                    controller: _emailController,
                    decoration: const InputDecoration(
                      labelText: "Email*",
                      border: OutlineInputBorder()
                    ),
                    // buat aturan bahwa text nya harus di isi
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Email Required";
                      }
                      // ! ini untuk pengingkaran/ operator not
                      if (!value.endsWith("@gmail.com")) {
                        return "Please fill with valid email";
                      }
                      return null;//dia bakal ga return apa apa dia bakal pindah ke next screen
                    },
                  ),
                  const SizedBox(height: 20),
                  TextFormField(
                    controller: _passwordController,
                    obscureText: true, //menjadi enkripsi
                    decoration: const InputDecoration(
                      labelText: "Password*",
                      border: OutlineInputBorder()
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Password Required";
                      }
                      return null;//dia bakal ga return, bakal pindah ke next screen
                    },
                  ),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: (){ // melakukan validasi formfield
                      if (_formKey.currentState!.validate()) {
                        //if the validation succes it will navigete to home scereen
                        Navigator.pushReplacementNamed(context, '/cataloge');
                      }
                    },
                    child: Text(
                      "Login",
                      style: TextStyle(
                        color: themeProvider.isDarkTheme ? Colors.grey[500] : Colors.black
                      ),
                      )
                    ),
                    const SizedBox(height: 20),
                    TextButton(
                      onPressed: () {
                        Navigator.pushNamed(context, '/register');
                      }, 
                      child: Text(
                        "Belum punya akun?",
                        style: TextStyle(
                          color: themeProvider.isDarkTheme ? Colors.grey[500] : Colors.black
                        ),
                      )
                    )
                  ],
                )
              ),
          ),
        ),
    );
  }
}