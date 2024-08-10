import 'dart:convert';
import 'dart:developer';
import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class OtpProvider with ChangeNotifier {
  ///send Otp function
  bool _send = false;
  bool get isSend => _send;

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  bool _isVerify = false;
  bool get isVerify => _isVerify;

  Future<void> sendOtp(String contact) async {
    _send = false;
    _isLoading = true;
    notifyListeners();

    try {
      ///sending otp call
      Uri url =
          Uri.parse("https://wallet-backend-ruby.vercel.app/wallet/sendOTP");

      var body = jsonEncode({"contact": contact});

      http.Response response = await http
          .post(url, body: body, headers: {"Content-Type": "application/json"});

      //
      dynamic data = jsonDecode(response.body);
      log(data.toString());
      //
      if (response.statusCode == 200) {
        _send = true;
        notifyListeners();
        log(data.toString());
      } else {
        _send = false;
        notifyListeners();
      }
    } catch (error) {
      _send = false;
      notifyListeners();
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<void> verifyOtp({required String contact, required String otp}) async {
    _isVerify = false;
    _isLoading = true;
    notifyListeners();
    try {
      ///sending otp call
      Uri url =
          Uri.parse("https://wallet-backend-ruby.vercel.app/wallet/verifyOTP");

      var body = jsonEncode({"contact": contact, "otp": otp});

      http.Response response = await http
          .post(url, body: body, headers: {"Content-Type": "application/json"});

      //
      dynamic data = jsonDecode(response.body);

      if (response.statusCode == 200) {
        _isVerify = true;
        notifyListeners();
        log(data.toString());
      } else {
        _isVerify = false;
        notifyListeners();
      }
    } catch (error) {
      _isVerify = false;
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
