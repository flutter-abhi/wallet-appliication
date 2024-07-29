import 'package:flutter/material.dart';
import 'package:wallet/view/MainScreens/homeScreen.dart';

class PaymentSuccssful extends StatefulWidget {
  final trobj;
  const PaymentSuccssful(
    this.trobj, {
    super.key,
  });

  @override
  State<PaymentSuccssful> createState() => _PaymentSuccssfulState();
}

class _PaymentSuccssfulState extends State<PaymentSuccssful> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            const SizedBox(
              height: 55,
            ),
            Image.asset(
              "assets/Success.png",
              height: 210,
              width: 210,
            ),
            const SizedBox(
              height: 25,
            ),
            const Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Payment details",
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
                ),
              ],
            ),
            const SizedBox(
              height: 15,
            ),
            Container(
              padding: const EdgeInsets.all(10),
              height: 65,
              width: double.infinity,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(width: 1, color: Colors.grey)),
              child: const Row(
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Biller",
                        style: TextStyle(fontSize: 12, color: Colors.grey),
                      ),
                      Text(
                        "Electrical Company inc",
                        style: TextStyle(fontSize: 14),
                      )
                    ],
                  ),
                  Spacer(),
                  Icon(
                    Icons.copy,
                    size: 24,
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            Container(
              padding: const EdgeInsets.all(10),
              height: 65,
              width: double.infinity,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(width: 1, color: Colors.grey)),
              child: const Row(
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Amount ",
                        style: TextStyle(fontSize: 12, color: Colors.grey),
                      ),
                      Text(
                        "\$ 132.32",
                        style: TextStyle(fontSize: 14),
                      )
                    ],
                  ),
                  Spacer(),
                  Icon(
                    Icons.copy,
                    size: 24,
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            Container(
              padding: const EdgeInsets.all(10),
              height: 65,
              width: double.infinity,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(width: 1, color: Colors.grey)),
              child: const Row(
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Transaction no.",
                        style: TextStyle(fontSize: 12, color: Colors.grey),
                      ),
                      Text(
                        "23010412432431",
                        style: TextStyle(fontSize: 14),
                      )
                    ],
                  ),
                  Spacer(),
                  Icon(
                    Icons.copy,
                    size: 24,
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 25,
            ),
            const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.flag,
                  color: Colors.red,
                  size: 22,
                ),
                Text(
                  "Report a Problem",
                  style: TextStyle(
                      color: Colors.red,
                      fontSize: 15,
                      fontWeight: FontWeight.w600),
                )
              ],
            ),
            const SizedBox(
              height: 35,
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
