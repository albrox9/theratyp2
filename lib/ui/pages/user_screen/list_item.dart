import 'package:flutter/material.dart';

//Formato de los list del menu de usuario.
class ListItem extends StatelessWidget {
  final String text;
  final IconData icon;
  final Function() onTap;

  const ListItem(
      {Key? key, required this.text, required this.icon, required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(icon),
      title: Text(text),
      onTap: onTap,
    );
  }
}
