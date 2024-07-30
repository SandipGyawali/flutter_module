import 'package:flutter/material.dart';
import 'package:hugeicons/hugeicons.dart';

class InputField extends StatelessWidget {
  final String label;
  final bool obscure;
  final String hintText;
  final TextEditingController controller;
  final HugeIcon? suffixIcon;
  final onInputSubmit;

  @override
  const InputField({
    super.key,
    required this.label,
    required this.obscure,
    required this.hintText,
    required this.controller,
    this.suffixIcon,
    this.onInputSubmit,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          label,
          style: const TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.w400,
            color: Colors.black87,
          ),
        ),
        const SizedBox(height: 5),
        TextField(
          onSubmitted: (value) {
            onInputSubmit();
          },
          textInputAction: TextInputAction.search,
          textAlign: TextAlign.start,
          textAlignVertical: TextAlignVertical.center,
          controller: controller,
          obscureText: obscure,
          decoration: InputDecoration(
            hintText: hintText,
            hintStyle: TextStyle(
              color: Colors.grey.shade400,
            ),
            contentPadding: const EdgeInsets.symmetric(
              vertical: 0,
              horizontal: 10,
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: Colors.grey.shade400,
              ),
              borderRadius: BorderRadius.circular(10),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: Colors.grey.shade600,
                width: 2,
              ),
              borderRadius: BorderRadius.circular(10),
            ),
            border: OutlineInputBorder(
              borderSide: BorderSide(
                color: Colors.grey.shade400,
              ),
              borderRadius: BorderRadius.circular(10),
            ),
          ),
        )
      ],
    );
  }
}
