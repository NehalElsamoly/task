import 'package:flutter/material.dart';
import 'package:task/config/responsive/responsive_extensions.dart';


import '../../config/resources/app_colors.dart';
import '../../config/resources/app_text_style.dart';
import 'custom_inkwell.dart';

class TextButtonWidget extends StatelessWidget {
  final Color textColor;
  final String text;
  final FontWeight weight;
  final double fontSize;
  final Function() onPressed;
  final bool withDecoration;


  const TextButtonWidget({
    super.key,
    this.textColor = AppColors.primaryBlue,
    required this.text,
    required this.onPressed,
    this.weight = FontWeight.w700,
    this.withDecoration = false,
    this.fontSize = 12,
  });

  @override
  Widget build(BuildContext context) {
    return CustomInkWell(
      onTap: onPressed,
      child: Text(
        text,
        style: const AppTextStyle().bodyLarge16.copyWith(
              color: textColor,
              fontWeight: weight,
              fontSize: fontSize.responsiveFontSize,
          decorationColor: AppColors.primaryBlue,

          decoration:withDecoration? TextDecoration.underline:TextDecoration.none,
            ),
      ),
    );
  }
}
