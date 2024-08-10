import 'dart:ffi';

class User {
  String img;
  String name;
  String number;
  String email;
  String joinAt;

  User(
      {required this.img,
      required this.name,
      required this.email,
      required this.number,
      required this.joinAt});
}

User user = User(
    img: "assets/users/user1.png",
    name: " Rushikesh Kardile",
    email: "Rushikesh9@gmail.com",
    number: "9869868616",
    joinAt: "2 Years Ago");

///
///
class User1 {
  String firstName;
  String lastName;
  String createdAt;
  String contact;
  String email;
  String type;
  String id;
  String? image;
  double? walletBalance;

  User1(
      {required this.firstName,
      required this.lastName,
      required this.contact,
      required this.createdAt,
      required this.email,
      required this.id,
      required this.type,
      this.image,
      this.walletBalance});

  factory User1.fromJson(Map<String, dynamic> json) {
    return User1(
        firstName: json['firstName'],
        lastName: json['lastName'],
        contact: json['contact'],
        createdAt: json['createdAt'],
        email: json['email'],
        id: json['_id'],
        type: json['type'],
        image: json["image"]);
  }
}
