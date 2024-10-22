import 'package:flutter/material.dart';

class ButtonWidget extends StatelessWidget {
  final double height;
  final double width;
  final String title;
  final Color? bgColor;
  final VoidCallback onPressed;

  const ButtonWidget({
    super.key,
    this.bgColor,
    this.height = 12,
    this.width = 12,
    required this.title,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        // Add connection functionality here
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: Color.fromARGB(255, 4, 241, 154), // Background color of button set to black
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
      ),
      child: Text(
        title,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 14,
        ),
      ),
    );
  }
}
