import 'package:flutter/material.dart';

class ProfilePageButton {
  Widget iconButton(
      {required String text,
      required IconData icon,
      required VoidCallback onPressed}) {
    return TextButton(
      onPressed: () => onPressed(),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Icon(icon),
              const VerticalDivider(),
              Text(
                text,
              ),
            ],
          ),
          const Icon(Icons.arrow_forward_ios_rounded)
        ],
      ),
    );
  }
}
