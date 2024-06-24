// ignore_for_file: sort_child_properties_last, prefer_const_constructors

import 'package:chatapplication/core/theme/extra_colors.dart';
import 'package:chatapplication/core/values/app_dimens.dart';
import 'package:flutter/material.dart';


class CustomButton extends StatelessWidget {
  final String? buttonLevel;
  final Color?  color;
  final Color? textColor;
  final VoidCallback?  onPressed;
  final double? borderRadius;
  final Widget? btnwidget;
  final FocusNode? focusNode;
  final Function(bool)? onFocusChange;
  const CustomButton({
    super.key,  this.buttonLevel, this.btnwidget, this.color, this.onPressed,this.textColor, this.borderRadius, this.focusNode,this.onFocusChange,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: AppDimens.appButtonHeight,
      width: MediaQuery.of(context).size.width,
      child: ElevatedButton(
        focusNode: focusNode,
        onFocusChange: onFocusChange,
        child: btnwidget ?? Text(buttonLevel!,
          textAlign: TextAlign.center,
          style: textColor != null ? TextStyle(color: ExtraColors.grayColors,fontSize: 14,fontWeight: FontWeight.bold)
          : TextStyle(color: ExtraColors.whiteColors,fontSize: 14,fontWeight: FontWeight.bold),
        ),
        
        onPressed: onPressed,
          style: ElevatedButton.styleFrom(
            backgroundColor: color,
            textStyle: TextStyle(
            fontSize: AppDimens.buttonTitlefontSize,
            fontWeight: FontWeight.bold,
            ),
            shape: RoundedRectangleBorder(
              borderRadius:  BorderRadius.circular(borderRadius ?? 8)
            ),
          ),
        ),
    );
  }
}