import 'dart:developer';

import 'package:flutter/material.dart';
import "package:provider/provider.dart";
import 'package:wallet/controller/login.dart';
import 'package:wallet/view/Login_and_splash/Otp1.dart';
import 'package:wallet/view/Login_and_splash/createAccount.dart';
import 'package:wallet/view/MainScreens/homeScreen.dart';
import 'package:wallet/widgets/myNumberTextFild.dart';
import 'package:wallet/widgets/textFildgenrel.dart';

class EnterPassword extends StatefulWidget {
  final String contact;
  const EnterPassword({super.key, required this.contact});

  @override
  State<EnterPassword> createState() => _EnterPasswordState();
}

class _EnterPasswordState extends State<EnterPassword> {
  final TextEditingController password = TextEditingController();
  bool isVisible = false;

  @override
  Widget build(BuildContext context) {
    final loginCon = Provider.of<LoginProvider>(context, listen: false);
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 238, 233, 255),
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
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 45,
            ),
            Image.asset("assets/login/password.png"),
            const SizedBox(
              height: 45,
            ),
            Container(
              padding: const EdgeInsets.all(15),
              width: double.infinity,
              height: MediaQuery.of(context).size.height - 360,
              decoration: const BoxDecoration(color: Colors.white),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 15,
                  ),
                  const SizedBox(
                      child: Text(
                    "Enter Your Password",
                    style: TextStyle(fontSize: 21, fontWeight: FontWeight.w600),
                  )),
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
                  const SizedBox(
                    height: 16,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                          onTap: () {
                            //navigate to sign up page
                            Navigator.push(context,
                                MaterialPageRoute(builder: (context) {
                              return CreateAccount(contact: widget.contact);
                            }));
                            ////
                            ///
                          },
                          child: const Text(
                            "Don't have an account",
                            style: TextStyle(
                                color: Color.fromRGBO(29, 98, 202, 1)),
                          )),
                      GestureDetector(
                          onTap: () {
                            myBottomSheetEmail();
                          },
                          child: const Text(
                            "Forgot Password?",
                            style: TextStyle(
                                color: Color.fromRGBO(29, 98, 202, 1)),
                          ))
                    ],
                  ),
                  const Spacer(),
                  GestureDetector(
                    onTap: () async {
                      //login karuya okkk

                      String? resmessage = await loginCon.login(
                          contact: widget.contact, pass: password.text);

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
                    },
                    child: Container(
                      height: 45,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: const Color.fromRGBO(87, 50, 191, 1)),
                      child: (!loginCon.isLoading)
                          ? const Text(
                              "Login",
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
                    height: 30,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

//
  void _showErrorDialog(String msg) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Login failed'),
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

// for opning the bottom sheet we use this
// flag that showing the forgot pass open for
// email
  bool byEmail = true;
  void myBottomSheetEmail() {
    showModalBottomSheet(
        context: context,
        builder: (context) {
          return Padding(
            padding: const EdgeInsets.only(top: 25, right: 18, left: 18),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    const Text(
                      "Forgot Your Password ?",
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                    ),
                    const Spacer(),
                    GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: const Text(
                        "Done",
                        style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                            color: Color.fromRGBO(29, 98, 202, 1)),
                      ),
                    )
                  ],
                ),
                const SizedBox(
                  height: 24,
                ),
                const Text(
                  "Email",
                ),
                TextfildGenral(
                  hintText: "e.g.email@example,com",
                ),
                const SizedBox(
                  height: 48,
                ),
                Container(
                  height: 45,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: const Color.fromRGBO(87, 50, 191, 1)),
                  child: const Text(
                    "Send reset link",
                    style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: Colors.white),
                  ),
                ),
                const SizedBox(
                  height: 24,
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                    myBottomsheetNumber();
                  },
                  child: Container(
                      alignment: Alignment.center,
                      child: const Text(
                        "Use mobile instead",
                        style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                            color: Color.fromRGBO(29, 98, 202, 1)),
                      )),
                ),
                const SizedBox(
                  height: 48,
                ),
              ],
            ),
          );
        });
  }

  TextEditingController mbcontroller = TextEditingController();
  void myBottomsheetNumber() {
    showModalBottomSheet(
        context: context,
        builder: (context) {
          return Padding(
            padding: const EdgeInsets.only(top: 25, right: 18, left: 18),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    const Text(
                      "Forgot Your Password ?",
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                    ),
                    const Spacer(),
                    GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: const Text(
                        "Done",
                        style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                            color: Color.fromRGBO(29, 98, 202, 1)),
                      ),
                    )
                  ],
                ),
                const SizedBox(
                  height: 24,
                ),
                MyNumberTextFild(controller: mbcontroller),
                const SizedBox(
                  height: 48,
                ),
                Container(
                  height: 45,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: const Color.fromRGBO(87, 50, 191, 1)),
                  child: const Text(
                    "Send reset link",
                    style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: Colors.white),
                  ),
                ),
                const SizedBox(
                  height: 24,
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                    myBottomSheetEmail();
                  },
                  child: Container(
                    alignment: Alignment.center,
                    child: const Text(
                      "Use email instead",
                      style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          color: Color.fromRGBO(29, 98, 202, 1)),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 48,
                ),
              ],
            ),
          );
        });
  }
}
