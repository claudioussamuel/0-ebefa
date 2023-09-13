import 'package:flutter/material.dart';

import '../constants/controllers.dart';

class PasswordTextField extends StatefulWidget {
  const PasswordTextField({super.key});

  @override
  State<PasswordTextField> createState() => _PasswordTextFieldState();
}

bool _obscureText = true;

class _PasswordTextFieldState extends State<PasswordTextField> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: authController.password,
      decoration: InputDecoration(
          hintText: "Password",
          suffixIcon: GestureDetector(
            onTap: () {
              setState(() {
                _obscureText = !_obscureText;
              });
            },
            child: Icon(_obscureText ? Icons.visibility : Icons.visibility_off),
          ),
          border: const OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.black,
            ),
          ),
          enabledBorder: const OutlineInputBorder(
              borderSide: BorderSide(
            color: Colors.black38,
          ))),
      obscureText: _obscureText,
    );
  }
}
