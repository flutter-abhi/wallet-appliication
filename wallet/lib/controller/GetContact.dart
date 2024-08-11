import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:wallet/model/User.dart';
import "package:http/http.dart" as http;

class GetContact with ChangeNotifier {
  List<User1> _contact = [];
  List get contacts => _contact;

  Future<void> getContact(String token) async {
    Uri url = Uri.parse(
        "https://wallet-backend-ruby.vercel.app/wallet/getAllContact");
    var response = await http.get(
      url,
      headers: {'Authorization': 'Bearer $token'},
    );

    if (response.statusCode == 200) {
      var respBody = jsonDecode(response.body);
      //log("$respBody");
      List<dynamic> data = respBody["data"];
      _contact = data.map((item) => User1.fromJson(item)).toList();

      log("history fetch successfully");
    }
  }
}
