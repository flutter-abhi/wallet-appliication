import 'package:flutter/material.dart';
import 'package:wallet/controller/login.dart';
import 'package:wallet/view/Login_and_splash/loginScreen.dart';
import 'package:provider/provider.dart';
import 'package:wallet/view/MainScreens/homeScreen.dart';

class SplashScrren extends StatefulWidget {
  const SplashScrren({super.key});

  @override
  State<SplashScrren> createState() => _SplashScrrenState();
}

class _SplashScrrenState extends State<SplashScrren> {
  @override
  void initState() {
    isAlreadyLoggedin();

    // Timer(const Duration(seconds: 2), () {
    //   Navigator.of(context).pushReplacement(MaterialPageRoute(
    //     builder: (context) => const LoginScreen(),
    //   ));
    // });
    super.initState();
  }

  void isAlreadyLoggedin() async {
    await Provider.of<LoginProvider>(context, listen: false).isLoggedIn();
    
    if (Provider.of<LoginProvider>(context, listen: false).isAlreadyLoggedin) {
      Navigator.of(context).pushReplacement(MaterialPageRoute(
        builder: (context) => const HomeScreen(),
      ));
    } else {
      Navigator.of(context).pushReplacement(MaterialPageRoute(
        builder: (context) => const LoginScreen(),
      ));
    }
  }

  /// async function aas lihaych ki user find karun deil
  /// isloggedin  api la call karaycha

  /// assel tr user bhetal
  /// nasel tr tyala login screen la pathvaych
  /// tithe option aasel login or sign up

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color.fromRGBO(87, 50, 191, 1),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(
                  width: 150,
                ),
                Container(
                  height: 8,
                  width: 8,
                  decoration: const BoxDecoration(
                      color: Color.fromRGBO(253, 194, 40, 1),
                      shape: BoxShape.circle),
                ),
                const SizedBox(
                  width: 5,
                ),
                Container(
                  height: 16,
                  width: 16,
                  decoration: const BoxDecoration(
                      color: Color.fromRGBO(253, 194, 40, 1),
                      shape: BoxShape.circle),
                )
              ],
            ),
            Image.asset("assets/login/TapPay.png"),
          ],
        ));
  }
}
