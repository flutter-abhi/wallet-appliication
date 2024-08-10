import 'package:flutter/material.dart';
import 'package:wallet/view/Transfer/transfer.dart';
import 'package:wallet/view/Transfer/transferFaile.dart';

class TransferToBenifitial extends StatefulWidget {
  final Users userobj;
  const TransferToBenifitial({super.key, required this.userobj});

  @override
  State<TransferToBenifitial> createState() => _TransferToBenifitialState();
}

class _TransferToBenifitialState extends State<TransferToBenifitial> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          //backgroundColor: const Color.fromARGB(255, 238, 233, 255),

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
            const Text(
              "Transfer To",
              style: TextStyle(fontSize: 26, fontWeight: FontWeight.w600),
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: 65,
                  width: 65,
                  decoration: const BoxDecoration(
                      color: Color.fromRGBO(230, 221, 255, 1),
                      shape: BoxShape.circle),
                  alignment: Alignment.center,
                  child: ClipOval(
                    child: Image.asset(widget.userobj.img),
                  ),
                ),
                const SizedBox(
                  width: 20,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.userobj.name,
                      style: const TextStyle(
                          fontSize: 16, fontWeight: FontWeight.w600),
                    ),
                    Text(
                      widget.userobj.contact,
                      style: const TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w600,
                          color: Colors.grey),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(
              height: 24,
            ),
            const Text(
              "Enter Amount",
              style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                  color: Colors.grey),
            ),
            const SizedBox(
              width: 240,
              child: TextField(
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 50),
                autofocus: true,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                    hintText: "\$ 00.00",
                    hintStyle: TextStyle(
                        fontSize: 50,
                        color: Color.fromRGBO(186, 194, 199, 1),
                        fontWeight: FontWeight.w400)),
              ),
            ),
            const SizedBox(
              height: 14,
            ),
            const Spacer(),
            GestureDetector(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return const TransferFail();
                }));
              },
              child: Container(
                height: 45,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: const Color.fromRGBO(87, 50, 191, 1)),
                child: const Text(
                  "Done",
                  style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: Colors.white),
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
}
