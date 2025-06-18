import '../utils/exports.dart';

class TextWithUnderLine extends StatelessWidget {
  const TextWithUnderLine({super.key,required this.text,this.colorText,this.fontSize,this.decorationColor});
final String text;
 final Color? colorText;
 final Color? decorationColor;
 final double? fontSize;
  @override
  Widget build(BuildContext context) {
    return  Text(
        text,
        textAlign: TextAlign.end,
        style: TextStyle(
      decoration: TextDecoration.underline,
      decorationColor: decorationColor ?? AppColors.primaryBlue,
      // height: 2,
      decorationThickness: 2,
fontFamily:AppTextStyle.roboto ,
      fontSize: fontSize ?? 14.responsiveFontSize,
      color: colorText ?? AppColors.primaryBlue,
      fontWeight:FontWeight.w700,
    )
    );
  }
}

