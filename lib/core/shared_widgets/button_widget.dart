
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:task/config/resources/app_animations.dart';
import 'package:task/config/responsive/responsive_extensions.dart';

import '../../config/resources/app_colors.dart';
import '../../config/resources/app_constants.dart';
import '../../config/resources/app_text_style.dart';
import '../../config/resources/app_values.dart';

class DefaultButtonWidget extends StatelessWidget {
  final Color buttonColor;
  final Color labelColor;
  final bool isExpanded;
  final String label;
  final Function() onPressed;
  final double width;
  final double height;
  final double frontIconWidth;
  final double frontIconHeight;
  final double borderSize;
  final Color borderColor;
  final double textVerticalPadding;
  final double textHorizontalPadding;
  final double textFontSize;
  final TextStyle? textStyle;
  final double elevation;
  final String? icon;
  final String? frontIcon;

  const DefaultButtonWidget({
    super.key,
    this.buttonColor = AppColors.primaryBlue,
    this.labelColor = AppColors.white,
    this.isExpanded = false,
    required this.label,
    required this.onPressed,
    this.width = AppConstants.buttonWidth,
    this.height = AppConstants.buttonHeight,
    this.frontIconWidth = AppSize.s20,
    this.frontIconHeight = AppSize.s20,
    this.borderSize = AppConstants.appBorderRadiusR40,
    this.borderColor = AppColors.primaryBlue,
    this.textVerticalPadding = AppPadding.p10,
    this.textFontSize = AppFontSize.sp16,
    this.textHorizontalPadding = AppPadding.p16,
    this.textStyle,
    this.elevation = AppConstants.appElevationR8,
    this.icon,
    this.frontIcon
  });

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onPressed,
      color: buttonColor,
      textColor: labelColor,
      elevation: elevation,
      minWidth: isExpanded ? double.infinity : width.responsiveWidth,
      height: height.responsiveHeight,
      padding: EdgeInsetsDirectional.symmetric(
        vertical: textVerticalPadding.responsiveSize,
        horizontal: textHorizontalPadding.responsiveSize,
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(borderSize.responsiveSize),
        side: BorderSide(
          color: borderColor,
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          if(frontIcon != null)...[
            SvgPicture.asset(frontIcon!, height: frontIconHeight.responsiveHeight, width: frontIconWidth.responsiveWidth),
            AppSize.s10.sizedBoxWidth,
          ],
          Text(
            label,
            textAlign: TextAlign.center,
            maxLines: 1,
            style: textStyle ??
                const AppTextStyle().titleMedium20.copyWith(
                  color: labelColor,
                  fontSize: textFontSize.responsiveFontSize,
                ),
          ),
          if(icon != null)...[
          AppSize.s40.sizedBoxWidth,
          SvgPicture.asset(icon!)]
        ],
      ),
    ).animateShimmer();
  }
}


