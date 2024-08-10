import 'package:flutter/material.dart';

import 'package:wallet/view/MainScreens/MoreScreen.dart';
import 'package:wallet/view/Transfer/TransferToBeneficiary.dart';

class Users {
  String img;
  String name;
  String contact;
  Users({required this.img, required this.name, required this.contact});
}

List userList = [
  Users(img: "assets/users/user1.png", name: "Ali", contact: "+91 8767485746"),
  Users(img: "assets/users/user2.png", name: "Amar", contact: "+91 8767485746"),
  Users(
      img: "assets/users/user3.png", name: "Steve", contact: "+91 9822439978"),
  Users(
      img: "assets/users/user4.png",
      name: "Abidullah",
      contact: "+91 8767485746"),
  Users(
      img: "assets/users/user4.png",
      name: "Abidullah",
      contact: "+91 8767485746")
];

class TransferTo extends StatefulWidget {
  const TransferTo({super.key});

  @override
  State<TransferTo> createState() => _TransferToState();
}

class _TransferToState extends State<TransferTo> {
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
              "Transfer to",
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
                  "New Contact",
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
                    hintText: "Search Contact",
                    hintStyle:
                        TextStyle(color: Color.fromARGB(255, 190, 190, 190))),
              ),
            ),
            const SizedBox(
              height: 10,
            ),

            ///
            const Text(
              "Frequent Contact",
              style: TextStyle(fontWeight: FontWeight.w400),
            ),
            const SizedBox(
              height: 10,
            ),

            ///list
            ///
            ///
            ///
            SizedBox(
              height: 350,
              child: ListView.separated(
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                          return TransferToBenifitial(
                            userobj: userList[index],
                          );
                        }));
                      },
                      child: Container(
                        color: Colors.white,
                        child: Row(
                          children: [
                            Container(
                              height: 65,
                              width: 65,
                              decoration: const BoxDecoration(
                                  color: Color.fromRGBO(230, 221, 255, 1),
                                  shape: BoxShape.circle),
                              alignment: Alignment.center,
                              child: ClipOval(
                                child: Image.asset(userList[index].img),
                              ),
                            ),
                            const SizedBox(
                              width: 20,
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  userList[index].name,
                                  style: const TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.w600),
                                ),
                                Text(
                                  userList[index].contact,
                                  style: const TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w400,
                                      color: Colors.grey),
                                ),
                              ],
                            ),
                            const Spacer(),
                            const Text(
                              ">",
                              style: TextStyle(fontSize: 20),
                            )
                          ],
                        ),
                      ),
                    );
                  },
                  separatorBuilder: ((context, index) => const Divider()),
                  itemCount: userList.length),
            )
          ],
        ),
      ),
    );
  }
}
