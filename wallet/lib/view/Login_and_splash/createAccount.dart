import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:wallet/view/Login_and_splash/Otp1.dart';
import 'package:wallet/widgets/textFildgenrel.dart';

class CreateAccount extends StatefulWidget {
  const CreateAccount({super.key});

  @override
  State<CreateAccount> createState() => _CreateAccountState();
}

class _CreateAccountState extends State<CreateAccount> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
          backgroundColor: const Color.fromARGB(255, 238, 233, 255),
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
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            const Text(
              "Create Account",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.w600),
            ),
            const SizedBox(
              height: 24,
            ),
            const Text("Name"),
            TextfildGenral(
              hintText: "e.g.John Doe",
            ),
            const SizedBox(
              height: 24,
            ),
            const Text("Email"),
            TextfildGenral(
              hintText: "e.g.email@example.com",
            ),
            const SizedBox(
              height: 24,
            ),
            const Text("Password"),
            TextfildGenral(
              suffixIcon: const Icon(Icons.visibility_off),
              hintText: "e.g.email@example.com",
            ),
            const SizedBox(
              height: 24,
            ),
            const Row(
              children: [
                Icon(
                  Icons.check_box_outline_blank,
                  size: 20,
                ),
                Text(" I accept "),
                Text(
                  "Terms and Condition ",
                  style: TextStyle(color: Color.fromRGBO(29, 98, 202, 1)),
                ),
                Text("and "),
              ],
            ),
            const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "privacy policy",
                  style: TextStyle(color: Color.fromRGBO(29, 98, 202, 1)),
                ),
              ],
            ),
            const SizedBox(
              height: 49,
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return const Otp1();
                }));
              },
              child: Container(
                height: 45,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: const Color.fromRGBO(87, 50, 191, 1)),
                child: const Text(
                  "Create a new account",
                  style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: Colors.white),
                ),
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
      ),
    );
  }
}
