import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 238, 233, 255),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 45,
            ),
            Image.asset("assets/login/TapPay2.png"),
            const SizedBox(
              height: 45,
            ),
            Image.asset("assets/login/mobailPhone.png"),
            const SizedBox(
              height: 45,
            ),
            Container(
              padding: const EdgeInsets.all(15),
              width: double.infinity,
              height: MediaQuery.of(context).size.height - 355,
              decoration: const BoxDecoration(color: Colors.white),
              child: Column(
                //mainAxisAlignment: MainAxisAlignment.spaceAround,
                // mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 15,
                  ),
                  const SizedBox(
                      width: 179,
                      child: Text(
                        "Enter Your Mobail Number",
                        style: TextStyle(
                            fontSize: 21, fontWeight: FontWeight.w600),
                      )),

                  //my text fild
                  //
                  const SizedBox(
                    height: 24,
                  ),
                  const Text("Mobail Number"),
                  SizedBox(
                    height: 45,
                    child: TextField(
                      decoration: InputDecoration(
                        
                          prefix: Image.asset("assets/login/jordanFlag.png"),
                          contentPadding: EdgeInsets.only(top: 10, left: 20),
                          hintText: "7x-xxxxxxx",
                          border: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: const Color.fromARGB(
                                      255, 202, 199, 199)))),
                    ),
                  ),
                  //
                  const SizedBox(
                    height: 24,
                  ),
                  Container(
                    height: 45,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: const Color.fromRGBO(87, 50, 191, 1)),
                    child: const Text(
                      "Continue",
                      style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          color: Colors.white),
                    ),
                  ),
                  const SizedBox(
                    height: 24,
                  ),

                  Container(
                    alignment: Alignment.center,
                    child: const Text(
                      "or continue using",
                      style: TextStyle(
                          color: Colors.grey,
                          fontSize: 12,
                          fontWeight: FontWeight.w400),
                    ),
                  ),
                  const SizedBox(
                    height: 24,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        height: 45,
                        width: 98,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            border: Border.all(
                                width: 2,
                                color: const Color.fromRGBO(237, 239, 246, 1))),
                        child: Image.asset("assets/login/facebookLogo.png"),
                      ),
                      Container(
                        height: 45,
                        width: 98,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            border: Border.all(
                                width: 2,
                                color: const Color.fromRGBO(237, 239, 246, 1))),
                        child: Image.asset("assets/login/googleLogo.png"),
                      ),
                      Container(
                        height: 45,
                        width: 98,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            border: Border.all(
                                width: 2,
                                color: const Color.fromRGBO(237, 239, 246, 1))),
                        child: Image.asset("assets/login/appleLogo.png"),
                      ),
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
