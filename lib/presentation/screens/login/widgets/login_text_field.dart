import 'package:flutter/material.dart';
import 'package:tech_test/utils/colors.dart';
import 'package:tech_test/utils/text_styles.dart';

class LoginTextField extends StatefulWidget {
  const LoginTextField({
    super.key,
    required this.controller,
    required this.labelText,
    required this.isObscure,
  });

  final String labelText;
  final TextEditingController controller;
  final bool isObscure;

  @override
  State<LoginTextField> createState() => _LoginTextFieldState();
}

class _LoginTextFieldState extends State<LoginTextField> {
  bool passwordVisible = false;

  @override
  void initState() {
    super.initState();
    passwordVisible = widget.isObscure;
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: widget.controller,
      obscureText: passwordVisible,
      decoration: InputDecoration(
        isDense: true,
        hintText: widget.labelText,
        hintStyle: AppTextStyles.semiBoldBody(
          color: kColorBlack.withOpacity(0.5),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(
            width: 1.3,
            color: kColorBlack.withOpacity(0.3),
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(
            width: 1.3,
            color: kColorPrimaryPink.withOpacity(0.7),
          ),
        ),
        suffixIcon: widget.isObscure
            ? IconButton(
                icon: Icon(
                  passwordVisible ? Icons.visibility : Icons.visibility_off,
                  color: Colors.black54,
                ),
                onPressed: () {
                  setState(() {
                    passwordVisible = !passwordVisible;
                  });
                },
              )
            : const SizedBox(),
      ),
      style: AppTextStyles.mediumBody(),
    );
  }
}
