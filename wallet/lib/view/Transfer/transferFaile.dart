import 'package:flutter/material.dart';
import 'package:wallet/view/MainScreens/homeScreen.dart';

class TransferFail extends StatelessWidget {
  const TransferFail({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(255, 246, 246, 1),
      body: Padding(
        padding: const EdgeInsets.all(40.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset("assets/Failuer.png"),
            const SizedBox(
              height: 200,
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return const HomeScreen();
                }));
              },
              child: Container(
                height: 45,
                width: double.infinity,
                color: const Color.fromRGBO(87, 50, 191, 1),
                alignment: Alignment.center,
                child: const Text(
                  "Back To Wallet",
                  style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 15,
                      color: Colors.white),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
