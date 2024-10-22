import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:intermediate_project/bloc/auth/auth_bloc.dart';
import 'package:intermediate_project/routes/router.dart';
import 'package:intermediate_project/shared/theme/theme.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    //add textediting controller
    TextEditingController emailController = TextEditingController();
    TextEditingController passwordController = TextEditingController();
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
              height: MediaQuery.of(context).size.height * 0.75, // 75% dari tinggi layar
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
                      'Login',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: whiteColor,
                      ),
                    ),
                    const SizedBox(height: 10),
                     Text(
                      'Silahkan Masukan Email Dan Password Anda',
                      style: whiteColorTextStyle.copyWith(fontSize: 15),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 20),

                    // Email Field
                    TextField(
                      controller: emailController,
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
                      controller: passwordController,
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

                    // Forgot Password Link
                    Align(
                      alignment: Alignment.centerLeft,
                      child: TextButton(
                        onPressed: () {
                          // Tambahkan fungsi lupa password
                        },
                        child:  Text(
                          'Lupa Password?',
                          style: whiteColorTextStyle.copyWith(fontSize: 15),
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),

                    // Login Button
                    SizedBox(
                      width: double.infinity,
                      height: 50,
                      child: ElevatedButton(
                        onPressed: () {
                          context.read<AuthBloc>().add(AuthEventLogin(
                              emailController.text,
                              passwordController.text,
                          ));

                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: blackColor,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                        ),
                        child: BlocConsumer<AuthBloc, AuthState>(
                          builder: (context, state) {
                            if (state is AuthStateLoading){
                              return const CircularProgressIndicator();
                            }
                            return const Text("login");
                          }, listener: (context, state){
                          if (state is AuthStateLogin) {
                            context.goNamed(Routnames.home); 
                          }else if (state is AuthStateError){
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(content: Text(state.message),
                                duration: const Duration(seconds: 2),
                                )
                              );
                          } 
                        })
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
                          'Belum memiliki akun?',
                          style: blackColorTextStyle.copyWith(fontSize: 15),
                        ),
                        TextButton(
                          onPressed: () {
                            router.goNamed(Routnames.signup);
                          },
                          child: Text('Daftar disini',
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