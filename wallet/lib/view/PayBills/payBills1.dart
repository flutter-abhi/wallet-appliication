import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:wallet/view/MainScreens/MoreScreen.dart';
import 'package:wallet/view/PayBills/paymentSuccses.dart';

List moreItems = [
  {
    "icon": Icons.lightbulb_outline,
    "title": "Pay bills",
    "color": const Color.fromARGB(255, 237, 181, 247),
    "due": 132.2,
    "date": "Today",
  },
  {
    "icon": Icons.water_drop_outlined,
    "title": "Water",
    "color": const Color.fromARGB(226, 240, 245, 172),
    "due": 32.2,
    "date": "Dec 24",
  },
  {
    "icon": Icons.phone,
    "title": "Phone",
    "color": const Color.fromARGB(230, 186, 241, 225),
    "due": 0.0,
    "date": "Dec 24",
  },
];

class PayBills1 extends StatefulWidget {
  const PayBills1({super.key});

  @override
  State<PayBills1> createState() => _PayBills1State();
}

class _PayBills1State extends State<PayBills1> {
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
              return const MoreScreen();
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
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Pay to",
              style: TextStyle(fontWeight: FontWeight.w400, fontSize: 25),
            ),
            const SizedBox(
              height: 30,
            ),
            Row(
              children: [
                Container(
                  height: 50,
                  width: 50,
                  decoration: const BoxDecoration(
                      color: Color.fromRGBO(230, 221, 255, 1),
                      shape: BoxShape.circle),
                  alignment: Alignment.center,
                  child: const Icon(Icons.add),
                ),
                const SizedBox(
                  width: 20,
                ),
                const Text(
                  "New Biller ",
                  style: TextStyle(fontWeight: FontWeight.w400),
                ),
              ],
            ),
            const SizedBox(
              height: 30,
            ),
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SizedBox(
                  width: 120,
                  child: Divider(),
                ),
                Text(
                  " OR",
                  style: TextStyle(fontWeight: FontWeight.w400),
                ),
                SizedBox(
                  width: 120,
                  child: Divider(),
                ),
              ],
            ),
            const SizedBox(
              height: 30,
            ),
            SizedBox(
              height: 45,
              child: TextFormField(
                decoration: const InputDecoration(
                    contentPadding: EdgeInsets.all(11),
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey)),
                    focusedBorder: OutlineInputBorder(),
                    prefixIcon: Icon(Icons.search),
                    hintText: "Search Biller",
                    hintStyle:
                        TextStyle(color: Color.fromARGB(255, 190, 190, 190))),
              ),
            ),
            const SizedBox(
              height: 10,
            ),

            ///
            const Text(
              " Saved Biller",
              style: TextStyle(fontWeight: FontWeight.w400),
            ),
            const SizedBox(
              height: 10,
            ),

            ///list
            ///
            ///
            ListView.separated(
              shrinkWrap: true,
              itemCount: moreItems.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.only(
                      top: 10.0, bottom: 10, right: 20, left: 10),
                  child: GestureDetector(
                    onTap: () {
                      _myBottomSheet(moreItems[index]);
                      log("model sheet");
                      // bottom sheet
                    },
                    child: Row(
                      children: [
                        Container(
                          height: 35,
                          width: 35,
                          decoration: BoxDecoration(
                              color: moreItems[index]["color"],
                              borderRadius: BorderRadius.circular(8)),
                          child: Icon(moreItems[index]["icon"]),
                        ),
                        const SizedBox(
                          width: 8,
                        ),
                        Column(
                          children: [
                            Text(
                              moreItems[index]["title"],
                              style: const TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.w600),
                            ),
                            Text(
                              "Due :${moreItems[index]["due"]}",
                              style: const TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w400,
                                  color: Color.fromARGB(255, 115, 114, 114)),
                            ),
                          ],
                        ),
                        const Spacer(),
                        const Text(">")
                      ],
                    ),
                  ),
                );
              },
              separatorBuilder: (context, index) {
                return const Divider();
              },
            ),
          ],
        ),
      ),
    );
  }

  void _myBottomSheet(traObj) {
    showModalBottomSheet(
        context: context,
        builder: (context) {
          return Container(
            padding: const EdgeInsets.all(20),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  children: [
                    SizedBox(
                      height: 56,
                      width: 56,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Icon(
                          traObj["icon"],
                          size: 37,
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          traObj["title"],
                          style: const TextStyle(
                              fontSize: 16, fontWeight: FontWeight.w600),
                        ),
                        Row(
                          children: [
                            Text(
                              traObj["date"],
                              style: const TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.grey),
                            ),
                            const Text(
                              "   2021-2022",
                              style: const TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.grey),
                            )
                          ],
                        )
                      ],
                    ),
                    const Spacer(),
                    TextButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: const Text(
                          "Done",
                          style: TextStyle(
                              fontSize: 14,
                              color: Color.fromRGBO(29, 98, 202, 1)),
                        ))
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                Container(
                  height: 65,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 242, 230, 230),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Text(
                    "Due \$ ${traObj["due"]}",
                    style: const TextStyle(
                        fontSize: 21,
                        fontWeight: FontWeight.w600,
                        color: Colors.red),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Container(
                    padding: const EdgeInsets.all(10),
                    height: 65,
                    width: double.infinity,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(width: 1, color: Colors.grey)),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          traObj["date"],
                          style:
                              const TextStyle(fontSize: 12, color: Colors.grey),
                        ),
                        Text(
                          "${traObj["date"]}    2021-2022",
                          style: const TextStyle(fontSize: 14),
                        )
                      ],
                    )),
                const SizedBox(
                  height: 10,
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
                  height: 24,
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return PaymentSuccssful(traObj);
                    }));
                  },
                  child: Container(
                    height: 45,
                    width: double.infinity,
                    color: const Color.fromRGBO(253, 194, 40, 1),
                    alignment: Alignment.center,
                    child: const Text(
                      "Secure Payment",
                      style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 15,
                          color: Color.fromRGBO(39, 6, 133, 1)),
                    ),
                  ),
                )
              ],
            ),
          );
        });
  }
}
