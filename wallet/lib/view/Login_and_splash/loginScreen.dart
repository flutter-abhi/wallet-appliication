// ignore_for_file: depend_on_referenced_packages, avoid_print

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'package:wallet/controller/login.dart';
import 'package:wallet/view/Login_and_splash/passwordEnter.dart';
import 'package:wallet/widgets/myNumberTextFild.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController controller = TextEditingController();
  PhoneNumber number = PhoneNumber(dialCode: "+91");

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
                  MyNumberTextFild(controller: controller),
                  // const Text("Mobail Number"),
                  // Container(
                  //   // height: 50,
                  //   decoration: BoxDecoration(
                  //     border: Border.all(width: 1, color: Colors.grey),
                  //     borderRadius: BorderRadius.circular(2),
                  //   ),
                  //   child: InternationalPhoneNumberInput(
                  //     onInputChanged: (PhoneNumber number) {
                  //       print(number.phoneNumber);
                  //     },

                  //     selectorConfig: const SelectorConfig(
                  //       selectorType: PhoneInputSelectorType.DROPDOWN,
                  //     ),

                  //     // autoValidateMode: AutovalidateMode.disabled,

                  //     initialValue: number,
                  //     textFieldController: controller,
                  //     keyboardType: const TextInputType.numberWithOptions(
                  //         signed: true, decimal: true),
                  //     inputDecoration: const InputDecoration(
                  //         hintText: "7xx-xxxxx",
                  //         hintStyle: TextStyle(color: Colors.grey),
                  //         focusedBorder: InputBorder.none,
                  //         border: InputBorder.none,
                  //         errorBorder: InputBorder.none,
                  //         enabledBorder: InputBorder.none),
                  //   ),
                  // ),

                  const SizedBox(
                    height: 24,
                  ),
                  GestureDetector(
                    onTap: () async {
                      _validateAndShowDialog();
                    },
                    child: Container(
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

// number validation sathi finction
  void _validateAndShowDialog() {
    String phoneNumber = controller.text;
    if (phoneNumber.length < 10 || !RegExp(r'^[0-9]+$').hasMatch(phoneNumber)) {
      _showErrorDialog();
    } else {
      Navigator.push(context, MaterialPageRoute(builder: (context) {
        return EnterPassword(contact: phoneNumber);
      }));
    }
  }

// for show dialog box is number is not validate
  void _showErrorDialog() {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Invalid Number'),
            content: const Text('Please enter a valid mobile number.'),
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
