import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    required this.lableText,
    required this.controller,
    this.isObscure = false,
    this.onTap,
    Key? key,
  }) : super(key: key);

  final String lableText;
  final TextEditingController controller;
  final bool isObscure;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextField(
        onTap: onTap,
        obscureText: isObscure,
        controller: controller,
        decoration: InputDecoration(
          labelText: lableText,
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(
              color: Color.fromARGB(255, 108, 97, 97),
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(
              color: Color.fromARGB(255, 108, 97, 97),
            ),
          ),
        ),
      ),
    );
  }
}
