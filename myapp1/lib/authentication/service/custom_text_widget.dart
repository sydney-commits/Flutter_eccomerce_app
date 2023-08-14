import 'package:flutter/material.dart';

class CustomTextField1 extends StatelessWidget {
  final String hint;
  final TextEditingController controller;
  // final Function(String)? onChanged;

  const CustomTextField1({Key? key, required this.hint, 
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
