import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ButtonGoogle extends StatelessWidget {
  final Function() onTap;
  final String name;

  const ButtonGoogle({
    super.key,
    required this.onTap,
    required this.name,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(color: Colors.green.shade300),
          borderRadius: BorderRadius.circular(8.0),
        ),
        padding: const EdgeInsets.all(10),
        margin: const EdgeInsets.symmetric(horizontal: 50, vertical: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            SizedBox(
              height: 30,
              child: Image.asset(
                'assets/images/google.jpg',
              ),
            ),
            Text(
              name,
              style: const TextStyle(
                color: Colors.black,
                fontSize: 18.0,
              ),
            )
          ],
        ),
      ),
    );
  }
}
