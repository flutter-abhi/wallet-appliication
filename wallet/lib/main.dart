// ignore_for_file: depend_on_referenced_packages

import 'package:flutter/material.dart';
import 'package:wallet/controller/GetHistoryController.dart';
import 'package:wallet/controller/OtpController.dart';
import 'package:wallet/controller/TransitionController.dart';
import 'package:wallet/controller/login.dart';
import 'package:wallet/view/Login_and_splash/splashScreen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) {
          return TransactionController();
        }),
        ChangeNotifierProvider(create: (context) {
          return LoginProvider();
        }),
        ChangeNotifierProvider(create: (context) {
          return OtpProvider();
        }),
        ChangeNotifierProvider(create: (context) {
          return GetHistoryController();
        })
      ],
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: SplashScrren(),
      ),
    );
  }
}
