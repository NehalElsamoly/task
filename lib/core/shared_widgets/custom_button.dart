





import '../utils/exports.dart';
import 'custom_inkwell.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final Color? fillColor;
  final Color? borderColor;
  final Color? textColor;
  final VoidCallback onPressed;
 final  double? width;
 final  double? height;
final bool? isTablet;
final bool isOutLineButon;

// ToDo : remove hint
  const CustomButton({super.key,
    this.width,
    this.isTablet=false,
    required this.text,
     this.fillColor,
     this.borderColor,
    this.height,
    this.textColor,
    this.isOutLineButon=false,
    required this.onPressed,
  }) ;

  @override
  Widget build(BuildContext context) {
    //ToDo: Why InkWell???????????????
    return CustomInkWell(

   //   borderRadius: BorderRadius.circular(10.responsiveSize),
      onTap: onPressed,
      child: Container(
        width:width ?? (
            isTablet == true
            ? AppReference.deviceWidth(context) / 2
            : double.infinity
        ),
        height:height ??(
            isTablet==true?75.responsiveHeight:50.responsiveHeight),
        decoration: BoxDecoration(
          color: fillColor?? (isOutLineButon?AppColors.white:AppColors.primaryBlue),
          borderRadius: BorderRadius.circular(isTablet==true?20.responsiveSize:17.responsiveSize,),
          border: Border.all(color:isOutLineButon? AppColors.black:borderColor??AppColors.primaryBlue, width: 1.5),

        ),
        alignment: AlignmentDirectional.center,
        child: Text(
          text, style: const AppTextStyle().w700.displaySmall28.copyWith(
          fontSize: isTablet==true?22.responsiveFontSize:16.responsiveFontSize,
          color:isOutLineButon?AppColors.black: textColor??AppColors.white,)
        ),
      ),
    );
  }
}
