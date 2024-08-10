import 'dart:async';

import 'package:flutter/material.dart';

import 'package:wallet/controller/OtpController.dart';
import 'package:wallet/view/MainScreens/homeScreen.dart';
import "package:provider/provider.dart";

int _remainingTime = 30;
Timer? _timer;

class Otp1 extends StatefulWidget {
  final String contact;
  const Otp1({super.key, required this.contact});

  @override
  State<Otp1> createState() => _Otp1State();
}

class _Otp1State extends State<Otp1> {
  TextEditingController otpConroller = TextEditingController();

  @override
  void initState() {
    _remainingTime = 60;
    _sendOtp();
    super.initState();
  }

  void _sendOtp() async {
//send OTP
    await Provider.of<OtpProvider>(context, listen: false)
        .sendOtp(widget.contact);

    if (Provider.of<OtpProvider>(context, listen: false).isSend) {
      _remainingTime = 60;
      _startCountdown();
    } else {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text("Server Problem Otp cant send retry again")));
    }
  }

  void _startCountdown() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        if (_remainingTime > 0) {
          _remainingTime--;
        } else {
          timer.cancel();
        }
      });
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
    otpConroller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final otpProv = Provider.of<OtpProvider>(context, listen: false);

    // if (Provider.of<OtpProvider>(context, listen: false).isLoading) {
    //   return const Scaffold(
    //     body: Center(
    //       child: CircularProgressIndicator(),
    //     ),
    //   );
    // }
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
            Text(
              "+ ${widget.contact}",
              style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
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
            SizedBox(
              width: 240,
              child: TextField(
                controller: otpConroller,
                textAlign: TextAlign.center,
                style: const TextStyle(fontSize: 50),
                autofocus: true,
                keyboardType: TextInputType.number,
                //cursorHeight: 40,
                decoration: const InputDecoration(
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
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: () {
                    if (_remainingTime > 1) {
                      ScaffoldMessenger.of(context).clearSnackBars();
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          content:
                              Text("Please wait $_remainingTime  seconds")));
                    } else {
                      _sendOtp();
                    }
                    setState(() {});
                  },
                  child: Text(
                    "Resend Code",
                    style: TextStyle(
                        fontSize: 14,
                        color: (_remainingTime > 1) ? Colors.grey : Colors.blue,
                        fontWeight: FontWeight.w400),
                  ),
                ),
                Text(
                  " : $_remainingTime",
                  style: const TextStyle(
                      fontSize: 15, fontWeight: FontWeight.w400),
                )
              ],
            ),
            const Spacer(),
            GestureDetector(
              onTap: () async {
                await otpProv.verifyOtp(
                    contact: widget.contact, otp: otpConroller.text);
                //

                ///
                ///ehte handel karaychi 
                /////natar
                // if (otpProv.isVerify) {
                //   Navigator.push(context, MaterialPageRoute(builder: (context) {
                //     return const HomeScreen();
                //   }));
                // } else {
                //   _showErrorDialog("Invalid Otp !! Please Try again");
                // }

                ////oonly for timepass 
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
                child: (!otpProv.isLoading)
                    ? const Text(
                        "Done",
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
              height: 15,
            ),
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
            title: const Text('oops ! Login failed'),
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
