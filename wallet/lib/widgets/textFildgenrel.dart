import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class TextfildGenral extends StatefulWidget {
  String? hintText;
  Icon? suffixIcon;
  TextfildGenral({super.key, this.hintText, this.suffixIcon});

  @override
  State<TextfildGenral> createState() => _TextfildGenralState();
}

class _TextfildGenralState extends State<TextfildGenral> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 45,
      child: TextField(
        decoration: InputDecoration(
            border: const OutlineInputBorder(
                borderSide: BorderSide(color: Colors.grey)),
            hintText: widget.hintText,
            hintStyle: TextStyle(color: Colors.grey, fontSize: 14),
            suffixIcon: widget.suffixIcon),
      ),
    );
  }
}
