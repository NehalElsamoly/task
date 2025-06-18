




import '../../../core/utils/exports.dart';

ThemeData appLightTheme() {
  return ThemeData(
    fontFamily: AppTextStyle.roboto,

    scaffoldBackgroundColor: AppColors.white,
    textTheme: TextTheme(
      displayLarge: AppTextStyle.displayLarge32,
      displayMedium: AppTextStyle.displayMedium30,
      displaySmall: AppTextStyle.displaySmall28,
      titleLarge: AppTextStyle.titleLarge22,
      titleMedium: AppTextStyle.titleMedium20,
      titleSmall: AppTextStyle.titleSmall18,
      bodyLarge: AppTextStyle.bodyLarge16,
      bodyMedium: AppTextStyle.bodyMedium14,
      bodySmall: AppTextStyle.bodySmall12,
    ),

    // elevatedButtonTheme: ElevatedButtonThemeData(
    //   style: ElevatedButton.styleFrom(
    //     backgroundColor: AppColors.primaryBlue,
    //     shape: RoundedRectangleBorder(
    //       borderRadius: BorderRadius.circular(12),
    //     ),
    //     textStyle: AppTextStyle().w700.white.displaySmall28
    //   ),
    // ),


  );
}