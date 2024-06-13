import 'package:flutter/material.dart';

class ListTileSaftty extends StatelessWidget {
  Icon leading;
  String title;
  VoidCallback? onTap;

  //var onTop;
  ListTileSaftty({
    required this.leading,
    required this.title,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: leading,
      title: Text(title),
      trailing: const Icon(
        Icons.arrow_forward_ios,
        size: 16,
        color: Colors.black,
      ),
      onTap: onTap,
    );
  }
}
