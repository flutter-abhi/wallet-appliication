import 'package:flutter/material.dart';
import 'package:wallet/model/User.dart';

class MyProfile extends StatefulWidget {
  const MyProfile({super.key});

  @override
  State<MyProfile> createState() => _MyProfileState();
}

class _MyProfileState extends State<MyProfile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          "profile Settings",
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            Container(
              height: 100,
              width: 100,
              decoration: BoxDecoration(
                  border: Border.all(
                      color: const Color.fromRGBO(79, 188, 168, 1), width: 2),
                  color: const Color.fromRGBO(230, 221, 255, 1),
                  shape: BoxShape.circle),
              alignment: Alignment.center,
              child: ClipOval(
                ///profile image
                /////
                ///
                child: Image.asset(user.img),
              ),
            ),
            Text(
              user.name,
              style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
            ),
            Text(
              " Joined ${user.joinAt}",
              style: const TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                  color: Colors.grey),
            ),
            const SizedBox(
              height: 40,
            ),
            Row(
              children: [
                Container(
                  height: 32,
                  width: 32,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: const Color.fromRGBO(230, 221, 255, 1)),
                  child: const Icon(
                    Icons.person_outline_rounded,
                    color: Color.fromRGBO(87, 50, 191, 1),
                    size: 20,
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Full name",
                      style: TextStyle(color: Colors.grey, fontSize: 12),
                    ),
                    Text(
                      user.name,
                      style: const TextStyle(
                          fontWeight: FontWeight.w600, fontSize: 12),
                    ),
                  ],
                ),
                const Spacer(),
                const Text(
                  "Edit",
                  style: TextStyle(fontSize: 14, color: Colors.blue),
                )
              ],
            ),
            const Divider(
              height: 30,
            ),
            Row(
              children: [
                Container(
                  height: 32,
                  width: 32,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: const Color.fromRGBO(201, 235, 229, 1)),
                  child: const Icon(
                    Icons.phone_android,
                    color: Color.fromRGBO(42, 144, 126, 1),
                    size: 20,
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Mobail",
                      style: TextStyle(color: Colors.grey, fontSize: 12),
                    ),
                    Text(
                      user.number,
                      style: const TextStyle(
                          fontWeight: FontWeight.w600, fontSize: 12),
                    ),
                  ],
                ),
                const Spacer(),
                const Text(
                  "Edit",
                  style: TextStyle(fontSize: 14, color: Colors.blue),
                )
              ],
            ),
            const Divider(
              height: 30,
            ),
            Row(
              children: [
                Container(
                  height: 32,
                  width: 32,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: const Color.fromRGBO(230, 246, 236, 1)),
                  child: const Icon(
                    Icons.email_outlined,
                    size: 20,
                    color: Color.fromRGBO(40, 155, 79, 1),
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Email",
                      style: TextStyle(color: Colors.grey, fontSize: 12),
                    ),
                    Text(
                      user.email,
                      style: const TextStyle(
                          fontWeight: FontWeight.w600, fontSize: 12),
                    ),
                  ],
                ),
                const Spacer(),
                const Text(
                  "Edit",
                  style: TextStyle(fontSize: 14, color: Colors.blue),
                )
              ],
            ),
            const Divider(
              height: 30,
            ),
            Row(
              children: [
                Container(
                  height: 32,
                  width: 32,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: const Color.fromRGBO(255, 214, 214, 1)),
                  child: const Icon(
                    Icons.lock_open_outlined,
                    size: 20,
                    color: Color.fromRGBO(184, 50, 50, 1),
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                const Text(
                  "Change Password",
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
