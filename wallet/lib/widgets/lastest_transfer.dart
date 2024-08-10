// lastest_transfer.dart

import 'dart:developer';
import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:wallet/controller/GetHistoryController.dart';
import "package:flutter_secure_storage/flutter_secure_storage.dart";
import 'package:wallet/controller/TransitionController.dart';
import 'package:wallet/model/transaction.dart';
import 'package:wallet/view/MainScreens/HistoryScreen.dart';

List<Transaction> _lastestTransacton = [];
List<Transaction> _resentTransfer = [];

class LastestTransfer extends StatefulWidget {
  const LastestTransfer({super.key});

  @override
  State<LastestTransfer> createState() => _LastestTransferState();
}

class _LastestTransferState extends State<LastestTransfer> {
  FlutterSecureStorage storage = FlutterSecureStorage();

  String? token;
  Future<void> readToken() async {
    try {
      String? jwt = await storage.read(key: "jwt_token");
      token = jwt;
    } catch (e) {
      print('Error reading token from secure storage: $e');
    }

    Provider.of<GetHistoryController>(context, listen: false)
        .fetchHistory(token!);
  }

  @override
  void initState() {
    readToken();
    super.initState();
  }

  void fetchLastTransaction() {
    List<Transaction> transaction =
        Provider.of<GetHistoryController>(context).transactionHistoy;
    transaction.forEach((element) {
      if (element.isCreadited && element.sender.type == "biller") {
        _lastestTransacton.add(element);
      } else if (element.isCreadited == false &&
          element.receiver.type == "biller") {
        _lastestTransacton.add(element);
      } else if (element.isCreadited &&
          !_resentTransfer.any((e) => e.sender.id == element.sender.id) &&
          !_resentTransfer.any((e) => e.receiver.id == element.sender.id) &&
          element.sender.type == "user") {
        _resentTransfer.add(element);
      } else if (!element.isCreadited &&
          !_resentTransfer.any((e) => e.receiver.id == element.receiver.id) &&
          !_resentTransfer.any((e) => e.sender.id == element.receiver.id) &&
          element.receiver.type == "user") {
        _resentTransfer.add(element);
      }
    });
  }

  int lengthOf() {
    if (_lastestTransacton.length < 5) {
      return _lastestTransacton.length;
    } else {
      return 4;
    }
  }

  int lengthOfTransfer() {
    if (_resentTransfer.length < 5) {
      return _resentTransfer.length;
    } else {
      return 4;
    }
  }

