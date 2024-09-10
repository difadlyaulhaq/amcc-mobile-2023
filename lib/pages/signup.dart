import 'package:flutter/material.dart';
import 'package:intermediate_project/routes/router.dart';
import 'package:intermediate_project/shared/theme/theme.dart';

class SignupPage extends StatelessWidget {
  const SignupPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteColor, 
      body: ListView(
        children: [
          // Logo di bagian atas
          Align(
            alignment: Alignment.topCenter,
            child: Padding(
              padding: const EdgeInsets.only(top: 30.0, bottom: 20),
              child: Image.asset(
                'lib/shared/assets/amcc-logo.png', 
                height: 120,
              ),
            ),
          ),

          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              width: double.infinity,
              height: MediaQuery.of(context).size.height * 0.80, // 75% dari tinggi layar
              decoration: BoxDecoration(
               color: primaryColor1,
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(80),
                  topRight: Radius.circular(80),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    const SizedBox(height: 20),
                    Text(
                      'Sign Up',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: whiteColor,
                      ),
                    ),
                    const SizedBox(height: 10),
                    // Email Field
                    TextField(
                      decoration: InputDecoration(
                        filled: true,
                        fillColor:whiteColor,
                        hintText: 'username',
                        prefixIcon: const Icon(Icons.person),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    // Email Field
                    TextField(
                      decoration: InputDecoration(
                        filled: true,
                        fillColor:whiteColor,
                        hintText: 'e-mail',
                        prefixIcon: const Icon(Icons.mail),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                      ),
                    ),
                    const SizedBox(height: 15),

                    // Password Field
                    TextField(
                      obscureText: true,
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: whiteColor,
                        hintText: 'password',
                        prefixIcon: const Icon(Icons.lock),
                        suffixIcon: const Icon(Icons.visibility),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    // Password Field
                    TextField(
                      obscureText: true,
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: whiteColor,
                        hintText: 'confirm password',
                        prefixIcon: const Icon(Icons.lock),
                        suffixIcon: const Icon(Icons.visibility),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                      ),
                    ),
                    const SizedBox(height: 15),

                    // Login Button
                    SizedBox(
                      width: double.infinity,
                      height: 50,
                      child: ElevatedButton(
                        onPressed: () {
                          router.goNamed(Routnames.home);
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: blackColor,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                        ),
                        child:  Text('Daftar',
                        style: whiteColorTextStyle.copyWith(fontSize: 15),
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),

                    // Google Sign-in Button
                    SizedBox(
                      width: double.infinity,
                      height: 50,
                      child: ElevatedButton.icon(
                        onPressed: () {
                          // Tambahkan fungsi login dengan Google
                        },
                        icon: Image.asset(
                          'lib/shared/assets/super g (2).png',
                        ),
                        label: const Text(
                          'Masuk Dengan Google',
                          style: TextStyle(color: Colors.black),
                        ),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),

                    // Sign-up Link
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Sudah memiliki akun?',
                          style: blackColorTextStyle.copyWith(fontSize: 15),
                        ),
                        TextButton(
                          onPressed: () {
                            router.goNamed(Routnames.login);
                          },
                          child: Text('masuk disini',
                                style: whiteColorTextStyle.copyWith(fontSize: 15),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20,)
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}