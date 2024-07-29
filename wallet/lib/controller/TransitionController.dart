import 'package:flutter/material.dart';
import 'package:wallet/model/TranasationModelClass.dart';

class TransactionController extends ChangeNotifier {
  final List<Transation> listOfTransaction = [
    Transation(
        title: "Walmart",
        date: "Today",
        amount: "35.23",
        isCredited: false,
        time: '12.32',
        image: "assets/transaction/img1.png"),
    Transation(
        title: "Nextflix",
        date: "Yesterday",
        amount: "13.00",
        isCredited: false,
        time: '12.44',
        image: "assets/transaction/img2.png"),
    Transation(
        title: "Nike",
        date: "Dec 24",
        amount: "50.00",
        isCredited: false,
        time: '2.33',
        image: "assets/transaction/img4.png"),
    Transation(
        title: "TopUp",
        date: "Dec 24",
        amount: "430.00",
        isCredited: true,
        time: '12.44',
        image: "assets/transaction/img3.png"),
    Transation(
        title: "Nike",
        date: "Dec 24",
        amount: "50.00",
        isCredited: false,
        time: '2.33',
        image: "assets/transaction/img4.png"),
    Transation(
        title: "Amazon",
        date: "Yesturday",
        amount: "50.00",
        isCredited: false,
        time: '4.33',
        image: "assets/transaction/img5.png"),
    Transation(
        title: "The  Home Depot",
        date: "Yesturday",
        amount: "150.00",
        isCredited: false,
        time: '2.33',
        image: "assets/transaction/img6.png"),
  ];

  List<List<Transation>> transactionAcrodingToDate = [
    [
      Transation(
          title: "Walmart",
          date: "Today",
          amount: "35.23",
          isCredited: false,
          time: '12.32',
          image: "assets/transaction/img1.png"),
      Transation(
          title: "TopUp",
          date: "Dec 24",
          amount: "430.00",
          isCredited: true,
          time: '12.44',
          image: "assets/transaction/img3.png"),
      Transation(
          title: "Amazon",
          date: "Yesturday",
          amount: "50.00",
          isCredited: false,
          time: '4.33',
          image: "assets/transaction/img5.png"),
    ],
    [
      Transation(
          title: "Nextflix",
          date: "Yesterday",
          amount: "13.00",
          isCredited: false,
          time: '12.44',
          image: "assets/transaction/img2.png"),
      Transation(
          title: "Amazon",
          date: "Yesturday",
          amount: "50.00",
          isCredited: false,
          time: '4.33',
          image: "assets/transaction/img5.png"),
      Transation(
          title: "The  Home Depot",
          date: "Yesturday",
          amount: "150.00",
          isCredited: false,
          time: '2.33',
          image: "assets/transaction/img6.png"),
    ],
    [
      Transation(
          title: "Nike",
          date: "Dec 24",
          amount: "50.00",
          isCredited: false,
          time: '2.33',
          image: "assets/transaction/img4.png"),
      Transation(
          title: "TopUp",
          date: "Dec 24",
          amount: "430.00",
          isCredited: true,
          time: '12.44',
          image: "assets/transaction/img3.png"),
      Transation(
          title: "Nike",
          date: "Dec 24",
          amount: "50.00",
          isCredited: false,
          time: '2.33',
          image: "assets/transaction/img4.png"),
    ]
  ];

  List userList = [
    Users(img: "assets/users/user1.png", name: "Ali"),
    Users(img: "assets/users/user2.png", name: "Amar"),
    Users(img: "assets/users/user3.png", name: "Steve"),
    Users(img: "assets/users/user4.png", name: "Abidullah")
  ];

  
}
