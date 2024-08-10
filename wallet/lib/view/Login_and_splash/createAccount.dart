import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:wallet/controller/login.dart';
import 'package:wallet/view/Login_and_splash/Otp1.dart';
import 'package:wallet/widgets/textFildgenrel.dart';
import "package:provider/provider.dart";

class CreateAccount extends StatefulWidget {
  final String contact;
  const CreateAccount({
    required this.contact,
    super.key,
  });

  @override
  State<CreateAccount> createState() => _CreateAccountState();
}

class _CreateAccountState extends State<CreateAccount> {
  ////
  ///
  TextEditingController password = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController firstName = TextEditingController();
  TextEditingController lastName = TextEditingController();

  bool isVisible = false;
  bool isBiller = false;
  bool isAccept = false;
  @override
  Widget build(BuildContext context) {
    final loginCon = Provider.of<LoginProvider>(context);
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

            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text("firstName"),
                Text("last name"),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(
                  height: 45,
                  width: 150,
                  child: TextField(
                    controller: firstName,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey)),
                      hintText: "e.g.John ",
                      hintStyle: TextStyle(color: Colors.grey, fontSize: 14),
                    ),
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                SizedBox(
                  height: 45,
                  width: 150,
                  child: TextField(
                    controller: lastName,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey)),
                      hintText: "e.g. Doe",
                      hintStyle: TextStyle(color: Colors.grey, fontSize: 14),
                    ),
                  ),
                ),
              ],
            ),

            const SizedBox(
              height: 24,
            ),
            const Text("Email"),
            SizedBox(
              height: 45,
              child: TextField(
                controller: email,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey)),
                  hintText: "e.g.email@example.com",
                  hintStyle: TextStyle(color: Colors.grey, fontSize: 14),
                ),
              ),
            ),

            const SizedBox(
              height: 24,
            ),
            const Text("Password"),
            SizedBox(
              height: 45,
              child: TextField(
                obscureText: !isVisible,
                controller: password,
                decoration: InputDecoration(
                    border: const OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey)),
                    hintText: "Enter Your Password",
                    hintStyle:
                        const TextStyle(color: Colors.grey, fontSize: 14),
                    suffixIcon: GestureDetector(
                      onTap: () {
                        isVisible = !isVisible;
                        setState(() {});
                      },
                      child: Icon((!isVisible)
                          ? Icons.visibility_off_outlined
                          : Icons.visibility),
                    )),
              ),
            ),
            //
            const SizedBox(
              height: 24,
            ),
            GestureDetector(
              onTap: () {
                isBiller = !isBiller;
                setState(() {});
              },
              child: Row(
                children: [
                  Icon(
                    (!isBiller)
                        ? Icons.check_box_outline_blank
                        : Icons.check_box_outlined,
                    size: 24,
                  ),
                  const Text(
                    "   SignUp as a Biller",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 24,
            ),

            GestureDetector(
              onTap: () {
                isAccept = !isAccept;
                setState(() {});
              },
              child: SizedBox(
                child: Row(
                  children: [
                    Icon(
                      (!isAccept)
                          ? Icons.check_box_outline_blank
                          : Icons.check_box_outlined,
                      size: 24,
                    ),
                    const Text(" I accept "),
                    const Text(
                      "Terms and Condition ",
                      style: TextStyle(color: Color.fromRGBO(29, 98, 202, 1)),
                    ),
                    const Text("and "),
                  ],
                ),
              ),
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
              onTap: () async {
                //login karuya okkk

                if (isAccept) {
                  String? resmessage = await loginCon.signUp(
                      contact: widget.contact,
                      pass: password.text,
                      firstName: firstName.text,
                      lastName: lastName.text,
                      email: email.text,
                      type: (isBiller) ? "biller" : "user");

                  ///check whether login or not
                  bool success = loginCon.success;

                  if (success) {
                    Navigator.pushReplacement(context,
                        MaterialPageRoute(builder: (context) {
                      return Otp1(contact: widget.contact);
                    }));
                  } else {
                    _showErrorDialog(resmessage!);
                  }
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                      content: Text("Accept terms and condition")));
                }
              },
              child: Container(
                height: 45,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: const Color.fromRGBO(87, 50, 191, 1)),
                child: (!loginCon.isLoading)
                    ? const Text(
                        "Create a new account",
                        style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                            color: Colors.white),
                      )
                    : const CircularProgressIndicator(
                        color: Colors.white,
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

  void _showErrorDialog(String msg) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Sign Up failed'),
            content: Text(msg),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: const Text('OK'),
              ),
            ],
          );
        });
  }
}
