import 'package:flutter/material.dart';

class CustomTextTileWidget extends StatelessWidget {
  final String title;
  final IconData icon;
  final VoidCallback onTap;
  const CustomTextTileWidget({super.key, required this.title, required this.icon, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onTap,
      splashColor: Colors.transparent,
      title: Text(
        title,
        style: const TextStyle(fontSize: 24),
      ),
      leading: Icon(
        icon,
        size: 35,
        color: Colors.black,
      ),
    );
  }
}
