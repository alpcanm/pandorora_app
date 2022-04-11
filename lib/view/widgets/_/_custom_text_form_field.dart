import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  final String _errorMessage = "It can't be empty";
  const CustomTextFormField({
    Key? key,
    required this.controller,
    this.labelText,
    this.obscureText,
    this.icon,
    this.onChanged,
    this.customValidator,
    this.maxLengt,
    this.readOnly,
    this.style,
  }) : super(key: key);
  final TextEditingController controller;
  final String? labelText;
  final bool? obscureText;
  final IconData? icon;
  final Function(String? value)? onChanged;
  final String? Function(String? value)? customValidator;
  final int? maxLengt;
  final bool? readOnly;
  final TextStyle? style;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      readOnly: readOnly ?? false,
      maxLength: maxLengt,
      style: style,
      onChanged: onChanged,
      obscureText: obscureText ?? false,
      controller: controller,
      validator: (customValidator != null)
          ? customValidator
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
        border: const UnderlineInputBorder(borderSide: BorderSide.none),
        focusedBorder: UnderlineInputBorder(
            borderSide:
                readOnly == true ? BorderSide.none : const BorderSide(),),
      ),
    );
  }
}
