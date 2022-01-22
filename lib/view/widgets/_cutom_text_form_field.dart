import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  final String _errorMessage = "It can't be empty";
  const CustomTextFormField({
    Key? key,
    required this.controller,
    this.labelText,
    this.obscureText,
    this.icon,
    this.notRequeired,
  }) : super(key: key);
  final TextEditingController controller;
  final String? labelText;
  final bool? obscureText;
  final IconData? icon;
  final bool? notRequeired;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: obscureText ?? false,
      controller: controller,
      validator: (notRequeired == true)
          ? null
          : (value) {
              if (value != null && value.isEmpty) {
                return _errorMessage;
              } else {
                return null;
              }
            },
      decoration: InputDecoration(
        icon: icon != null ? Icon(icon) : null,
        label: labelText != null ? Text(labelText!) : null,
        border: const OutlineInputBorder(),
      ),
    );
  }
}
