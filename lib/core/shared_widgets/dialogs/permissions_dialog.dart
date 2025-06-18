// import 'package:flutter/material.dart';
// import 'package:tasesse_app/config/resources/app_colors.dart';
// import 'package:tasesse_app/config/resources/app_constants.dart';
// import 'package:tasesse_app/config/responsive/responsive_extensions.dart';
// import 'package:tasesse_app/core/shared_widget/button_widget.dart';
// import 'package:tasesse_app/my_app/app_reference.dart';
//
// import '../../../config/resources/app_values.dart';
//
// showPermissionsDialog({
//   required BuildContext context,
//   required String title,
//   required String message,
//   required void Function() buttonOnPressed1,
//   required void Function() buttonOnPressed2,
//   required String buttonText1,
//   required String buttonText2,
// }) {
//   showDialog(
//     context: context,
//     barrierDismissible: false,
//     builder: (context) => PermissionsDialog(
//       title: title,
//       message: message,
//       buttonOnPressed1: buttonOnPressed1,
//       buttonOnPressed2: buttonOnPressed2,
//       buttonText1: buttonText1,
//       buttonText2: buttonText2,
//     ),
//   );
// }
//
// class PermissionsDialog extends StatelessWidget {
//   final String title;
//   final String message;
//   final VoidCallback buttonOnPressed1;
//   final VoidCallback buttonOnPressed2;
//   final String buttonText1;
//   final String buttonText2;
//
//   const PermissionsDialog(
//       {super.key,
//       required this.title,
//       required this.message,
//       required this.buttonOnPressed1,
//       required this.buttonOnPressed2,
//       required this.buttonText1,
//       required this.buttonText2});
//
//   @override
//   Widget build(BuildContext context) {
//     return AlertDialog(
//       shape: RoundedRectangleBorder(
//         borderRadius: BorderRadius.circular(AppConstants.appBorderRadiusR20.responsiveSize),
//       ),
//       insetPadding: EdgeInsets.zero,
//       contentPadding: EdgeInsets.zero,
//       content: Container(
//         height: AppReference.isPortrait(context)?AppReference.deviceHeight(context) * 0.4.responsiveHeightRatio:AppReference.deviceHeight(context) * 0.3.responsiveHeightRatio,
//         width: AppReference.isPortrait(context)?AppReference.deviceWidth(context) * 0.85:AppReference.deviceWidth(context) * 0.5,
//         decoration: BoxDecoration(
//           color: AppColors.primary2,
//           border: Border.all(
//             color: AppColors.primaryColorBlue,
//             width: 2.responsiveSize,
//           ),
//           borderRadius: BorderRadius.only(
//             topLeft: Radius.circular(AppConstants.appBorderRadiusR20.responsiveSize),
//             topRight: Radius.circular(AppConstants.appBorderRadiusR20.responsiveSize),
//             bottomLeft: Radius.circular(AppConstants.appBorderRadiusR20.responsiveSize),
//           ),
//         ),
//         child: LayoutBuilder(
//           builder: (context, constrains) {
//             return Column(
//               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//               children: [
//                 Text(
//                   title,
//                   style: AppReference.themeData.textTheme.headlineLarge!
//                       .copyWith(
//                     fontWeight: FontWeight.w700,
//                     color: AppColors.primaryColorBlue,
//                   ),
//                 ),
//                 Divider(
//                   color: AppColors.primary2,
//                   thickness: 5.responsiveSize,
//                   endIndent: 120,
//                   indent: 100,
//                 ),
//                 Padding(
//                   padding: EdgeInsets.all(5.responsiveSize),
//                   child: Text(
//                     message,
//                     style: AppReference.themeData.textTheme.headlineSmall!.copyWith(
//                         fontWeight: FontWeight.w700, color: AppColors.primaryColorBlue),
//                     textAlign: TextAlign.center,
//                   ),
//                 ),
//                 SizedBox(
//                   height: constrains.maxHeight * .2,
//                   child: DefaultButtonWidget(
//                     label: buttonText1,
//                     onPressed: buttonOnPressed1,
//                     buttonColor: AppColors.primaryColorOrange,
//                     height: 20,
//                     width: 100,
//                   ).paddingBody(),
//                 ),
//               ],
//             );
//           }
//         ),
//       ),
//     );
//   }
// }
