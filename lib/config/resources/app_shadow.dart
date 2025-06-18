

import '../../core/utils/exports.dart';

abstract class AppShadow {
  static  BoxShadow outerShadow = BoxShadow(
    color:AppColors.gray300.withOpacity(.5),
    offset: Offset(0, -2.0),
    blurRadius: 4.0,
    // spreadRadius: 1.0,
  );

  static BoxShadow appBoxShadow() =>
      BoxShadow(
        color: AppColors.black.withOpacity(0.08),
        spreadRadius: 2,
        blurRadius: 2,
        offset: const Offset(0, 2), // changes position of shadow
      );

  static BoxShadow filledBoxShadow() =>
      BoxShadow(
        offset: const Offset(0, 10),
        blurRadius: 33,
        color: AppColors.primaryDarkFont.withOpacity(.84),
      );

  static BoxShadow newFilledBoxShadow() =>
      BoxShadow(
          color: AppColors.primaryDarkFont.withOpacity(.15),
          offset: const Offset(0, 4),
          blurRadius: 15,
          spreadRadius: 0
      );
  static BoxShadow commonBoxShadow() =>
BoxShadow(
  color: Colors.black12,
  blurRadius: 10,
  offset: Offset(0, -2),
); static BoxShadow containerBoxShadow() =>
      BoxShadow(
        color: Colors.grey.shade200,
        spreadRadius: 0,
        blurRadius: 4,
        offset: const Offset(0, 3), // Shadow position
      );
}
