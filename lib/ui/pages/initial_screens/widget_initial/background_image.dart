import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BackgroundImage extends StatelessWidget {

  final String url;

  const BackgroundImage({Key? key, required this.url, }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    Size size = MediaQuery.of(context).size;

    return Container(
      height: size.height* 0.5,
      width: size.width * 0.5,
      child: Image.asset(url),
    );
  }
}
