import 'package:flutter/material.dart';

class CustomField extends StatelessWidget {
  final String hintText;
  final IconData icon;
  final bool obScure;
  final TextInputType keyboardType;
  final TextEditingController controller;
  final IconData? suffixIcon;
  final VoidCallback? suffixIconOnTap;
  final Color? filledColor;
  final Color iconColor;

  const CustomField(
      {super.key,
      required this.hintText,
      required this.icon,
      this.obScure = false,
      this.keyboardType = TextInputType.text,
      required this.controller,
      required this.suffixIcon,
      required this.suffixIconOnTap,
      required this.filledColor,
      this.iconColor = Colors.green});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: TextField(
        controller: controller,
        obscureText: obScure,
        keyboardType: keyboardType,
        decoration: InputDecoration(
            prefixIconColor: iconColor,
            suffix: GestureDetector(
                onTap: suffixIconOnTap, child: Icon(suffixIcon)),
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: const BorderSide(color: Colors.green, width: 2)),
            filled: true,
            fillColor: filledColor,
            prefixIcon: Icon(icon),
            hintText: hintText,
            border:
                OutlineInputBorder(borderRadius: BorderRadius.circular(12))),
      ),
    );
  }
}
