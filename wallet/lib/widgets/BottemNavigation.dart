import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:wallet/view/MainScreens/HistoryScreen.dart';
import 'package:wallet/view/MainScreens/homeScreen.dart';

class MyBottomBar extends StatefulWidget {
  final int index;
  const MyBottomBar({super.key, required this.index});

  @override
  State<MyBottomBar> createState() => _MyBottomBarState();
}

class _MyBottomBarState extends State<MyBottomBar> {
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      onTap: (value) {
        navigateScreen(value);
      },
      showUnselectedLabels: true,
      unselectedLabelStyle:
          const TextStyle(color: Color.fromRGBO(83, 93, 102, 1)),
      currentIndex: widget.index,
      selectedItemColor: const Color.fromRGBO(111, 69, 233, 1),
      unselectedItemColor: const Color.fromRGBO(83, 93, 102, 1),
      items: const [
        BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
        BottomNavigationBarItem(
            icon: Icon(
              Icons.list_alt_sharp,
            ),
            label: "History"),
        BottomNavigationBarItem(
            icon: Icon(Icons.calendar_today_outlined), label: "Cards"),
        BottomNavigationBarItem(
            icon: Icon(Icons.filter_none_sharp), label: "More")
      ],
    );
  }

  void navigateScreen(int index) {
    if (index == 0) {
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
        return const HomeScreen();
      }));
    } else if (index == 1) {
      Navigator.push(context, MaterialPageRoute(builder: (context) {
        return const HistoryScreen();
      }));
    }
  }
}