  @override
  Widget build(BuildContext context) {
    fetchLastTransaction();
    int lengthOfTransaction = lengthOf();
    int lengthOfRecentTransfer = lengthOfTransfer();
    return SingleChildScrollView(
      child: Container(
        width: MediaQuery.of(context).size.width,
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                children: [
                  const Text(
                    "Recent Transfer",
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const Spacer(),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return const HistoryScreen();
                      }));
                    },
                    child: const Text(
                      "See All",
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.grey,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 15,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: 65,
                    width: 65,
                    decoration: const BoxDecoration(
                        color: Color.fromRGBO(230, 221, 255, 1),
                        shape: BoxShape.circle),
                    alignment: Alignment.center,
                    child: const Icon(Icons.add),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  SizedBox(
                    height: 95,
                    width: MediaQuery.of(context).size.width - 115,
                    child: ListView.separated(
                      separatorBuilder: (context, index) {
                        return const SizedBox(
                          width: 10,
                        );
                      },
                      scrollDirection: Axis.horizontal,
                      itemCount: lengthOfRecentTransfer,
                      itemBuilder: (context, index) {
                        return Column(
                          children: [
                            if (_resentTransfer[index].isCreadited)
                              if (_resentTransfer[index].sender.image == null ||
                                  _resentTransfer[index].sender.image!.isEmpty)
                                Container(
                                  color: Colors.green.shade300,
                                  child: const Icon(
                                    Icons.arrow_back,
                                    color: Colors.white,
                                    size: 50,
                                  ),
                                )
                              else
                                SizedBox(
                                  height: 65,
                                  width: 65,
                                  child: ClipOval(
                                    //borderRadius: BorderRadius.circular(10),
                                    child: FadeInImage.assetNetwork(
                                      placeholder: "assets/loading.gif",
                                      image:
                                          _resentTransfer[index].sender.image ??
                                              '', // Ensure image is not null
                                      imageErrorBuilder:
                                          (context, error, stackTrace) {
                                        return Image.asset(
                                            'assets/users/user1.png'); // Fallback image
                                      },
                                      fit: BoxFit.cover,
                                      placeholderFit: BoxFit
                                          .cover, // Ensure placeholder fits as well
                                    ),
                                  ),
                                )
                            ////jar debit zale
                            ///manje sender mi ahe
                            ///aani paise send kele
                            else if (!_resentTransfer[index].isCreadited)
                              if (_resentTransfer[index].receiver.image ==
                                      null ||
                                  _resentTransfer[index]
                                      .receiver
                                      .image!
                                      .isEmpty)
                                Container(
                                  color: Colors.blue,
                                  child: const Icon(
                                    Icons.arrow_outward_rounded,
                                    color: Colors.white,
                                    size: 20,
                                  ),
                                )
                              else
                                SizedBox(
                                  height: 65,
                                  width: 65,
                                  child: ClipOval(
                                    //borderRadius: BorderRadius.circular(10),
                                    child: FadeInImage.assetNetwork(
                                      placeholder: "assets/loading.gif",
                                      image: _resentTransfer[index]
                                              .receiver
                                              .image ??
                                          '', // Ensure image is not null
                                      imageErrorBuilder:
                                          (context, error, stackTrace) {
                                        return Image.asset(
                                            'assets/users/user1.png'); // Fallback image
                                      },
                                      fit: BoxFit.cover,
                                      placeholderFit: BoxFit
                                          .cover, // Ensure placeholder fits as well
                                    ),
                                  ),
                                ),
                            const SizedBox(
                              height: 10,
                            ),
                            Text(
                              (_resentTransfer[index].isCreadited)
                                  ? _resentTransfer[index].sender.firstName
                                  : _resentTransfer[index].receiver.firstName,
                              style: const TextStyle(
                                fontSize: 12,
                              ),
                            )
                          ],
                        );
                      },
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  const Text(
                    "Latest Transaction",
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const Spacer(),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return const HistoryScreen();
                      }));
                    },
                    child: const Text(
                      "See All",
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.grey,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 15,
              ),
              if (_lastestTransacton.isEmpty)
                const Text("No Transaction")
              else
                SizedBox(
                  height: 300, // Fixed height for the ListView
                  child: ListView.separated(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: lengthOfTransaction,
                    itemBuilder: (context, index) {
                      return Row(
                        children: [
                          if (_lastestTransacton[index].isCreadited)
                            if (_lastestTransacton[index].sender.image ==
                                    null ||
                                _lastestTransacton[index].sender.image!.isEmpty)
                              Container(
                                color: Colors.green.shade300,
                                child: const Icon(
                                  Icons.arrow_back,
                                  color: Colors.white,
                                  size: 37,
                                ),
                              )
                            else
                              SizedBox(
                                height: 32,
                                width: 32,
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(10),
                                  child: FadeInImage.assetNetwork(
                                    placeholder: "assets/loading.gif",
                                    image: _lastestTransacton[index]
                                            .sender
                                            .image ??
                                        '', // Ensure image is not null
                                    imageErrorBuilder:
                                        (context, error, stackTrace) {
                                      return Image.asset(
                                          'assets/users/user1.png'); // Fallback image
                                    },
                                    fit: BoxFit.cover,
                                    placeholderFit: BoxFit
                                        .cover, // Ensure placeholder fits as well
                                  ),
                                ),
                              )
                          ////jar debit zale
                          ///manje sender mi ahe
                          ///aani paise send kele
                          else if (!_lastestTransacton[index].isCreadited)
                            if (_lastestTransacton[index].receiver.image ==
                                    null ||
                                _lastestTransacton[index]
                                    .receiver
                                    .image!
                                    .isEmpty)
                              Container(
                                color: Colors.blue,
                                child: const Icon(
                                  Icons.arrow_outward_rounded,
                                  color: Colors.white,
                                  size: 20,
                                ),
                              )
                            else
                              SizedBox(
                                height: 32,
                                width: 32,
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(10),
                                  child: FadeInImage.assetNetwork(
                                    placeholder: "assets/loading.gif",
                                    image: _lastestTransacton[index]
                                            .receiver
                                            .image ??
                                        '', // Ensure image is not null
                                    imageErrorBuilder:
                                        (context, error, stackTrace) {
                                      return Image.asset(
                                          'assets/users/user1.png'); // Fallback image
                                    },
                                    fit: BoxFit.cover,
                                    placeholderFit: BoxFit
                                        .cover, // Ensure placeholder fits as well
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
                                (_lastestTransacton[index].isCreadited)
                                    ? _lastestTransacton[index].sender.firstName
                                    : _lastestTransacton[index]
                                        .receiver
                                        .firstName,
                                style: const TextStyle(
                                    fontSize: 12, fontWeight: FontWeight.w600),
                              ),
                              Text(
                                formatDate(_lastestTransacton[index].date),
                                style: const TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w400,
                                    color: Colors.grey),
                              )
                            ],
                          ),
                          const Spacer(),
                          Text(
                            "₹ ${_lastestTransacton[index].amount}",
                            style: (Provider.of<TransactionController>(context)
                                    .listOfTransaction[index]
                                    .isCredited)
                                ? const TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400,
                                    color: Colors.green)
                                : const TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400,
                                    color: Colors.red),
                          ),
                        ],
                      );
                    },
                    separatorBuilder: (context, index) => const Divider(),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}

String formatDate(String isoDate) {
  // Parse the ISO date string
  DateTime dateTime = DateTime.parse(isoDate);

  // Format the date as "Dec 24 12:23"
  DateFormat formatter = DateFormat('MMM dd HH:mm');
  String formattedDate = formatter.format(dateTime);

  return formattedDate;
}
