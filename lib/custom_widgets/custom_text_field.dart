import 'package:flutter/material.dart';
import 'package:tam_tam_app/constants/app_color.dart';
import 'package:tam_tam_app/constants/app_style.dart';

class CustomTextFormField extends StatelessWidget {
  final String? label;
  final String? hint;
  final TextEditingController? controller;
  final bool obscureText;
  final TextInputType keyboardType;
  final String? Function(String?)? validator;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final void Function()? onSuffixIconTap;

  const CustomTextFormField({
    super.key,
    this.label,
    this.controller,
    this.hint,
    this.obscureText = false,
    this.keyboardType = TextInputType.text,
    this.validator,
    this.prefixIcon,
    this.suffixIcon,
    this.onSuffixIconTap,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      obscureText: obscureText,
      keyboardType: keyboardType,
      validator: validator,
      decoration: InputDecoration(
        fillColor: Color(0xFFF1F1F1),
        filled: true,
        labelText: label,
        labelStyle: AppStyles.textStyle14.copyWith(color: AppColors.greyColor),
        hintText: hint,

        hintStyle: TextStyle(fontSize: 12),
        prefixIcon: prefixIcon,

        suffixIcon: suffixIcon != null
            ? GestureDetector(onTap: onSuffixIconTap, child: suffixIcon)
            : null,
        border: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.circular(15),
        ),
      ),
    );
  }
}
