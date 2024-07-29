// lastest_transfer.dart

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:wallet/controller/TransitionController.dart';

class LastestTransfer extends StatefulWidget {
  const LastestTransfer({super.key});

  @override
  State<LastestTransfer> createState() => _LastestTransferState();
}

class _LastestTransferState extends State<LastestTransfer> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        width: MediaQuery.of(context).size.width,
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Row(
                children: [
                  Text(
                    "Recent Transfer",
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Spacer(),
                  Text(
                    "See All",
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.grey,
                      fontWeight: FontWeight.w400,
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
                      itemCount: Provider.of<TransactionController>(context,
                              listen: false)
                          .userList
                          .length,
                      itemBuilder: (context, index) {
                        return Column(
                          children: [
                            Container(
                              height: 65,
                              width: 65,
                              decoration: const BoxDecoration(
                                  color: Color.fromRGBO(230, 221, 255, 1),
                                  shape: BoxShape.circle),
                              alignment: Alignment.center,
                              child: ClipOval(
                                child: Image.asset(
                                  Provider.of<TransactionController>(context)
                                      .userList[index]
                                      .img,
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Text(
                              Provider.of<TransactionController>(context)
                                  .userList[index]
                                  .name,
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
              const Row(
                children: [
                  Text(
                    "Latest Transaction",
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Spacer(),
                  Text(
                    "See All",
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.grey,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 15,
              ),
              Container(
                height: 300, // Fixed height for the ListView
                child: ListView.separated(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: 4,
                  itemBuilder: (context, index) {
                    return Row(
                      children: [
                        SizedBox(
                          height: 36,
                          width: 36,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: Image.asset(
                              Provider.of<TransactionController>(context)
                                  .listOfTransaction[index]
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
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              Provider.of<TransactionController>(context)
                                  .listOfTransaction[index]
                                  .title,
                              style: const TextStyle(
                                  fontSize: 12, fontWeight: FontWeight.w600),
                            ),
                            Row(
                              children: [
                                Text(
                                  Provider.of<TransactionController>(context)
                                      .listOfTransaction[index]
                                      .date,
                                  style: const TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w400,
                                      color: Colors.grey),
                                ),
                                const SizedBox(width: 5),
                                Text(
                                  Provider.of<TransactionController>(context)
                                      .listOfTransaction[index]
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
                          "\$ ${Provider.of<TransactionController>(context).listOfTransaction[index].amount}",
                          style: (Provider.of<TransactionController>(context)
                                  .listOfTransaction[index]
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
