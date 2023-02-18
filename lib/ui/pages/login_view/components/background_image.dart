import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BackgroundImage extends StatelessWidget {
  const BackgroundImage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    Size size = MediaQuery.of(context).size;

    return Container(
      height: size.height* 0.5,
      child: Image.asset('assets/images/login.png'),
    );
  }
}
