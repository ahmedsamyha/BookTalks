// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:mytask/utility/constants/colors.dart';

class DefaultTextFormField extends StatelessWidget {
  DefaultTextFormField({
    super.key,
    this.hintText,
    this.prefixIcon,
    this.keyboardType,
    this.controller,
    this.onFieldSubmitted,
    this.onTap,
    this.suffixIcon,
    this.validator,
    this.onChanged,
    this.obscureText,
    this.color
  });
  final String? hintText;
  final IconData? prefixIcon;
  IconData? suffixIcon;
  void Function()? onTap;
  void Function(String)? onFieldSubmitted;
  TextEditingController? controller;
  final TextInputType? keyboardType;
  String? Function(String?)? validator;
  void Function(String)? onChanged;
  bool? obscureText;
  Color? color;
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 30),
      padding: const EdgeInsets.only(left: 30, right: 30, top: 5, bottom: 5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(29),
        color: color ?? AppColors.kLightColor,
      ),
      child: TextFormField(
        validator: validator,
        onTap: onTap,
        onFieldSubmitted: onFieldSubmitted,
        controller: controller,
        keyboardType: keyboardType,
        obscureText: obscureText!,
        onChanged: onChanged,
        decoration: InputDecoration(
            hintStyle: const TextStyle(
                fontSize: 14,
                color: Colors.black38,
                fontWeight: FontWeight.w500),
            contentPadding: const EdgeInsets.only(top: 12),
            errorMaxLines: 3,
            prefixIconColor: Colors.grey,
            suffixIconColor: Colors.grey,
            hintText: hintText,
            prefixIcon: Icon(
              prefixIcon,
              color: AppColors.kPrimaryColor,
            ),
            suffixIcon: Icon(
              suffixIcon,
              color: AppColors.kPrimaryColor,
            ),
            border: InputBorder.none),
      ),
    );
  }
}
