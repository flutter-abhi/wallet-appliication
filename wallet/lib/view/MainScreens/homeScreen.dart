// home_screen.dart

import 'package:flutter/material.dart';
import 'package:wallet/widgets/BottemNavigation.dart';

import 'package:wallet/widgets/lastest_transfer.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(39, 6, 133, 1),

      /// AppBar
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(39, 6, 133, 1),
        leading: ClipOval(
          child: Image.asset("assets/home/user1.png"),
        ),
        title: const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Hello",
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                  fontSize: 14),
            ),
            Text(
              "Rushikesh!",
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                  fontSize: 14),
            ),
          ],
        ),
        actions: const [
          Icon(
            Icons.settings_outlined,
            color: Colors.white,
          ),
          SizedBox(
            width: 15,
          )
        ],
      ),

      /// Body
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Balance
            Container(
              height: 178,
              margin: const EdgeInsets.all(16),
              padding: const EdgeInsets.only(top: 23, right: 32, left: 32),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  gradient: const LinearGradient(
                      begin: Alignment.topRight,
                      end: Alignment.bottomLeft,
                      colors: [
                        Color.fromRGBO(80, 51, 164, 1),
                        Color.fromRGBO(51, 16, 152, 0.65)
                      ])),
              child: Column(
                children: [
                  const Text(
                    "Main Balance",
                    style: TextStyle(
                        color: Color.fromRGBO(178, 161, 228, 1),
                        fontWeight: FontWeight.w400,
                        fontSize: 12),
                  ),
                  const Text(
                    "\$14,235",
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                        fontSize: 36),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      const Column(
                        children: [
                          Icon(
                            Icons.upload_outlined,
                            color: Colors.white,
                            size: 18,
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Text(
                            "Top Up",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 12,
                                fontWeight: FontWeight.w400),
                          )
                        ],
                      ),
                      Container(
                          height: 24,
                          width: 1,
                          color: const Color.fromARGB(181, 255, 255, 255)),
                      const Column(
                        children: [
                          Icon(
                            Icons.download_outlined,
                            color: Color.fromARGB(255, 255, 255, 255),
                            size: 18,
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Text(
                            "Withdraw",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 12,
                                fontWeight: FontWeight.w400),
                          )
                        ],
                      ),
                      Container(
                        height: 24,
                        width: 1,
                        color: const Color.fromARGB(181, 255, 255, 255),
                      ),
                      const Column(
                        children: [
                          Icon(
                            Icons.replay_circle_filled_outlined,
                            color: Colors.white,
                            size: 18,
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Text(
                            "Transfer",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 12,
                                fontWeight: FontWeight.w400),
                          )
                        ],
                      )
                    ],
                  )
                ],
              ),
            ),
            // Latest Transfers
            const LastestTransfer(),
          ],
        ),
      ),
      bottomNavigationBar: const MyBottomBar(index: 0),
    );
  }
}
