import 'package:flutter/material.dart';

class CustomTextFieldAuth extends StatelessWidget {
  final String hint;
  final String hint2;
  final TextEditingController controller;
  // final Function(String)? onChanged;

  const CustomTextFieldAuth(
      {Key? key,
      required this.hint,
      required this.hint2,
      // this.onChanged,
      required this.controller})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: TextField(
          controller: controller,
          decoration: InputDecoration(
              filled: true,
              fillColor: Colors.white,
              hintText: hint,
              contentPadding: const EdgeInsets.only(bottom: 5.0, top: 12.5),
              focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.white))),
        ));
  }
}
