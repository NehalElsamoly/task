




import '../utils/exports.dart';
import 'custom_inkwell.dart';

class CustomBackButton extends StatelessWidget {
  const CustomBackButton({super.key,this.widget,this.size});
  final Widget? widget;
  final double ? size;

  @override
  Widget build(BuildContext context) {
    return     CustomInkWell(
      onTap: (){
        RouteManager.rPopRoute(context);
      },
      child: widget ??
          Icon(Icons.arrow_back_ios,color:AppColors.primaryBlue,
            size: size,
          ),
    );
  }
}
