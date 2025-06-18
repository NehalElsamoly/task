import 'package:flutter/material.dart';
import 'package:task/config/responsive/responsive_extensions.dart';


import '../../my_app/app_reference.dart';
import 'app_colors.dart';

class AppTextStyle {
  final Color? color;
  final String? fontFamily;
  final FontWeight? fontWeight;
  final double? fontSize;

  const AppTextStyle({
    this.color,
    this.fontFamily,
    this.fontWeight,
    this.fontSize,
  });

  //ToDo: Coloooooooooooooooooooooors????????????????????????
  static const String roboto = 'Roboto';



  static TextStyle cacheDisplayLarge32(double fontSize) => TextStyle(
        color: AppColors.primaryDarkFont,
      fontFamily: roboto,
      fontWeight: FontWeight.w700,
      fontSize: fontSize
  );  static TextStyle cacheDisplayLarge14(double fontSize) => TextStyle(
        color: AppColors.primaryDarkFont,
      fontFamily: roboto,
      fontWeight: FontWeight.w400,
      fontSize: fontSize
  );

  static get displayLarge32 => cacheDisplayLarge32(32.responsiveFontSize);
  static get displayLarge14 => cacheDisplayLarge14(14.responsiveFontSize);

  static TextStyle cacheDisplayMedium30(double fontSize) => TextStyle(
    color: AppColors.primaryDarkFont,
    fontFamily: roboto,
    fontWeight: FontWeight.w700,
    fontSize: fontSize,
  );

  static get displayMedium30 => cacheDisplayMedium30(30.responsiveFontSize);
  static get displayMedium21 => cacheDisplaySmall21(21.responsiveFontSize);

  static TextStyle cacheDisplaySmall28(double fontSize) => TextStyle(
    color: AppColors.primaryDarkFont,
    fontFamily: roboto,
    fontWeight: FontWeight.w700,
    fontSize: fontSize,
  );
 static TextStyle cacheDisplaySmall21(double fontSize) => TextStyle(
    color: AppColors.primaryDarkFont,
    fontFamily: roboto,
    fontWeight: FontWeight.w700,
    fontSize: fontSize,
  );

  static get displaySmall28 => cacheDisplaySmall28(28.responsiveFontSize);

  static TextStyle cacheTitleLarge22(double fontSize) => TextStyle(
    color: AppColors.primaryDarkFont,
    fontFamily: roboto,
    fontWeight: FontWeight.w600,
    fontSize: fontSize,
  );

  static get titleLarge22 => cacheTitleLarge22(22.responsiveFontSize);

  static TextStyle cacheTitleMedium20(double fontSize) => TextStyle(
    color: AppColors.primaryDarkFont,
    fontFamily: roboto,
    fontWeight: FontWeight.w600,
    fontSize: fontSize,
  );

  static get titleMedium20 => cacheTitleMedium20(20.responsiveFontSize);

  static TextStyle cacheTitleSmall18(double fontSize) => TextStyle(
    color: AppColors.primaryDarkFont,
    fontFamily: roboto,
    fontWeight: FontWeight.w600,
    fontSize: fontSize,
  );

  static get titleSmall18 => cacheTitleSmall18(18.responsiveFontSize);

  static TextStyle cacheBodyLarge16(double fontSize) => TextStyle(
    color: AppColors.primaryDarkFont,
    fontFamily: roboto,
    fontWeight: FontWeight.w400,
    fontSize: fontSize,
  );

  static get bodyLarge16 => cacheBodyLarge16(16.responsiveFontSize);

  static TextStyle cacheBodyMedium14(double fontSize) => TextStyle(
    color: AppColors.primaryDarkFont,    fontFamily: roboto,
    fontWeight: FontWeight.w400,
    fontSize: fontSize,
  );

  static get bodyMedium14 => cacheBodyMedium14(14.responsiveFontSize);

  static TextStyle cacheBodySmall12(double fontSize) => TextStyle(
    color: AppColors.primaryDarkFont,
    fontFamily: roboto,
    fontWeight: FontWeight.w400,
    fontSize: fontSize,
  );  static TextStyle cacheBodyMeduim21(double fontSize) => TextStyle(
    color: AppColors.primaryDarkFont,
    fontFamily: roboto,
    fontWeight: FontWeight.w700,
    fontSize: fontSize,
  );

