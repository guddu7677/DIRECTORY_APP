import 'package:directoryapp/core/constants/constant_colors.dart';
import 'package:directoryapp/core/constants/constant_fonts.dart';
import 'package:flutter/material.dart';

class UniversalTextField extends StatelessWidget {
  final String hintText;
  final String? labelText;
  final Color? bgColor;
  final Color? borderColor;
  final double borderRadius;
  final double borderWidth;
  final TextEditingController? controller;
  final Widget? suffixIcon;
    final Widget? prefixIcon;

  final int? MaxLines;

  const UniversalTextField({
    super.key,
    required this.hintText,
     this.labelText,
    this.bgColor,
    this.borderColor,
    this.borderRadius = 16,
    this.borderWidth = 1,
    this.controller,
    this.suffixIcon,
    this.prefixIcon,
    this.MaxLines,
  });

  OutlineInputBorder _buildBorder(Color color) {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(borderRadius),
      borderSide: BorderSide(color: color, width: borderWidth),
    );
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      maxLines: MaxLines,
      controller: controller,
      decoration: InputDecoration(prefixIcon: prefixIcon,
        filled: true,
        fillColor: bgColor ?? Colors.white,
        suffixIcon: suffixIcon,
        labelText: labelText,
        labelStyle: AppTextStyle.semiBold14black,
        hintText: hintText,
        hintStyle: TextStyle(
          color: Color(0xFF808080),
          fontFamily: AppFonts.sourceSans,
          fontSize: 16,
        ),
        enabledBorder: _buildBorder(borderColor ?? AppColors.borderColor),
        focusedBorder: _buildBorder(borderColor ?? AppColors.PrimaryColor),
        errorBorder: _buildBorder(AppColors.borderColor),
        focusedErrorBorder: _buildBorder(AppColors.borderColor),
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 12,
          vertical: 14,
        ),
      ),
    );
  }
}
