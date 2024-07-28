import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  final String label;
  final Color buttonBgColor;
  final dynamic onPressed;
  @override
  const Button({
    super.key,
    required this.label,
    required this.buttonBgColor,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      minWidth: double.infinity,
      height: 45,
      onPressed: onPressed,
      color: buttonBgColor,
      elevation: 0,
      shape: const RoundedRectangleBorder(
        side: BorderSide(color: Colors.black),
        borderRadius: BorderRadius.all(
          Radius.circular(10),
        ),
      ),
      child: Text(
        label,
        style: const TextStyle(
          fontWeight: FontWeight.w600,
          fontSize: 18,
        ),
      ),
    );
  }
}
