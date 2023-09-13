import 'package:flutter/material.dart';
import 'package:organiser/constants/controllers.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback onTap;
  const CustomButton({Key? key, required this.text, required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      child: Text(
        text,
        style: themeController.theme.textTheme.titleSmall,
      ),
      onPressed: onTap,
      style: ElevatedButton.styleFrom(
        backgroundColor: themeController.theme.primaryColor,
        minimumSize: const Size(double.infinity, 50),
      ),
    );
  }
}
