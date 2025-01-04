import 'package:flutter/material.dart';

class OtherButton extends StatelessWidget {
  final String text;
  final IconData icon;
  final Color iconColor;
  final VoidCallback onPressed;

  const OtherButton({
    super.key,
    required this.text,
    required this.icon,
    required this.iconColor,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: SizedBox(
        height: height * 0.08,
        width: width * 1,
        child: ElevatedButton.icon(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.white,
            minimumSize: const Size(double.infinity, 50),
            shape: RoundedRectangleBorder(
              side: BorderSide(color: Colors.grey.shade600, width: 0.5),
              borderRadius: BorderRadius.circular(30),
            ),
          ),
          icon: Icon(
            icon,
            color: iconColor,
            size: 30,
          ),
          label: Text(
            text,
            style: const TextStyle(fontSize: 18, color: Colors.black),
          ),
          onPressed: onPressed,
        ),
      ),
    );
  }
}