  static get bodySmall12 => cacheBodySmall12(12.responsiveFontSize);
  static get bodyMeduim21 => cacheBodyMeduim21(21.responsiveFontSize);

  static TextStyle cacheErrorTextStyle12(double fontSize) => TextStyle(
    color: AppColors.primaryDarkFont,
    fontFamily: roboto,
    fontWeight: FontWeight.w400,
    fontSize: fontSize,
  );

  static get errorTextStyle12 => cacheErrorTextStyle12(12.responsiveFontSize);

  static TextStyle cacheHintTextStyle14(double fontSize) => TextStyle(
    color: AppColors.primaryDarkFont,
    fontFamily: roboto,
    fontWeight: FontWeight.w400,
    fontSize: fontSize,
  );

  static get hintTextStyle14 => cacheHintTextStyle14(14.responsiveFontSize);

  AppTextStyle copyWith({
    Color? color,
    String? fontFamily,
    FontWeight? fontWeight,
    double? fontSize,
  }) {
    return AppTextStyle(
      color: color ?? this.color,
      fontFamily: fontFamily ?? this.fontFamily,
      fontWeight: fontWeight ?? this.fontWeight,
      fontSize: fontSize ?? this.fontSize,
    );
  }
}

extension AppStyleFontFamily on AppTextStyle {
  // AppTextStyle get quranFont => copyWith(fontFamily: AppTextStyle.quranFont);

  AppTextStyle get roboto =>
      copyWith(fontFamily: AppTextStyle.roboto);
}

extension AppStyleColor on AppTextStyle {
   AppTextStyle get red => copyWith(color: AppColors.red);

   AppTextStyle get black => copyWith(color: AppColors.black);

   AppTextStyle get white => copyWith(color: AppColors.white);
   AppTextStyle get darkFont02 => copyWith(color: AppColors.darkFont02);
   AppTextStyle get orange => copyWith(color: AppColors.orange);

   AppTextStyle get blue => copyWith(color: AppColors.primaryBlue);


   AppTextStyle get gray => copyWith(color: AppColors.gray300);
   AppTextStyle get grayText => copyWith(color: AppColors.grayText);
   AppTextStyle get gray500 => copyWith(color: AppColors.gray500);


   AppTextStyle get green => copyWith(color: AppColors.green);
}

extension AppStyleFontWeight on AppTextStyle {
  AppTextStyle get w100 => copyWith(fontWeight: AppFontWeight.extraLightW100);

  AppTextStyle get w200 => copyWith(fontWeight: AppFontWeight.mediumLightW200);

  AppTextStyle get w300 => copyWith(fontWeight: AppFontWeight.lightW300);

  AppTextStyle get w400 => copyWith(fontWeight: AppFontWeight.regularW400);

  AppTextStyle get w500 => copyWith(fontWeight: AppFontWeight.regular2W500);

  AppTextStyle get w600 => copyWith(fontWeight: AppFontWeight.semiBoldW600);

  AppTextStyle get w700 => copyWith(fontWeight: AppFontWeight.boldW700);
  AppTextStyle get w900 => copyWith(fontWeight: AppFontWeight.boldW900);

  AppTextStyle get w800 => copyWith(fontWeight: AppFontWeight.extraBoldW800);
}

extension AppStyleFontStyle on AppTextStyle {
  TextStyle get displayLarge32 =>
      AppReference.themeData.textTheme.displayLarge!.copyWith(
        color: color,
        fontFamily: fontFamily,
        fontWeight: fontWeight,
        fontSize: fontSize,
      );

  TextStyle get displayMedium30 =>
      AppReference.themeData.textTheme.displayMedium!.copyWith(
        color: color,
        fontFamily: fontFamily,
        fontWeight: fontWeight,
        fontSize: fontSize,
      );

  TextStyle get displaySmall28 =>
      AppReference.themeData.textTheme.displaySmall!.copyWith(
        color: color,
        fontFamily: fontFamily,
        fontWeight: fontWeight,
        fontSize: fontSize,
      );

  TextStyle get titleLarge22 => AppTextStyle.titleLarge22.copyWith(
    color: color,
    fontFamily: fontFamily,
    fontWeight: fontWeight,
    fontSizeUnderLine: fontSize,
  );

  TextStyle get titleMedium20 =>
      AppReference.themeData.textTheme.titleMedium!.copyWith(
        color: color,
        fontFamily: fontFamily,
        fontWeight: fontWeight,
        fontSize: fontSize,
      );

