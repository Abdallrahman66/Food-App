import 'package:flutter/material.dart';
import 'package:food/features/splash/splash_screen.dart';

class FoodApp extends StatelessWidget {
  const FoodApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Food App",
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
    );
  }
}
