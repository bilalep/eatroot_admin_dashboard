import 'package:flutter/material.dart';

class LoginTextField extends StatelessWidget {
  const LoginTextField({
    Key? key,
    required this.controller,
    required this.labelText,
    required this.isObscure,
  }) : super(key: key);

  final String labelText;
  final TextEditingController controller;
  final bool isObscure;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      obscureText: isObscure,
      decoration: InputDecoration(
        hintText: labelText,
        hintStyle: const TextStyle(
          color: Colors.grey,
          fontSize: 16,
        ),
        border: const UnderlineInputBorder(),
        enabledBorder: const UnderlineInputBorder(
          borderSide: BorderSide(
            color: Colors.black54,
            width: 1.0,
          ),
        ),
        focusedBorder: const UnderlineInputBorder(
          borderSide: BorderSide(
            color: Colors.black,
            width: 2.0,
          ),
        ),
      ),
      style: Theme.of(context).textTheme.bodyText1,
    );
  }
}
