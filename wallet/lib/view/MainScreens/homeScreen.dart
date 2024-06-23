import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:wallet/controller/TransitionController.dart';
import 'package:wallet/widgets/BottemNavigation.dart';

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

        ///
        ///AppBar
        appBar: AppBar(
          backgroundColor: const Color.fromRGBO(39, 6, 133, 1),
          leading: ClipOval(
            child: Image.asset("assets/home/user1.png"),
          ),
          title: const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "hellow",
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

        ////
        ///
        body: SizedBox(
          height: MediaQuery.of(context).size.height,
          child: Column(
            children: [
              // Balance
              ////
              ///
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
                              "WithDraw",
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
/////////
////////
              ///
              ///
              ///
              SingleChildScrollView(
                child: Container(
                  height: 410,
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
                        ////
                        ///
                        ///
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
                                  itemCount: 4,
                                  itemBuilder: (context, index) {
                                    return Column(
                                      children: [
                                        Container(
                                          height: 65,
                                          width: 65,
                                          decoration: const BoxDecoration(
                                              color: Color.fromRGBO(
                                                  230, 221, 255, 1),
                                              shape: BoxShape.circle),
                                          alignment: Alignment.center,
                                          child: ClipOval(
                                            child: Image.asset(
                                              Provider.of<TransactionController>(
                                                      context)
                                                  .userList[index]
                                                  .img,
                                            ),
                                          ),
                                        ),
                                        const SizedBox(
                                          height: 10,
                                        ),
                                        Text(
                                          Provider.of<TransactionController>(
                                                  context)
                                              .userList[index]
                                              .name,
                                          style: const TextStyle(
                                            fontSize: 12,
                                          ),
                                        )
                                      ],
                                    );
                                  }),
                            ),
                          ],
                        ),
                        ////
                        ///
                        ///
                        const SizedBox(
                          height: 20,
                        ),
                        const Row(
                          children: [
                            Text(
                              "Lastest Transaction",
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
                        ////bulder
                        ///
                        const SizedBox(
                          height: 15,
                        ),
                        SizedBox(
                          //height: double.infinity,
                          child: ListView.separated(
                            shrinkWrap: true,
                            physics: const ScrollPhysics(parent: null),
                            itemCount: 3,
                            itemBuilder: (context, index) {
                              return Row(
                                children: [
                                  SizedBox(
                                    height: 36,
                                    width: 36,
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(10),
                                      child: Image.asset(
                                        Provider.of<TransactionController>(
                                                context)
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
                                    children: [
                                      Text(
                                        Provider.of<TransactionController>(
                                                context)
                                            .listOfTransaction[index]
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
                                                .listOfTransaction[index]
                                                .date,
                                            style: const TextStyle(
                                                fontSize: 12,
                                                fontWeight: FontWeight.w400,
                                                color: Colors.grey),
                                          ),
                                          Text(
                                            Provider.of<TransactionController>(
                                                    context)
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
                                    style: (Provider.of<TransactionController>(
                                                context)
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
                            separatorBuilder: (context, index) =>
                                const Divider(),
                          ),
                        ),
                        ////
                        ///
                        ///
                        ///
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
        bottomNavigationBar: const MyBottomBar(
          index: 0,
        ));
  }
}
