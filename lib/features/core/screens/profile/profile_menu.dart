import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/ui.dart';

class ProfileMenuWidget extends StatelessWidget {
  const ProfileMenuWidget({
    super.key,
    required this.title,
    required this.icon,
    required this.onPress,
    this.endIcon = true,
    this.textColor,
  });

  final String title;
  final IconData icon;
  final VoidCallback onPress;
  final bool endIcon;
  final Color? textColor;

  @override
  Widget build(BuildContext context) {

    return ListTile(
      onTap: onPress,
      leading: Container(
        width: 30,
        height: 30,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(100),
          color: const Color.fromARGB(255, 107, 145, 71).withOpacity(0.5),
        ),
        child: Icon(icon, color: Color.fromARGB(255, 255, 255, 255)),
      ),
      title: BoxText.body(title),
      trailing: endIcon? Container(
          width: 30,
          height: 30,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(100),
            color: const Color.fromARGB(255, 107, 145, 71).withOpacity(0.3),
          ),
          child: const Icon(CupertinoIcons.right_chevron, size: 18.0, color: Colors.grey)) : null,
    );
  }
}