import 'package:flutter/material.dart';
import 'package:task/core/utils/exports.dart';

import '../../config/resources/app_colors.dart';
import '../../config/resources/app_shadow.dart';

class CustomContainerWithShadow extends StatelessWidget {
  const CustomContainerWithShadow({
    super.key,
    required this.child,
    this.height,
    this.reduis,
    this.width,
    this.borderColor,
    this.isShadow = true,  this.color,this.border
  });

  final Widget child;
  final Color? color;
  final Color? borderColor;
  final double? height;
  final double? width;
  final double? reduis;
  final bool isShadow;
  final bool ?border;


  @override
  Widget build(BuildContext context) {
    return Container(
      height: height??75.responsiveHeight,
      width: width,
      decoration: BoxDecoration(
        color:color?? AppColors.containerColor,
        border: border==true?Border.all(color: borderColor??Colors.grey.shade300):null,
        borderRadius:BorderRadius.circular( reduis??20),
        boxShadow: isShadow
            ? [
     AppShadow.containerBoxShadow()

        ]                                                                
            : [], // No shadow when isShadow is false
      ),
      child: child,
    );
  }
}