import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Button extends StatelessWidget {

  final Function() onTap;

  const Button({super.key, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(10),
        margin: const EdgeInsets.symmetric(horizontal: 50, vertical: 10),
        decoration: BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: const Center(
          child: Text(
            "Sign In",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
