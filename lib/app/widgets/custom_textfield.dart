
// ignore_for_file: use_super_parameters, prefer_const_constructors

import 'package:chatapplication/core/theme/extra_colors.dart';
import 'package:chatapplication/core/values/app_dimens.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomTextField extends StatelessWidget {
  final String? level;
  final TextInputType? keyboardType;
  final bool obscureText;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final AutovalidateMode? autovalidateMode;
  final List<TextInputFormatter>? inputFormatters;
  final Key? fromkey;
  final String? hintText;
  final VoidCallback? onTap;
  final Function(dynamic)? onChanged;
  final FocusNode? focusNode;
  final bool readOnly;
  final EdgeInsetsGeometry? contentPadding;
  final bool? autofocus;
  final Iterable<String>? autofillHints;
  final Function(String)? onFieldSubmitted;
  final int? minLines;
  final int? maxLines;
  const CustomTextField({
    Key? key, this.keyboardType,
    this.level, 
    this.obscureText =  false, 
    this.suffixIcon, 
    this.controller,
    this.prefixIcon,
    this.fromkey,
    this.validator,
    this.autovalidateMode,
    this.inputFormatters,
    this.hintText,
    this.onTap,
    this.focusNode,
    this.readOnly = false,
    this.contentPadding,
    this.onChanged,
    this.autofocus,
    this.autofillHints,
    this.onFieldSubmitted,
    this.minLines,
    this.maxLines,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
       style: TextStyle(
         color: Colors.black,
         fontSize: AppDimens.textfieldFontSize,
         fontWeight: FontWeight.normal,
       ),
      autofocus: autofocus ?? false,
      key: fromkey,
      minLines: minLines ?? 1,
      maxLines: maxLines ?? 1,
      validator: validator,
      readOnly: readOnly,
      onChanged: onChanged,
      // textInputAction: TextInputAction.next,
      autovalidateMode: autovalidateMode,
      controller: controller,
      keyboardType: keyboardType,
      obscureText: obscureText,
      inputFormatters: inputFormatters,
      onTap: onTap,
      focusNode: focusNode,
      autofillHints:autofillHints,
      onFieldSubmitted:onFieldSubmitted,
      decoration: InputDecoration(
        // ignore: prefer_if_null_operators
        contentPadding: contentPadding == null ?  EdgeInsets.all(15) : contentPadding,
        hintText: hintText,
        isDense: true,
        filled: true,
        suffixIcon: suffixIcon,
        prefixIcon:prefixIcon,
        fillColor: ExtraColors.whiteColors,
        errorStyle: TextStyle(
          color:ExtraColors.redColors,
          fontSize: AppDimens.errorfontSize,
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: ExtraColors.balckcolor),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: ExtraColors.balckcolor),
        ),
        errorBorder: OutlineInputBorder(
          borderSide: BorderSide(color: ExtraColors.redColors),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderSide: BorderSide(color:ExtraColors.balckcolor),
        ),
      ),
    );
  }
}