
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:task/core/utils/exports.dart';


import '../../../config/resources/app_assets.dart';
import '../../../config/resources/app_colors.dart';
import '../../../config/resources/app_text_style.dart';
import '../../../config/resources/app_values.dart';
import '../../../my_app/app_reference.dart';
import '../../enum/enum.dart';
import '../button_widget.dart';

void showStatusDialog({required BuildContext context,required String message, required ToastStates state}) => showDialog<void>(
    context: context,
    barrierDismissible: false,
    builder: (BuildContext context) => DialogsStatus(state: state,message: message,));

class DialogsStatus extends StatelessWidget {
  final ToastStates state;
  final String message;

  const DialogsStatus({super.key, required this.state, required this.message});

  @override
  Widget build(BuildContext context) {

    return AlertDialog(
      contentPadding: EdgeInsets.zero,
      elevation: 5,
      actionsPadding: EdgeInsets.zero,
      buttonPadding: EdgeInsets.zero,
      iconPadding: EdgeInsets.zero,
      insetPadding: EdgeInsets.zero,
      titlePadding: EdgeInsets.zero,
      content: Container(
        height:!AppReference.isPortrait(context)? AppReference.deviceHeight(context)  *.75: AppReference.deviceHeight(context)*0.35,
        width: !AppReference.isPortrait(context)?AppReference.deviceWidth(context) * 0.45:AppReference.deviceWidth(context) * 0.8,
        padding: EdgeInsets.all(AppPadding.p20.responsiveSize),
        constraints: BoxConstraints(
          minHeight: AppReference.deviceHeight(context) * 0.26.responsiveHeightRatio,
          maxHeight: AppReference.deviceHeight(context) * 0.75.responsiveHeightRatio,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20.responsiveSize),
          color: Colors.white,
        ),
        child: Column(
          children: [
              SvgPicture.asset(
                 _imagePath(state),
                height: AppReference.deviceHeight(context) * 0.15.responsiveHeightRatio,
              ),
            AppSize.s4.sizedBoxHeight,
            Text(
              _title(state),
              style: const AppTextStyle().w600.titleSmall18,
            ),
            AppSize.s4.sizedBoxHeight,
            Text(
              message,
              style: const AppTextStyle().w500.bodyMedium14.copyWith(
                color: AppColors.grayText,
              ),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
            const Spacer(),
              SizedBox(
                width: AppReference.deviceWidth(context) * 0.6,
                child: DefaultButtonWidget(
                  elevation: 0,
                  label: 'حسنا',
                  buttonColor: _chooseToastPrimaryColor(state),
                  borderColor: Colors.transparent,
                  labelColor: _chooseToastSecondaryColor(state),
                  textVerticalPadding: !AppReference.isPortrait(context)?6:0,
                  onPressed: () {
                   Navigator.pop(context);
                  },
                ),),

          ],
        ),
      ),
    );
  }

  String _imagePath(ToastStates state) {
    switch (state) {
      case ToastStates.congrats:
        return AppIcons.sSuccussDialoug;
      case ToastStates.error:
        return AppIcons.sSuccussDialoug;
      case ToastStates.warning:
        return AppIcons.sSuccussDialoug;
      case ToastStates.info:
        return AppIcons.sSuccussDialoug;
    }
  }
  String _title(ToastStates state) {
    switch (state) {
      case ToastStates.congrats:
        return "مبرووووك !";
      case ToastStates.error:
        return "نأسف !";
      case ToastStates.warning:
        return "تنويه!";
      case ToastStates.info:
        return "عملية ناجحة !";
    }
  }

  String _message(ToastStates state) {
    switch (state) {
      case ToastStates.congrats:
        return "لقد اجتزت الاختبار";
      case ToastStates.error:
        return "لقد حدث خطأ ما";
      case ToastStates.warning:
        return "لقد حدث خطأ ما";
      case ToastStates.info:
        return "لقد اشتركت بنجاح";
    }
  }

  Color _chooseToastPrimaryColor(ToastStates state) {
    switch (state) {
      case ToastStates.congrats:
        return AppColors.green.withOpacity(.2);
      case ToastStates.error:
        return AppColors.failColor.withOpacity(.2);
      case ToastStates.warning:
        return AppColors.yellow.withOpacity(.2);
      case ToastStates.info:
        return AppColors.green.withOpacity(.2);
    }
  }

  Color _chooseToastSecondaryColor(ToastStates state) {
    switch (state) {
      case ToastStates.congrats:
        return AppColors.green;
      case ToastStates.error:
        return AppColors.failColor;
      case ToastStates.warning:
        return AppColors.yellow;
      case ToastStates.info:
        return AppColors.green;
    }
  }
}