  TextStyle get titleSmall18 =>
      AppReference.themeData.textTheme.titleSmall!.copyWith(
        color: color,
        fontFamily: fontFamily,
        fontWeight: fontWeight,
        fontSize: fontSize,
      );

  TextStyle get bodyLarge16 =>
      AppReference.themeData.textTheme.bodyLarge!.copyWith(
        color: color,
        fontFamily: fontFamily,
        fontWeight: fontWeight,
        fontSize: fontSize,
      );

  TextStyle get bodyMedium14 =>
      AppReference.themeData.textTheme.bodyMedium!.copyWith(
        color: color,
        fontFamily: fontFamily,
        fontWeight: fontWeight,
        fontSize: fontSize,
      );

  TextStyle get bodySmall12 =>
      AppReference.themeData.textTheme.bodySmall!.copyWith(
        color: color,
        fontFamily: fontFamily,
        fontWeight: fontWeight,
        fontSize: fontSize,
      );
}

extension AppStyleFontSize on AppTextStyle {
  AppTextStyle customFontSize(double fontSize) =>
      copyWith(fontSize: fontSize.responsiveFontSize);

  AppTextStyle get s5 => copyWith(fontSize: AppFontSize.sp5.responsiveFontSize);
  AppTextStyle get s16 => copyWith(fontSize: AppFontSize.sp16.responsiveFontSize);

  AppTextStyle get s6 => copyWith(fontSize: AppFontSize.sp6.responsiveFontSize);

  AppTextStyle get s7 => copyWith(fontSize: AppFontSize.sp7.responsiveFontSize);

  AppTextStyle get s8 => copyWith(fontSize: AppFontSize.sp8.responsiveFontSize);

  AppTextStyle get s9 => copyWith(fontSize: AppFontSize.sp9.responsiveFontSize);

  AppTextStyle get s10 =>
      copyWith(fontSize: AppFontSize.sp10.responsiveFontSize);

  AppTextStyle get s11 =>
      copyWith(fontSize: AppFontSize.sp11.responsiveFontSize);

  AppTextStyle get s12 =>
      copyWith(fontSize: AppFontSize.sp12.responsiveFontSize);

  AppTextStyle get s13 =>
      copyWith(fontSize: AppFontSize.sp13.responsiveFontSize);

  AppTextStyle get s14 =>
      copyWith(fontSize: AppFontSize.sp14.responsiveFontSize);

  AppTextStyle get s15 =>
      copyWith(fontSize: AppFontSize.sp15.responsiveFontSize);


  AppTextStyle get s17 =>
      copyWith(fontSize: AppFontSize.sp17.responsiveFontSize);

  AppTextStyle get s18 =>
      copyWith(fontSize: AppFontSize.sp18.responsiveFontSize);

  AppTextStyle get s19 =>
      copyWith(fontSize: AppFontSize.sp19.responsiveFontSize);

  AppTextStyle get s20 =>
      copyWith(fontSize: AppFontSize.sp20.responsiveFontSize);

  AppTextStyle get s21 =>
      copyWith(fontSize: AppFontSize.sp21.responsiveFontSize);

  AppTextStyle get s22 =>
      copyWith(fontSize: AppFontSize.sp22.responsiveFontSize);

  AppTextStyle get s23 =>
      copyWith(fontSize: AppFontSize.sp23.responsiveFontSize);

  AppTextStyle get s24 =>
      copyWith(fontSize: AppFontSize.sp24.responsiveFontSize);

  AppTextStyle get s25 =>
      copyWith(fontSize: AppFontSize.sp25.responsiveFontSize);

  AppTextStyle get s26 =>
      copyWith(fontSize: AppFontSize.sp26.responsiveFontSize);

  AppTextStyle get s27 =>
      copyWith(fontSize: AppFontSize.sp27.responsiveFontSize);

  AppTextStyle get s28 =>
      copyWith(fontSize: AppFontSize.sp28.responsiveFontSize);

  AppTextStyle get s29 =>
      copyWith(fontSize: AppFontSize.sp29.responsiveFontSize);

  AppTextStyle get s30 =>
      copyWith(fontSize: AppFontSize.sp30.responsiveFontSize);

  AppTextStyle get s31 =>
      copyWith(fontSize: AppFontSize.sp31.responsiveFontSize);

