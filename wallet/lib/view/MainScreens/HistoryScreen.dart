import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:wallet/controller/GetHistoryController.dart';
import 'package:wallet/model/transaction.dart';
import 'package:wallet/widgets/BottemNavigation.dart';
import 'package:provider/provider.dart';
import 'package:wallet/widgets/textFildgenrel.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:intl/intl.dart';

class HistoryScreen extends StatefulWidget {
  const HistoryScreen({super.key});

  @override
  State<HistoryScreen> createState() => _HistoryScreenState();
}

class _HistoryScreenState extends State<HistoryScreen> {
  final FlutterSecureStorage storage = FlutterSecureStorage();
  String? _token = null;

//
  @override
  void initState() {
    readToken();
    super.initState();
  }

  Future<void> readToken() async {
    try {
      String? jwt = await storage.read(key: "jwt_token");
      _token = jwt;
    } catch (e) {
      log('Error reading token from secure storage: $e');
    }

    ///fetch call
    await Provider.of<GetHistoryController>(context, listen: false)
        .fetchHistory(_token!);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final historyProvider =
        Provider.of<GetHistoryController>(context, listen: false);
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: 45.0, right: 16, left: 16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // item 1
              const Text(
                "History",
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.w600),
              ),
              const SizedBox(
                height: 10,
              ),
              // search Box and Filter Options
              //
              SizedBox(
                width: MediaQuery.of(context).size.width - 40,
                child: Row(
                  children: [
                    SizedBox(
                      height: 39,
                      width: 200,
                      child: TextfildGenral(
                        prefixIcon: const Icon(Icons.search),
                        hintText: "Values goes here",
                      ),
                    ),
                    const Spacer(),
                    Container(
                      width: 90,
                      height: 39,
                      decoration: BoxDecoration(
                        // color: Colors.pink,
                        border: Border.all(
                            width: 2,
                            color: const Color.fromRGBO(225, 227, 237, 1)),
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: const Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Icon(Icons.menu_open),
                          Text(
                            "Filter",
                            style: TextStyle(
                                fontSize: 14, fontWeight: FontWeight.w400),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              SizedBox(
                  child: ListView.separated(
                      separatorBuilder: (context, i) {
                        if (isNewDay(
                            historyProvider.transactionHistoy[i].date)) {
                          return Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                margin:
                                    const EdgeInsets.only(top: 8, bottom: 8),
                                height: 5,
                                color: const Color.fromRGBO(237, 239, 246, 1),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.only(top: 12, bottom: 12),
                                child: Text(
                                  formatCustomDay(historyProvider
                                      .transactionHistoy[i].date),
                                  style: const TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w400,
                                      color: Color.fromRGBO(83, 93, 102, 1)),
                                ),
                              ),
                            ],
                          );
                        } else {
                          return const Divider();
                        }
                      },
                      shrinkWrap: true,
                      physics: const ScrollPhysics(parent: null),
                      itemCount: historyProvider.transactionHistoy.length,
                      itemBuilder: (context, index) {
                        if (isNewDay(
                            historyProvider.transactionHistoy[index].date)) {
                          return Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding:
                                    const EdgeInsets.only(top: 12, bottom: 12),
                                child: Text(
                                  formatCustomDay(historyProvider
                                      .transactionHistoy[index].date),
                                  style: const TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w400,
                                      color: Color.fromRGBO(83, 93, 102, 1)),
                                ),
                              ),
                            ],
                          );
                        }
                        return GestureDetector(
                          onTap: () {
                            _myBottomSheet(
                                historyProvider.transactionHistoy[index]);
                          },
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              children: [
                                if (isNewDay(historyProvider
                                    .transactionHistoy[index].date))
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        top: 12, bottom: 12),
                                    child: Text(
                                      formatCustomDay(historyProvider
                                          .transactionHistoy[index].date),
                                      style: const TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w400,
                                          color:
                                              Color.fromRGBO(83, 93, 102, 1)),
                                    ),
                                  ),

