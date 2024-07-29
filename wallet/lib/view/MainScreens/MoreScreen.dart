import 'package:flutter/material.dart';
import 'package:wallet/view/MainScreens/AboutWallet.dart';
import 'package:wallet/view/PayBills/payBills1.dart';
import 'package:wallet/view/Transfer/transfer.dart';
import 'package:wallet/widgets/BottemNavigation.dart';

class MoreScreen extends StatefulWidget {
  const MoreScreen({super.key});

  @override
  State<MoreScreen> createState() => _MoreScreenState();
}

class _MoreScreenState extends State<MoreScreen> {
  List moreItems = [
    {
      "icon": Icons.lightbulb_outline,
      "title": "Pay bills",
      "color": const Color.fromARGB(255, 237, 181, 247)
    },
    {
      "icon": Icons.electric_bolt_rounded,
      "title": "Transfer",
      "color": const Color.fromARGB(226, 240, 245, 172)
    },
    {
      "icon": Icons.upload_outlined,
      "title": "Top Up",
      "color": const Color.fromARGB(230, 186, 241, 225)
    },
    {
      "icon": Icons.download_outlined,
      "title": "Withdraw",
      "color": const Color.fromARGB(255, 142, 158, 210)
    },
    {
      "icon": Icons.analytics_outlined,
      "title": "Analytics",
      "color": const Color.fromARGB(240, 238, 153, 204)
    },
    {
      "icon": Icons.help_outlined,
      "title": "Help",
      "color": const Color.fromARGB(255, 239, 166, 166)
    },
    {
      "icon": Icons.contact_page,
      "title": "Contact us",
      "color": const Color.fromARGB(199, 168, 156, 237)
    },
    {
      "icon": Icons.more_sharp,
      "title": "About",
      "color": const Color.fromARGB(230, 247, 177, 177)
    },
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "More",
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.w600),
        ),
      ),
      body: ListView.separated(
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.only(
                  top: 10.0, bottom: 10, right: 20, left: 10),
              child: GestureDetector(
                onTap: () {
                  navigate(moreItems[index]["title"]);
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
                    Text(
                      moreItems[index]["title"],
                      style: const TextStyle(
                          fontSize: 16, fontWeight: FontWeight.w600),
                    ),
                    const Spacer(),
                    const Text(">")
                  ],
                ),
              ),
            );
          },
          separatorBuilder: (context, index) {
            if (index == 5) {
              return Container(
                height: 9,
                color: const Color.fromARGB(255, 226, 226, 226),
              );
            } else {
              return const Padding(
                padding: EdgeInsets.only(right: 20.0, left: 20),
                child: Divider(),
              );
            }
          },
          itemCount: moreItems.length),
      bottomNavigationBar: const MyBottomBar(
        index: 3,
      ),
    );
  }

  void navigate(String page) {
    /// about la move hoyla
    if (page == "About") {
      Navigator.of(context).push(MaterialPageRoute(builder: (context) {
        return const AboutWallet();
      }));
    }
    if (page == "Pay bills") {
      Navigator.of(context).push(MaterialPageRoute(builder: (context) {
        return const PayBills1();
      }));
    }

    if (page == "Transfer") {
      Navigator.of(context).push(MaterialPageRoute(builder: (context) {
        return const TransferTo();
      }));
    }
  }
}
