import 'package:flutter/cupertino.dart';
import 'package:flutter/widgets.dart';
import "package:stacked_card_carousel/stacked_card_carousel.dart";
import 'package:flutter/material.dart';
import 'package:wallet/view/Cards/CardsPayment.dart';
import 'package:wallet/widgets/BottemNavigation.dart';

class CardsDisplay extends StatefulWidget {
  const CardsDisplay({super.key});

  @override
  State<CardsDisplay> createState() => _CardsDisplayState();
}

class _CardsDisplayState extends State<CardsDisplay> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "My Cards",
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.w600),
        ),
        actions: const [
          Text(
            "Add card +  ",
            style: TextStyle(
                color: Color.fromRGBO(29, 98, 202, 1),
                fontSize: 16,
                fontWeight: FontWeight.w600),
          )
        ],
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: GestureDetector(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return const CardsPayment();
              }));
            },
            child: StackedCardCarousel(
              initialOffset: 00,
              spaceBetweenItems: 100,
              items: [
                Container(
                  height: 200,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(17),
                      color: const Color.fromARGB(255, 172, 155, 218),
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
                            Text("**** 4454",
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
                                    color:
                                        const Color.fromRGBO(111, 69, 233, 1))),
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
                                    color:
                                        const Color.fromRGBO(253, 194, 40, 1))),
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
                Container(
                  height: 200,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(17),
                      color: const Color.fromRGBO(111, 69, 233, 1),
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
                            Text("**** 3555",
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
                                    color:
                                        const Color.fromRGBO(111, 69, 233, 1))),
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
                                    color:
                                        const Color.fromRGBO(253, 194, 40, 1))),
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
                GestureDetector(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return const CardsPayment();
                    }));
                  },
                  child: Container(
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
                                      color: const Color.fromRGBO(
                                          111, 69, 233, 1))),
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
                                      color: const Color.fromRGBO(
                                          253, 194, 40, 1))),
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
                ),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: const MyBottomBar(index: 2),
    );
  }
}
