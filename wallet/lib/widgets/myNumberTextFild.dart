import 'package:flutter/material.dart';
import "package:intl_phone_number_input/intl_phone_number_input.dart";

final PhoneNumber number = PhoneNumber(dialCode: "+91");

class MyNumberTextFild extends StatefulWidget {
  TextEditingController controller = TextEditingController();
  MyNumberTextFild({super.key, required this.controller});

  @override
  State<MyNumberTextFild> createState() => _MyNumberTextFildState();
}

class _MyNumberTextFildState extends State<MyNumberTextFild> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        const Text("Mobail Number"),
        Container(
          // height: 50,
          decoration: BoxDecoration(
            border: Border.all(width: 1, color: Colors.grey),
            borderRadius: BorderRadius.circular(2),
          ),
          child: InternationalPhoneNumberInput(
            onInputChanged: (PhoneNumber number) {
              print(number.phoneNumber);
            },

            selectorConfig: const SelectorConfig(
              selectorType: PhoneInputSelectorType.DROPDOWN,
            ),

            // autoValidateMode: AutovalidateMode.disabled,

            initialValue: number,
            textFieldController: widget.controller,
            keyboardType: const TextInputType.numberWithOptions(
                signed: true, decimal: true),
            inputDecoration: const InputDecoration(
                hintText: "7xx-xxxxx",
                hintStyle: TextStyle(color: Colors.grey),
                focusedBorder: InputBorder.none,
                border: InputBorder.none,
                errorBorder: InputBorder.none,
                enabledBorder: InputBorder.none),
          ),
        ),
      ],
    );
  }
}
