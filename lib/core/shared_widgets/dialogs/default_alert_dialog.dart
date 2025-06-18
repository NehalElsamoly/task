import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:task/core/utils/exports.dart';

import '../../../config/resources/app_colors.dart';
import '../../../config/resources/app_text_style.dart';
import '../../../config/resources/app_values.dart';
import '../../../my_app/app_reference.dart';
import '../button_widget.dart';

class DefaultAlertDialog extends StatelessWidget {
  final String message;
  final Function(bool) confirm;
  final bool isTwoButton;
  final bool withImage;
  final String? title;
  final String ?imagePath;

  const DefaultAlertDialog({
    super.key,
    required this.message,
    required this.confirm,
    this.isTwoButton = true,
    this.withImage = true,
    this.title,
    this.imagePath,
  });

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
        padding: EdgeInsets.all(AppPadding.p20.responsiveSize),
        // width: AppReference.deviceIsTablet?AppReference.deviceWidth(context) * 0.6:AppReference.deviceWidth(context) * 0.8,
        constraints: BoxConstraints(
          minWidth:AppReference.deviceIsTablet?AppReference.deviceWidth(context) * 0.4:AppReference.deviceWidth(context) * 0.8,
          maxWidth:AppReference.deviceIsTablet?AppReference.deviceWidth(context) * 0.6:AppReference.deviceWidth(context) * 0.8,
          minHeight: AppReference.deviceHeight(context) * 0.26,
          maxHeight: AppReference.deviceIsTablet? AppReference.deviceHeight(context) * 0.45.responsiveHeightRatio:AppReference.deviceHeight(context) * 0.46,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20.responsiveSize),
          color: Colors.white,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            if(withImage)
            SvgPicture.asset(
              imagePath??'',
              height: AppReference.deviceHeight(context) * 0.16,
            ),
            if(withImage)
            (AppSize.s10).sizedBoxHeight,
            Text(
              title ?? 'تنبيه !',
              style: AppReference.themeData.textTheme.displaySmall!.copyWith(
                  color: AppColors.orange, fontWeight: FontWeight.bold),
            ),
            (AppSize.s10).sizedBoxHeight,
            Text(
              message,
              style: const AppTextStyle().s16.titleLarge22,
              maxLines: 5,
              overflow: TextOverflow.ellipsis,
            ),
            (AppSize.s10).sizedBoxHeight,
            OkOrCancelButton(
              confirm: (confirm),
              isTwoButton: isTwoButton,
            )
          ],
        ),
      ),
    );
  }
}

class OkOrCancelButton extends StatelessWidget {
  final Function(bool) confirm;
  final bool isTwoButton;

  const OkOrCancelButton({
    super.key,
    required this.confirm,
    this.isTwoButton = true,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: DefaultButtonWidget(
            label: 'حسنا',
            textVerticalPadding: 0,
            onPressed: () {
              confirm(true);
              Navigator.pop(context);
            },
          ),
        ),
        AppSize.s10.sizedBoxWidth,
        if (isTwoButton)
          Expanded(
            child: DefaultButtonWidget(
              textVerticalPadding: 0,
              label: 'الغاء',
              onPressed: () {
                confirm(false);
                Navigator.pop(context);
              },
            ),
          ),
      ],
    );
  }
}
