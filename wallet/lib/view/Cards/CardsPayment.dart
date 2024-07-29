import 'package:flutter/material.dart';
import 'package:wallet/view/Cards/Cards.dart';

class CardsPayment extends StatefulWidget {
  const CardsPayment({super.key});

  @override
  State<CardsPayment> createState() => _CardsPaymentState();
}

class _CardsPaymentState extends State<CardsPayment> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        title: GestureDetector(
          onTap: () {
            Navigator.pushReplacement(context,
                MaterialPageRoute(builder: (context) {
              return const CardsDisplay();
            }));
          },
          child: const Text(
            " < Back",
            style: TextStyle(
                color: Color.fromRGBO(29, 98, 202, 1),
                fontSize: 16,
                fontWeight: FontWeight.w600),
          ),
        ),
      ),
      body: Padding(
        padding:
            const EdgeInsets.only(top: 30.0, bottom: 30, right: 20, left: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              height: 200,
              width: double.infinity,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(17),
                  color: const Color.fromRGBO(39, 6, 133, 1),
                  boxShadow: const [
                    BoxShadow(
                        color: Color.fromRGBO(0, 0, 0, 0.2),
                        offset: Offset(0, 16),
                        blurRadius: 16)
                  ]),
              child: Stack(
                children: [
                  /// top name bar

                  const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text(
                          "Rushikesh Kardile",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 15,
                              fontWeight: FontWeight.w600),
                        ),
                        Text("**** 3254",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 15,
                                fontWeight: FontWeight.w600)),
                      ],
                    ),
                  ),

                  /// blue top circle
                  ///
                  Positioned(
                      top: -60,
                      left: -30,
                      child: Container(
                        height: 195,
                        width: 195,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(
                                width: 1,
                                color: const Color.fromRGBO(111, 69, 233, 1))),
                      )),

                  Positioned(
                      bottom: -120,
                      right: 10,
                      child: Container(
                          height: 195,
                          width: 195,
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            color: Color.fromRGBO(111, 69, 233, 1),
                          ))),

                  ///
                  ///yellow circle

                  Positioned(
                      top: 100,
                      right: -30,
                      child: Container(
                        height: 160,
                        width: 160,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(
                                width: 1,
                                color: const Color.fromRGBO(253, 194, 40, 1))),
                      )),

                  //
                  ///balance
                  const Positioned(
                    bottom: 20,
                    left: 10,
                    child: Column(
                      children: [
                        Text(
                          "Balance ",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 13,
                              fontWeight: FontWeight.w600),
                        ),
                        Text(
                          "\$ 2,354",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 22,
                              fontWeight: FontWeight.w600),
                        )
                      ],
                    ),
                  ),

                  /// wifi Icon
                  ///
                  const Positioned(
                      bottom: 20,
                      right: 20,
                      child: Icon(
                        Icons.wifi,
                        color: Colors.white,
                        size: 25,
                      )),
                ],
              ),
            ),
            const Column(
              children: [
                Icon(
                  Icons.wifi_outlined,
                  color: Color.fromRGBO(120, 131, 141, 1),
                  size: 39,
                ),
                Text("Move near a device to pay",
                    style: TextStyle(
                        color: Color.fromRGBO(120, 131, 141, 1),
                        fontWeight: FontWeight.w400,
                        fontSize: 17))
              ],
            ),
            Container(
              height: 50,
              width: double.infinity,
              color: const Color.fromRGBO(87, 50, 191, 1),
              alignment: Alignment.center,
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.qr_code,
                    color: Colors.white,
                  ),
                  Text(
                    "QR Pay",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                        fontWeight: FontWeight.w600),
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
