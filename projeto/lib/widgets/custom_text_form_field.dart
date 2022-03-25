import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomTextFormField extends StatelessWidget {
  final bool isEnabled;
  final int maxLength;
  final String labelText;
  final String helperText;
  final bool obscureText;
  final String? Function(String?) validator;
  final TextEditingController controller;
  final Widget suffixIcon;
  final TextInputType keyboardType;
  final TextInputAction textInputAction;
  final Color colorLabelText;
  final Color colorFocusedBorder;
  final Color colorErrorBorder;

  const CustomTextFormField({
    Key? key,
    required this.isEnabled,
    required this.maxLength,
    required this.labelText,
    required this.helperText,
    required this.obscureText,
    required this.validator,
    required this.controller,
    required this.suffixIcon,
    required this.keyboardType,
    required this.textInputAction,
    required this.colorLabelText,
    required this.colorFocusedBorder,
    required this.colorErrorBorder,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      enabled: isEnabled,
      maxLength: maxLength,
      obscureText: obscureText,
      controller: controller,
      keyboardType: keyboardType,
      textInputAction: textInputAction,
      validator: validator,
      decoration: InputDecoration(
        suffixIcon: suffixIcon,
        helperText: helperText,
        helperStyle: TextStyle(color: colorLabelText),
        labelText: labelText,
        labelStyle: TextStyle(color: colorLabelText),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(
              16.0,
            ),
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(
              16.0,
            ),
          ),
          borderSide: BorderSide(color: colorFocusedBorder),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(
              16.0,
            ),
          ),
          borderSide: BorderSide(color: colorErrorBorder),
        ),
      ),
    );
  }
}
