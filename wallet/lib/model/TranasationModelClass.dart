class Transation {
  String title;
  String date;
  String time;
  String amount;
  bool isCredited;
  String image;
  Transation(
      {required this.title,
      required this.date,
      required this.amount,
      required this.isCredited,
      required this.time,
      required this.image});
}

class Users {
  String img;
  String name;
  Users({required this.img, required this.name});
}
