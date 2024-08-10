import 'package:wallet/model/User.dart';

class Transaction {
  String id;
  User1 sender;
  User1 receiver;
  String amount;
  String date;
  String transactionNo;
  bool isCreadited;

  Transaction({
    required this.id,
    required this.sender,
    required this.receiver,
    required this.amount,
    required this.date,
    required this.transactionNo,
    required this.isCreadited,
  });

  factory Transaction.fromJson(Map<String, dynamic> json) {
    return Transaction(
      id: json['_id'] ?? '',
      sender: User1.fromJson(json['sender'] ?? {}),
      receiver: User1.fromJson(json['receiver'] ?? {}),
      amount: json['amount']?.toString() ??
          '0', // Safely convert amount to string and handle null
      date: json['date'] ?? '', // Providing a default empty string if null
      transactionNo: json['transactionNo'] ??
          '', // Providing a default empty string if null
      isCreadited: json['isCreadited'] ?? false, // Defaulting to false if null
    );
  }

  @override
  String toString() {
    return 'Transaction{id: $id, sender: ${sender.toString()}, receiver: ${receiver.toString()}, amount: $amount, date: $date, transactionNo: $transactionNo, isCreadited: $isCreadited}';
  }
}
