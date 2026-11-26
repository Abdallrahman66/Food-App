import 'dart:async';

import 'package:flutter/material.dart';
import 'package:food/features/auth/login_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _navigateToLogin();
  }

  void _navigateToLogin() {
    Timer(const Duration(seconds: 3), () {
      if (!mounted) return;

      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const LoginScreen()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SizedBox.expand(
        child: ClipRect(
          child: Stack(
            alignment: Alignment.center,
            children: [
              Positioned(
                top: -40,
                left: -30,
                child: Image.asset(
                  'assets/icons/side_up_shape.png',
                  width: 350,
                  fit: BoxFit.contain,
                ),
              ),

              Positioned(
                bottom: 0,
                right: -20,
                child: Image.asset(
                  'assets/icons/side_down_shape.png',
                  width: 300,
                  fit: BoxFit.contain,
                ),
              ),

              Image.asset(
                'assets/icons/app_icon.png',
                width: 200,
                fit: BoxFit.contain,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
