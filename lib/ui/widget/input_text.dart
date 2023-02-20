import 'package:flutter/material.dart';

class InputText extends StatelessWidget {
  final controller;
  final String shintText; //help text
  final bool bObscureText;//to hind text like a password.
  final IconData icon;

  const InputText({
    super.key,
    required this.controller,
    required this.shintText,
    required this.bObscureText,
    required this.icon,
  });


  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 30.0, vertical: 5),
      child: TextFormField(
        cursorColor: Colors.black.withOpacity(.5),
        controller: controller,
        obscureText: bObscureText,
        decoration: InputDecoration(
          contentPadding: EdgeInsets.symmetric(vertical: 10),
          prefixIcon: Icon(icon, color: Colors.green.withOpacity(0.3),),
          enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.white),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.grey.shade400),
          ),
          fillColor: Colors.grey.shade200,
          filled: true,
          hintText: shintText,
          hintStyle: const TextStyle(color: Colors.black26),
        ),
      ),
    );
  }
}
