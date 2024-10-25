import 'package:flutter/material.dart';
import 'package:intermediate_project/routes/router.dart';
import 'package:intermediate_project/shared/theme/theme.dart';
import 'dart:async';

class Splashscreen extends StatefulWidget {
  const Splashscreen({super.key});

  @override
  State<Splashscreen> createState() => _SplashscreenState();
}

class _SplashscreenState extends State<Splashscreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(
      const Duration(seconds: 3),
      () {
        router.goNamed(Routnames.login);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteColor,
      body: Center(
        child: Image.asset(
          "lib/shared/assets/amcc-logo.png",
          width: 120,
          height: 120,
        ),
      ),
    );
  }
}
