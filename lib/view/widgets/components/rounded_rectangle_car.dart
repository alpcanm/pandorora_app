import 'package:flutter/material.dart';

class RoundedRectangleCardIcon extends StatelessWidget {
  const RoundedRectangleCardIcon({
    Key? key,
    required this.onPressed,
    required this.iconData,
    this.color,
  }) : super(key: key);
  final VoidCallback onPressed;
  final IconData iconData;
  final Color? color;
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 1,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
      child: IconButton(
        onPressed: () => onPressed(),
        icon: Icon(
          iconData,
          color: color ?? Theme.of(context).primaryColor,
        ),
        iconSize: 25,
        splashRadius: 25,
      ),
    );
  }
}
