import 'dart:math';
import 'package:flutter/material.dart';



abstract class ResponsiveManager {

  static const double _designWidth = 400.0;
  static const double _designHeight = 850.0;
  static late double screenWidth ;
  static late double screenHeight ;
  static late bool isPortrait ;

  static void init(BuildContext context) {
    screenWidth = MediaQuery.of(context).size.width;
    screenHeight = MediaQuery.of(context).size.height;
    isPortrait = MediaQuery.of(context).orientation == Orientation.portrait;
  }
// in landscape or portrait and if tablet or phone for font
  static double getFontSize(double size) {

    final isTablet = screenWidth >= 600;

    double scaleFactor = _designWidth;
    if (isTablet) {
      if(isPortrait){
        scaleFactor = _designWidth * 1.5;
      }else{
        scaleFactor = _designWidth * 2.5;
      } // Adjust scale factor for tablets
    } else if (!isPortrait) {
      scaleFactor = _designHeight;
    }
    return size * (screenWidth / scaleFactor);
  }

  static double getHorizontalSize( double width) {
    return width * (screenWidth / _designWidth);
  }
//correct virtical size
//   static double getCorrectVerticalSize(BuildContext context, double height) {
//     double statusBar = MediaQuery.of(context).padding.top;
//     double bottomBar = MediaQuery.of(context).padding.bottom;
//     double usableHeight = screenHeight - statusBar - bottomBar;
//     return height * (usableHeight / _designHeight);
//   }
//   static double getCorrectVerticalSize(
//       BuildContext context,
//       double height,
// ) {
//     double screenHeight = MediaQuery.of(context).size.height;
//
//     double myTopPadding= AppConstants.appPaddingR24;
//     double myBottomPadding= AppConstants.appPaddingR20;
//     double usableHeight = screenHeight - statusBar - bottomBar - myTopPadding - myBottomPadding;
//     return height * (usableHeight / _designHeight);
//   }
//
  static double getVerticalSize( double height) {
    return height * (screenHeight / _designHeight);
  }

  static double getVerticalSizeRatio(double px) {
    return isPortrait ? px : px * 2;
  }

  static double getSize(double size) {
    if(isPortrait){
      return size * (screenWidth / _designWidth);
    }else{
      return (size * (screenWidth / _designWidth))*.5;
    }
  }

  static double calculateSize(double width, double height) {
    final num widthSquared = pow(getHorizontalSize(width), 2);
    final num heightSquared = pow(getVerticalSize(height), 2);
    final double size = sqrt(widthSquared + heightSquared);
    return size;
  }

  // static double calculateRadius(double width, double height) {
  //   double radius = sqrt(pow(getVerticalSize(width) / 2, 2) + pow(getHorizontalSize(height) / 2, 2));
  //   return radius;
  // }

  static EdgeInsets getResponsivePaddingOnly( {double left=0,double top=0,double right=0, double bottom=0}) {
    if (isPortrait) {
      return EdgeInsets.only(
        left: left  * (screenWidth / _designWidth),
        top: top  * (screenHeight / _designHeight),
        right: right  * (screenWidth / _designWidth),
        bottom: bottom  * (screenHeight / _designHeight),
      );}else{
      return EdgeInsets.only(
        left: left  * (screenWidth / _designWidth) *.5,
        top: top  * (screenHeight / _designHeight)*.5,
        right: right  * (screenWidth / _designWidth)*.5,
        bottom: bottom  * (screenHeight / _designHeight)*.5,
      );
    }
  }

  static EdgeInsets getResponsivePaddingSymmetric( {double horizontal = 0, double vertical = 0}) {
    if (isPortrait) {
      return EdgeInsets.symmetric(
        horizontal: horizontal * (screenWidth / _designWidth),
        vertical: vertical * (screenHeight / _designHeight),
      );}
    else{
      return EdgeInsets.symmetric(
        horizontal: horizontal * (screenWidth / _designWidth)*.5,
        vertical: vertical * (screenHeight / _designHeight)*.5,
      );
    }
  }
}