  AppTextStyle get s32 =>
      copyWith(fontSize: AppFontSize.sp32.responsiveFontSize);

  AppTextStyle get s33 =>
      copyWith(fontSize: AppFontSize.sp33.responsiveFontSize);

  AppTextStyle get s34 =>
      copyWith(fontSize: AppFontSize.sp34.responsiveFontSize);

  AppTextStyle get s35 =>
      copyWith(fontSize: AppFontSize.sp35.responsiveFontSize);

  AppTextStyle get s36 =>
      copyWith(fontSize: AppFontSize.sp36.responsiveFontSize);

  AppTextStyle get s37 =>
      copyWith(fontSize: AppFontSize.sp37.responsiveFontSize);

  AppTextStyle get s38 =>
      copyWith(fontSize: AppFontSize.sp38.responsiveFontSize);

  AppTextStyle get s39 =>
      copyWith(fontSize: AppFontSize.sp39.responsiveFontSize);

  AppTextStyle get s40 =>
      copyWith(fontSize: AppFontSize.sp40.responsiveFontSize);

  AppTextStyle get s41 =>
      copyWith(fontSize: AppFontSize.sp41.responsiveFontSize);

  AppTextStyle get s42 =>
      copyWith(fontSize: AppFontSize.sp42.responsiveFontSize);

  AppTextStyle get s43 =>
      copyWith(fontSize: AppFontSize.sp43.responsiveFontSize);

  AppTextStyle get s44 =>
      copyWith(fontSize: AppFontSize.sp44.responsiveFontSize);

  AppTextStyle get s45 =>
      copyWith(fontSize: AppFontSize.sp45.responsiveFontSize);

  AppTextStyle get s46 =>
      copyWith(fontSize: AppFontSize.sp46.responsiveFontSize);

  AppTextStyle get s47 =>
      copyWith(fontSize: AppFontSize.sp47.responsiveFontSize);

  AppTextStyle get s48 =>
      copyWith(fontSize: AppFontSize.sp48.responsiveFontSize);

  AppTextStyle get s49 =>
      copyWith(fontSize: AppFontSize.sp49.responsiveFontSize);

  AppTextStyle get s50 =>
      copyWith(fontSize: AppFontSize.sp50.responsiveFontSize);
}

abstract class AppFontWeight {
  static const extraLightW100 = FontWeight.w100;
  static const mediumLightW200 = FontWeight.w200;
  static const lightW300 = FontWeight.w300;
  static const regularW400 = FontWeight.w400;
  static const regular2W500 = FontWeight.w500;
  static const semiBoldW600 = FontWeight.w600;
  static const boldW700 = FontWeight.w700;
  static const boldW900 = FontWeight.w900;
  static const extraBoldW800 = FontWeight.w800;
}

abstract class AppFontSize {
  static const double sp5 = 5;
  static const double sp6 = 6;
  static const double sp7 = 7;
  static const double sp8 = 8;
  static const double sp9 = 9;
  static const double sp10 = 10;
  static const double sp11 = 11;
  static const double sp12 = 12;
  static const double sp13 = 13;
  static const double sp14 = 14;
  static const double sp15 = 15;
  static const double sp16 = 16;
  static const double sp17 = 17;
  static const double sp18 = 18;
  static const double sp19 = 19;
  static const double sp20 = 20;
  static const double sp21 = 21;
  static const double sp22 = 22;
  static const double sp23 = 23;
  static const double sp24 = 24;
  static const double sp25 = 25;
  static const double sp26 = 26;
  static const double sp27 = 27;
  static const double sp28 = 28;
  static const double sp29 = 29;
  static const double sp30 = 30;
  static const double sp31 = 31;
  static const double sp32 = 32;
  static const double sp33 = 33;
  static const double sp34 = 34;
  static const double sp35 = 35;
  static const double sp36 = 36;
  static const double sp37 = 37;
  static const double sp38 = 38;
  static const double sp39 = 39;
  static const double sp40 = 40;
  static const double sp41 = 41;
  static const double sp42 = 42;
  static const double sp43 = 43;
  static const double sp44 = 44;
  static const double sp45 = 45;
  static const double sp46 = 46;
  static const double sp47 = 47;
  static const double sp48 = 48;
  static const double sp49 = 49;
  static const double sp50 = 50;
}