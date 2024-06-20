import 'package:flutter/material.dart';
import 'package:wallet/view/Login_and_splash/splashScreen.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: SplashScrren(),
    );
  }
}
