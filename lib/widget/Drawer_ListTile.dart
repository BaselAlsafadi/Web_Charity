// ignore_for_file: file_names
import 'package:flutter/material.dart';

class DrawerListTile extends StatelessWidget {
  const DrawerListTile({
    Key? key,
    required this.title,
    required this.image,
    required this.press,
  }) : super(key: key);

  final String title, image;
  final VoidCallback press;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      hoverColor: Colors.white,
      onTap: press,
      horizontalTitleGap: 0.0,
      leading: Image.asset(
        image,
        height: 20.0,
      ),
      title: Text(
        title,
        style: const TextStyle(color: Colors.white54),
      ),
    );
  }
}
