import 'package:flutter/material.dart';
import 'package:wallet/controller/TransitionController.dart';
import 'package:wallet/model/TranasationModelClass.dart';
import 'package:wallet/widgets/BottemNavigation.dart';
import 'package:provider/provider.dart';
import 'package:wallet/widgets/textFildgenrel.dart';

class HistoryScreen extends StatefulWidget {
  const HistoryScreen({super.key});

  @override
  State<HistoryScreen> createState() => _HistoryScreenState();
}

class _HistoryScreenState extends State<HistoryScreen> {
  @override
  Widget build(BuildContext context) {
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
              //
              //
              const Text(
                "Today",
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    color: Color.fromRGBO(83, 93, 102, 1)),
              ),

              ///
              ///
              ///
              SizedBox(
                child: ListView.separated(
                    physics: const ScrollPhysics(parent: null),
                    shrinkWrap: true,
                    separatorBuilder: (context, i) {
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            height: 8,
                            color: const Color.fromRGBO(237, 239, 246, 1),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              Provider.of<TransactionController>(context)
                                  .transactionAcrodingToDate[i + 1][0]
                                  .date,
                              style: const TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w400,
                                  color: Color.fromRGBO(83, 93, 102, 1)),
                            ),
                          ),
                        ],
                      );
                    },
                    itemCount: Provider.of<TransactionController>(context)
                        .transactionAcrodingToDate
                        .length,
                    itemBuilder: (context, i) {
                      return ListView.separated(
                          separatorBuilder: (context, i) {
                            return const Divider();
                          },
                          shrinkWrap: true,
                          physics: const ScrollPhysics(parent: null),
                          itemCount: Provider.of<TransactionController>(context)
                              .transactionAcrodingToDate[i]
                              .length,
                          itemBuilder: (context, index) {
                            return GestureDetector(
                              onTap: () {
                                _myBottomSheet(
                                    Provider.of<TransactionController>(context,
                                            listen: false)
                                        .transactionAcrodingToDate[i][index]);
                              },
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  children: [
                                    SizedBox(
                                      height: 36,
                                      width: 36,
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(10),
                                        child: Image.asset(
                                          Provider.of<TransactionController>(
                                                  context)
                                              .transactionAcrodingToDate[i]
                                                  [index]
                                              .image,
                                          height: 37,
                                          width: 37,
                                        ),
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          Provider.of<TransactionController>(
                                                  context)
                                              .transactionAcrodingToDate[i]
                                                  [index]
                                              .title,
                                          style: const TextStyle(
                                              fontSize: 12,
                                              fontWeight: FontWeight.w600),
                                        ),
                                        Row(
                                          children: [
                                            Text(
                                              Provider.of<TransactionController>(
                                                      context)
                                                  .transactionAcrodingToDate[i]
                                                      [index]
                                                  .date,
                                              style: const TextStyle(
                                                  fontSize: 12,
                                                  fontWeight: FontWeight.w400,
                                                  color: Colors.grey),
                                            ),
                                            Text(
                                              Provider.of<TransactionController>(
                                                      context)
                                                  .transactionAcrodingToDate[i]
                                                      [index]
                                                  .time,
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
                                    Text(
                                      "\$ ${Provider.of<TransactionController>(context).transactionAcrodingToDate[i][index].amount}",
                                      style:
                                          (Provider.of<TransactionController>(
                                                      context)
                                                  .transactionAcrodingToDate[i]
                                                      [index]
                                                  .isCredited)
                                              ? const TextStyle(
                                                  fontSize: 12,
                                                  fontWeight: FontWeight.w400,
                                                  color: Colors.green)
                                              : const TextStyle(
                                                  fontSize: 12,
                                                  fontWeight: FontWeight.w400,
                                                  color: Colors.red),
                                    ),
                                    const Text(" >")
                                  ],
                                ),
                              ),
                            );
                          });
                    }),
              ),

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

  void _myBottomSheet(Transation traObj) {
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
                        child: Image.asset(
                          traObj.image,
                          height: 37,
                          width: 37,
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
                          traObj.title,
                          style: const TextStyle(
                              fontSize: 16, fontWeight: FontWeight.w600),
                        ),
                        Row(
                          children: [
                            Text(
                              traObj.date,
                              style: const TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.grey),
                            ),
                            Text(
                              traObj.time,
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
                    "${traObj.isCredited ? "+" : "-"} \$ ${traObj.amount}",
                    style: TextStyle(
                        fontSize: 21,
                        fontWeight: FontWeight.w600,
                        color: traObj.isCredited ? Colors.green : Colors.red),
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
                          traObj.date,
                          style:
                              const TextStyle(fontSize: 12, color: Colors.grey),
                        ),
                        Text(
                          "${traObj.date} ${traObj.time}",
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
