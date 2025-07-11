import 'dart:math';

import 'package:flutter/material.dart';
import 'package:task/core/utils/exports.dart';

import '../../config/resources/app_constants.dart';
import '../../config/resources/app_values.dart';

import '../../config/resources/app_colors.dart';
import '../../my_app/app_reference.dart';

enum DotType { square, circle, diamond, icon }

void showLoadingDialog(BuildContext context) => showDialog<void>(
    context: context,
   barrierDismissible: false,
    builder: (BuildContext context) => const PopScope(
        canPop: false,
        child: LoadingWidget()));

class LoadingWidget extends StatelessWidget {
  const LoadingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 100.responsiveWidth,
        height: AppReference.deviceWidth(context)*0.14.responsiveHeight,
        padding: EdgeInsets.all(AppReference.deviceIsTablet?AppPadding.p10.responsiveSize:AppPadding.p20.responsiveSize),
        decoration: BoxDecoration(
            color: AppColors.primaryBlue,
            borderRadius: BorderRadius.circular(
                AppConstants.appBorderRadiusR10.responsiveSize)),
        child: const PopScope(
            canPop: false,
            child: ColorLoader5(
              dotType: DotType.diamond,
            )),
      ),
    );
  }
}

class ColorLoader5 extends StatefulWidget {
  final Color dotOneColor;
  final Color dotTwoColor;
  final Color dotThreeColor;
  final Duration duration;
  final DotType dotType;
  final Icon dotIcon;

  const ColorLoader5(
      {super.key,
      this.dotOneColor = Colors.redAccent,
      this.dotTwoColor = Colors.green,
      this.dotThreeColor = Colors.blueAccent,
      this.duration = const Duration(milliseconds: 1000),
      this.dotType = DotType.circle,
      this.dotIcon = const Icon(Icons.blur_on)});

  @override
  State<ColorLoader5> createState() => _ColorLoader5State();
}

class _ColorLoader5State extends State<ColorLoader5>
    with SingleTickerProviderStateMixin {
  late Animation<double> animation_1;
  late Animation<double> animation_2;
  late Animation<double> animation_3;
  late AnimationController controller;

  @override
  void initState() {
    super.initState();

    controller = AnimationController(duration: widget.duration, vsync: this);

    animation_1 = Tween(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: controller,
        curve: const Interval(0.0, 0.70, curve: Curves.linear),
      ),
    );

    animation_2 = Tween(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: controller,
        curve: const Interval(0.1, 0.80, curve: Curves.linear),
      ),
    );

    animation_3 = Tween(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: controller,
        curve: const Interval(0.2, 0.90, curve: Curves.linear),
      ),
    );

    controller.addListener(() {
      setState(() {
      });
    });

    controller.repeat();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Opacity(
          opacity: (animation_1.value <= 0.4
              ? 2.5 * animation_1.value
              : (animation_1.value > 0.40 && animation_1.value <= 0.60)
                  ? 1.0
                  : 2.5 - (2.5 * animation_1.value)),
          child: Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: Dot(
              radius: 10.0,
              color: widget.dotOneColor,
              type: widget.dotType,
              icon: widget.dotIcon,
            ),
          ),
        ),
        Opacity(
          opacity: (animation_2.value <= 0.4
              ? 2.5 * animation_2.value
              : (animation_2.value > 0.40 && animation_2.value <= 0.60)
                  ? 1.0
                  : 2.5 - (2.5 * animation_2.value)),
          child: Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: Dot(
              radius: 10.0,
              color: widget.dotTwoColor,
              type: widget.dotType,
              icon: widget.dotIcon,
            ),
          ),
        ),
        Opacity(
          opacity: (animation_3.value <= 0.4
              ? 2.5 * animation_3.value
              : (animation_3.value > 0.40 && animation_3.value <= 0.60)
                  ? 1.0
                  : 2.5 - (2.5 * animation_3.value)),
          child: Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: Dot(
              radius: 10.0,
              color: widget.dotThreeColor,
              type: widget.dotType,
              icon: widget.dotIcon,
            ),
          ),
        ),
      ],
    );
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}

class Dot extends StatelessWidget {
  final double? radius;
  final Color? color;
  final DotType? type;
  final Icon? icon;

  const Dot({super.key, this.radius, this.color, this.type, this.icon});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: type == DotType.icon
          ? Icon(
              icon!.icon,
              color: color,
              size: 1.3 * radius!,
            )
          : Transform.rotate(
              angle: type == DotType.diamond ? pi / 4 : 0.0,
              child: Container(
                width: radius,
                height: radius,
                decoration: BoxDecoration(
                    color: color,
                    shape: type == DotType.circle
                        ? BoxShape.circle
                        : BoxShape.rectangle),
              ),
            ),
    );
  }
}
