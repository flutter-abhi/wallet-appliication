import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:wallet/model/User.dart';

class LoginProvider with ChangeNotifier {
  static final FlutterSecureStorage secureStorage = FlutterSecureStorage();
  String? _token;
  bool _isSuccsess = false;
  bool get success => _isSuccsess;

  bool _isLoading = false;
  bool get isLoading => _isLoading;
  //
  bool _isAlreadyLoggedin = false;
  bool get isAlreadyLoggedin => _isAlreadyLoggedin;
//my user
  User1? _user;
  User1 get user => _user!;

  Future<String?> login({required String contact, required String pass}) async {
    _isLoading = true;
    notifyListeners();

    log("in login");
    var url = Uri.parse("https://wallet-backend-ruby.vercel.app/wallet/login");

    try {
      var body = jsonEncode({"contact": contact, "password": pass});

      var response = await http.post(
        url,
        headers: {
          "Content-Type": "application/json",
        },
        body: body,
      );

      var resdata = jsonDecode(response.body);
      if (response.statusCode == 200) {
        _isSuccsess = true;
        notifyListeners();

        if (resdata['success']) {
          _token = resdata['token'];
          log(_token!);
          await secureStorage.write(key: "jwt_token", value: _token);
          _user = User1(
              firstName: resdata["user"]["firstName"],
              lastName: resdata["user"]["lastName"],
              contact: resdata["user"]["contact"],
              createdAt: resdata["user"]["createdAt"],
              email: resdata["user"]["email"],
              id: resdata["user"]["_id"],
              type: resdata["user"]["type"],
              walletBalance: resdata["user"]["walletBalance"]);

          notifyListeners(); // Notify listeners about the change
          return "login successfull";
        } else {
          _isSuccsess = false;
          notifyListeners();
          return "Login failed: ${resdata['message']}";
        }
      } else {
        log('POST request failed with status: ${response.statusCode}');
        _isSuccsess = false;
        notifyListeners();
        return '${resdata['message']}';
      }
    } catch (e) {
      log('POST request error: $e');
      _isSuccsess = false;
      notifyListeners();
      return 'POST request error: $e';
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<String?> signUp(
      {required String contact,
      required String pass,
      required String firstName,
      required String lastName,
      required String type,
      required String email}) async {
    _isLoading = true;
    notifyListeners();

    log("in sign up");
    var url = Uri.parse("https://wallet-backend-ruby.vercel.app/wallet/signUp");

    try {
      var body = jsonEncode({
        "contact": contact,
        "password": pass,
        "email": email,
        "firstName": firstName,
        "lastName": lastName,
        "type": type
      });
      var response = await http.post(
        url,
        headers: {
          "Content-Type": "application/json",
        },
        body: body,
      );
      var data = jsonDecode(response.body);
      if (response.statusCode == 200) {
        _isSuccsess = true;
        notifyListeners();

        if (data['success']) {
          _token = data['token'];
          log(_token!);
          await secureStorage.write(key: "jwt_token", value: _token);
          _user = User1(
              firstName: data["user"]["firstName"],
              lastName: data["user"]["lastName"],
              contact: data["user"]["contact"],
              createdAt: data["user"]["createdAt"],
              email: data["user"]["email"],
              id: data["user"]["_id"],
              type: data["user"]["type"],
              walletBalance: data["user"]["walletBalance"]);
          notifyListeners(); // Notify listeners about the change
          return "Sign Up successfull";
        } else {
          _isSuccsess = false;
          notifyListeners();
          return "Sign Up failed: ${data['message']}";
        }
      } else {
        log('POST request failed with status: ${response.statusCode}');
        _isSuccsess = false;
        notifyListeners();
        return '${data['message']}';
      }
    } catch (e) {
      log('POST request error: $e');
      _isSuccsess = false;
      notifyListeners();
      return 'POST request error: $e';
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  ///is logged in or not
  Future<void> isLoggedIn() async {
    try {
      String? token = await secureStorage.read(key: "jwt_token");
      log(token!);
      Uri url =
          Uri.parse("https://wallet-backend-ruby.vercel.app/wallet/isLoggedIn");
      var response =
          await http.get(url, headers: {'Authorization': 'Bearer $token'});

      var data = jsonDecode(response.body);
      if (response.statusCode == 200) {
        _user = User1(
            firstName: data["user"]["firstName"],
            lastName: data["user"]["lastName"],
            contact: data["user"]["contact"],
            createdAt: data["user"]["createdAt"],
            email: data["user"]["email"],
            id: data["user"]["_id"],
            type: data["user"]["type"],
            walletBalance: data["user"]["walletBalance"]);
        _isAlreadyLoggedin = true;
        notifyListeners();
      }
    } catch (e) {
      log(e.toString());
    }
  }

  Future<void> readToken() async {
    try {
      String? jwt = await secureStorage.read(key: "jwt_token");
      _token = jwt;
      log('Retrieved token: $jwt');
      notifyListeners();
    } catch (e) {
      log('Error reading token from secure storage: $e');
    }
  }
}
