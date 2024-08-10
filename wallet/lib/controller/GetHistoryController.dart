import 'dart:convert';
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:wallet/model/transaction.dart';

class GetHistoryController extends ChangeNotifier {
  List<Transaction> _transactionHistory = [];
  bool _isloading = false;

  List<Transaction> get transactionHistoy => _transactionHistory;
  bool get isLoading => _isloading;

  Future<void> fetchHistory(String token) async {
    _isloading = true;
    notifyListeners();

    try {
      Uri url = Uri.parse(
          "https://wallet-backend-ruby.vercel.app/wallet/transactionHistory");

      var response = await http.get(
        url,
        headers: {'Authorization': 'Bearer $token'},
      );

      if (response.statusCode == 200) {
        var respBody = jsonDecode(response.body);
        //log("$respBody");
        List<dynamic> data = respBody["data"];
        _transactionHistory =
            data.map((item) => Transaction.fromJson(item)).toList();

        log("history fetch successfully");
      }
    } catch (e) {
      log("error during fetching history $e");
    } finally {
      _isloading = false;
      notifyListeners();
    }
  }
}
