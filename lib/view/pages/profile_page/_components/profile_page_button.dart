import 'package:flutter/material.dart';

class ProfilePageButton {
  static Widget iconButton(
      {required String text,
      required IconData icon,
      required VoidCallback onPressed,
      Color? iconColor}) {
    return OutlinedButton(
      style: OutlinedButton.styleFrom(primary: Colors.blueGrey),
      onPressed: () => onPressed(),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Icon(icon, color: iconColor),
              const VerticalDivider(),
              Text(
                text,
              ),
            ],
          ),
          const Icon(
            Icons.arrow_forward_ios_rounded,
            color: Colors.blueGrey,
          )
        ],
      ),
    );
  }
}
