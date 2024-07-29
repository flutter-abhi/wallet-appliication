import 'package:flutter/material.dart';

class AboutWallet extends StatelessWidget {
  const AboutWallet({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leadingWidth: 100,
        leading: TextButton.icon(
          icon: const Icon(Icons.arrow_back_ios),
          label: const Text(
            "back",
            style: TextStyle(color: Colors.blue, fontSize: 18),
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: const Padding(
        padding: EdgeInsets.all(14.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "About wallet",
              style: TextStyle(fontSize: 36, fontWeight: FontWeight.w400),
            ),
            SizedBox(
              height: 30,
            ),
            Expanded(
                child: Text(
                    '''Our app allows you to easily store, manage, and spend your money on the go. With our secure platform, you can make transactions, check your balance, and track your spending all in one place.
        
        Whether you're paying bills, shopping online, or sending money to friends and family, our app makes it easy and convenient to do so. Plus, with our various promotions and discounts, you can save even more while using our app.
        
        Thank you for choosing us as your preferred e-wallet solution. If you have any questions or feedback, please don't hesitate to contact us. We're always here to help.'''))
          ],
        ),
      ),
    );
  }
}
