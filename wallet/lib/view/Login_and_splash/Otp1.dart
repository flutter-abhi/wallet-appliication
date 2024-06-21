import 'package:flutter/material.dart';
import 'package:wallet/view/MainScreens/homeScreen.dart';

class Otp1 extends StatefulWidget {
  const Otp1({super.key});

  @override
  State<Otp1> createState() => _Otp1State();
}

class _Otp1State extends State<Otp1> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          //backgroundColor: const Color.fromARGB(255, 238, 233, 255),
          title: Image.asset(
            "assets/login/TapPay2.png",
            height: 24,
            width: 90,
          ),
          centerTitle: true,
          leading: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: const Text(
                  " < Back",
                  style: TextStyle(
                      color: Color.fromRGBO(29, 98, 202, 1),
                      fontSize: 15,
                      fontWeight: FontWeight.w600),
                ),
              ),
            ],
          )),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            const SizedBox(
              height: 24,
            ),
            const Text(
              "An SMS sent to your mobile number",
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
            ),
            const Text(
              "+962 79 XXX-XXXX",
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
            ),
            const SizedBox(
              height: 24,
            ),
            const Text(
              "Enter six-digit code",
              style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                  color: Colors.grey),
            ),
            const SizedBox(
              width: 240,
              child: TextField(
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 50),
                autofocus: true,
                keyboardType: TextInputType.number,
                //cursorHeight: 40,
                decoration: InputDecoration(
                    hintText: "XXX-XXX",
                    hintStyle: TextStyle(
                        fontSize: 50,
                        color: Color.fromRGBO(186, 194, 199, 1),
                        fontWeight: FontWeight.w400)),
              ),
            ),
            const SizedBox(
              height: 24,
            ),
            const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Resend Code",
                  style: TextStyle(
                      fontSize: 14,
                      color: Colors.grey,
                      fontWeight: FontWeight.w400),
                ),
                Text(
                  "00.32",
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
                )
              ],
            ),
            const Spacer(),
            GestureDetector(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return const HomeScreen();
                }));
              },
              child: Container(
                height: 45,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: const Color.fromRGBO(87, 50, 191, 1)),
                child: const Text(
                  "Done",
                  style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: Colors.white),
                ),
              ),
            ),
            const SizedBox(
              height: 15,
            ),
          ],
        ),
      ),
    );
  }
}