                                ///
                                if (historyProvider
                                    .transactionHistoy[index].isCreadited)
                                  if (historyProvider.transactionHistoy[index]
                                              .sender.image ==
                                          null ||
                                      historyProvider.transactionHistoy[index]
                                          .sender.image!.isEmpty)
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
                                          image: historyProvider
                                                  .transactionHistoy[index]
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
                                else if (!historyProvider
                                    .transactionHistoy[index].isCreadited)
                                  if (historyProvider.transactionHistoy[index]
                                              .receiver.image ==
                                          null ||
                                      historyProvider.transactionHistoy[index]
                                          .receiver.image!.isEmpty)
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
                                          image: historyProvider
                                                  .transactionHistoy[index]
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

                                ///
                                const SizedBox(
                                  width: 10,
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      (historyProvider.transactionHistoy[index]
                                              .isCreadited)
                                          ? historyProvider
                                              .transactionHistoy[index]
                                              .sender
                                              .firstName
                                          : historyProvider
                                              .transactionHistoy[index]
                                              .receiver
                                              .firstName,
                                      style: const TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w600),
                                    ),
                                    const SizedBox(
                                      height: 5,
                                    ),
                                    Row(
                                      children: [
                                        Text(
                                          formatCustomDate(historyProvider
                                              .transactionHistoy[index].date),
                                          style: const TextStyle(
                                              fontSize: 12,
                                              fontWeight: FontWeight.w400,
                                              color: Colors.grey),
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                                const Spacer(),
                                Column(
                                  children: [
                                    Text(
                                      "₹ ${historyProvider.transactionHistoy[index].amount}",
                                      style: (historyProvider
                                              .transactionHistoy[index]
                                              .isCreadited)
                                          ? const TextStyle(
                                              fontSize: 12,
                                              fontWeight: FontWeight.w400,
                                              color: Colors.green)
                                          : const TextStyle(
                                              fontSize: 12,
                                              fontWeight: FontWeight.w400,
                                              color: Colors.red),
                                    ),
                                    const SizedBox(
                                      height: 5,
                                    ),
                                    Text(
                                      (historyProvider.transactionHistoy[index]
                                              .isCreadited)
                                          ? "Credited"
                                          : "Debited",
                                      style: const TextStyle(fontSize: 12),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        );
                      })),

              ///columb ends
            ],
          ),
        ),
      ),
      bottomNavigationBar: const MyBottomBar(
        index: 1,
      ),
    );
  }

  DateTime? _lastDate; // Track the last processed date

  bool isNewDay(String isoDate) {
    DateTime dateTime = DateTime.parse(isoDate);

    // If this is the first date we're checking, it's a new day by default
    if (_lastDate == null) {
      _lastDate = dateTime;
      return true;
    }

    // Compare the current date with the last processed date
    bool isNewDay = DateTime(_lastDate!.year, _lastDate!.month, _lastDate!.day)
            .difference(DateTime(dateTime.year, dateTime.month, dateTime.day))
            .inDays !=
        0;

    // Update the last processed date
    _lastDate = dateTime;

    return isNewDay;
  }

  String formatCustomDate(String isoDate) {
    // Parse the ISO date string
    DateTime dateTime = DateTime.parse(isoDate);
    // Get the current date and time
    DateTime now = DateTime.now();
    // Calculate difference in days between the current date and the parsed date
    int differenceInDays = DateTime(now.year, now.month, now.day)
        .difference(DateTime(dateTime.year, dateTime.month, dateTime.day))
        .inDays;

    if (differenceInDays == 0) {
      // If the date is today
      return 'Today ${DateFormat('HH:mm').format(dateTime)}';
    } else if (differenceInDays == 1) {
      // If the date is yesterday
      return 'Yesterday ${DateFormat('HH:mm').format(dateTime)}';
    } else if (differenceInDays < 5) {
      ///difffrencre kiti aahe to
      return '$differenceInDays days ago ${DateFormat('HH:mm').format(dateTime)}';
    } else {
      // For all other dates, format normally as "MMM dd HH:mm"
      return DateFormat('MMM dd HH:mm').format(dateTime);
    }
  }

  String formatCustomDay(String isoDate) {
    // Parse the ISO date string
    DateTime dateTime = DateTime.parse(isoDate);

    // Get the current date and time
    DateTime now = DateTime.now();

    // Calculate difference in days between the current date and the parsed date
    int differenceInDays = DateTime(now.year, now.month, now.day)
        .difference(DateTime(dateTime.year, dateTime.month, dateTime.day))
        .inDays;

    if (differenceInDays == 0) {
      // If the date is today
      return 'Today ';
    } else if (differenceInDays == 1) {
      // If the date is yesterday
      return 'Yesterday ';
    } else if (differenceInDays < 5) {
      ///difffrencre kiti aahe to
      return '$differenceInDays days ago ';
    } else {
      // For all other dates, format normally as "MMM dd HH:mm"
      return DateFormat('MMM dd').format(dateTime);
    }
  }

  ///
  String formatDate(String isoDate) {
    // Parse the ISO date string
    DateTime dateTime = DateTime.parse(isoDate);

    // Format the date as "Dec 24 12:23"
    DateFormat formatter = DateFormat('MMM dd HH:mm');
    String formattedDate = formatter.format(dateTime);

    return formattedDate;
  }

  ///

  void _myBottomSheet(Transaction traObj) {
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
                    ///paise aale mala
                    ///reciver mi aahe
                    ///mg sender cha change karu
                    if (traObj.isCreadited)
                      if (traObj.sender.image == null ||
                          traObj.sender.image!.isEmpty)
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
                          height: 56,
                          width: 56,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: FadeInImage.assetNetwork(
                              placeholder: "assets/loading.gif",
                              image: traObj.sender.image ??
                                  '', // Ensure image is not null
                              imageErrorBuilder: (context, error, stackTrace) {
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
                    else if (!traObj.isCreadited)
                      if (traObj.receiver.image == null ||
                          traObj.receiver.image!.isEmpty)
                        Container(
                          color: Colors.blue,
                          child: const Icon(
                            Icons.arrow_outward_rounded,
                            color: Colors.white,
                            size: 37,
                          ),
                        )
                      else
                        SizedBox(
                          height: 56,
                          width: 56,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: FadeInImage.assetNetwork(
                              placeholder: "assets/loading.gif",
                              image: traObj.receiver.image ??
                                  '', // Ensure image is not null
                              imageErrorBuilder: (context, error, stackTrace) {
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
                          " ${traObj.receiver.firstName} ${traObj.receiver.lastName}",
                          style: const TextStyle(
                              fontSize: 16, fontWeight: FontWeight.w600),
                        ),
                        Row(
                          children: [
                            Text(
                              traObj.receiver.email,
                              style: const TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.grey),
                            ),
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
                    "${traObj.isCreadited ? "+" : "-"} ₹ ${traObj.amount}",
                    style: TextStyle(
                        fontSize: 21,
                        fontWeight: FontWeight.w600,
                        color: traObj.isCreadited ? Colors.green : Colors.red),
                  ),
                ),
                const SizedBox(
                  height: 5,
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
                          formatCustomDate(traObj.date),
                          style:
                              const TextStyle(fontSize: 12, color: Colors.grey),
                        ),
                        Text(
                          formatDate(traObj.date),
                          style: const TextStyle(fontSize: 14),
                        )
                      ],
                    )),
                const SizedBox(
                  height: 5,
                ),
                Container(
                  padding: const EdgeInsets.all(10),
                  height: 65,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(width: 1, color: Colors.grey)),
                  child: Row(
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "Transaction no.",
                            style: TextStyle(fontSize: 12, color: Colors.grey),
                          ),
                          Text(
                            traObj.transactionNo,
                            style: const TextStyle(fontSize: 14),
                          )
                        ],
                      ),
                      const Spacer(),
                      const Icon(
                        Icons.copy,
                        size: 24,
                      )
                    ],
                  ),
                ),
                const SizedBox(
                  height: 24,
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
              ],
            ),
          );
        });
  }
}



////
// ///ListView.separated(
//                     physics: const ScrollPhysics(parent: null),
//                     shrinkWrap: true,
//                     separatorBuilder: (context, i) {
//                       return Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           Container(
//                             height: 8,
//                             color: const Color.fromRGBO(237, 239, 246, 1),
//                           ),
//                           const Padding(
//                             padding: EdgeInsets.all(8.0),
//                             child: Text(
//                               "date nusar sort ",
//                               style: TextStyle(
//                                   fontSize: 16,
//                                   fontWeight: FontWeight.w400,
//                                   color: Color.fromRGBO(83, 93, 102, 1)),
//                             ),
//                           ),
//                         ],
//                       );
//                     },
//                     itemCount: 3,
//                     itemBuilder: (context, i) {
//                       return