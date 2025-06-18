import 'package:flutter/services.dart';
import '../utils/exports.dart';
import 'custom_inkwell.dart';

class CustomTextField extends StatefulWidget {
  final String? labelText;
  final Function()? onTap;
  final Function(String)? onChanged;
  final Function(String)? onSubmitted;
  final String? initialValue;
  final Widget? prefixIcon;
  final bool? isTablet;
  final Widget? suffixIcon;
  final double? borderRadius;
  final bool? enabled;
  final String? title;
  final String? hintText;
  final List<String>? autoFillHints;
  final bool isMessage;
  final bool isPassword;
  final bool ischange;
  final bool? requiredTiltle;
  final bool autoFocus;
  final String? Function(String?)? validator;
  final TextEditingController? controller;
  final TextInputType? keyboardType;
  final bool isPhoneNumber;
  final List<TextInputFormatter>? inputFormatters;
  final void Function(String, String)? onPhoneChanged;
  final TextInputAction? textInputAction;

  const CustomTextField({
    super.key,
    this.isTablet,
    this.labelText,
    this.hintText,
    this.prefixIcon,
    this.validator,
    this.suffixIcon,
    this.keyboardType = TextInputType.text,
    this.isMessage = false,
    this.controller,
    this.initialValue,
    this.onChanged,
    this.onTap,
    this.isPassword = false,
    this.onSubmitted,
    this.autoFillHints,
    this.borderRadius,
    this.enabled = true,
    this.ischange = false,
    this.title,
    this.autoFocus = false,
    this.isPhoneNumber = false,
    this.onPhoneChanged,
    this.requiredTiltle,
    this.textInputAction,
    this.inputFormatters
  });

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  FocusNode myFocusNode = FocusNode();
  bool showPassword = false; // State is now managed here in the parent

  @override
  void initState() {
    super.initState();
    myFocusNode.addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    myFocusNode.dispose();
    super.dispose();
  }

  // Add method to toggle password visibility
  void togglePasswordVisibility() {
    setState(() {
      showPassword = !showPassword;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (widget.title != null) ...[
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  widget.title!,
                  style: const AppTextStyle().w400.displaySmall28.copyWith(
                    fontSize: widget.isTablet == true ? 16.responsiveFontSize : 14.responsiveFontSize,
                    color: AppColors.primaryDarkFont,
                  ),
                ),
                if (widget.requiredTiltle == true) ...[
                  Padding(
                    padding: const EdgeInsetsDirectional.only(start: 5),
                    child: Text(
                      '*',
                      style: AppTextStyle().w400.s14.displaySmall28.copyWith(
                        fontSize: 14.responsiveFontSize,
                        color: AppColors.red,
                      ),
                    ),
                  ),
                ],
              ],
            ),
            6.sizedBoxHeight,
          ],

          RegularTextField(
            focusNode: myFocusNode,
            showPassword: showPassword, // Pass parent's state to child
            labelText: widget.labelText,
            hintText: widget.hintText,
            prefixIcon: widget.prefixIcon,
            validator: widget.validator,
            suffixIcon: widget.suffixIcon,
            controller: widget.controller,
            initialValue: widget.initialValue,
            onChanged: widget.onChanged,
            onTap: widget.onTap,
            onSubmitted: widget.onSubmitted,
            autoFillHints: widget.autoFillHints,
            borderRadius: widget.borderRadius,
            onPhoneChanged: widget.onPhoneChanged,
            textInputAction: widget.textInputAction,
            inputFormatters: widget.inputFormatters,
            isTablet: widget.isTablet,
            onTogglePassword: widget.isPassword ? togglePasswordVisibility : null,
            isPhoneNumber: widget.isPhoneNumber,
            keyboardType: widget.keyboardType,
            isMessage: widget.isMessage,
            isPassword: widget.isPassword,
            enabled: widget.enabled,
            ischange: widget.ischange,
            autoFocus: widget.autoFocus,
          )
        ],
      ),
    );
  }
}

class RegularTextField extends StatelessWidget {
  final String? labelText;
  final Function()? onTap;
  final Function(String)? onChanged;
  final Function(String)? onSubmitted;
  final String? initialValue;
  final Widget? prefixIcon;
  final bool? isTablet;
  final Widget? suffixIcon;
  final double? borderRadius;
  final bool? enabled;
  final String? hintText;
  final List<String>? autoFillHints;
  final bool isMessage;
  final bool isPassword;
  final bool ischange;
  final bool autoFocus;
  final bool isPhoneNumber;
  final String? Function(String?)? validator;
  final TextEditingController? controller;
  final TextInputType? keyboardType;
  final List<TextInputFormatter>? inputFormatters;
  final void Function(String, String)? onPhoneChanged;
  final TextInputAction? textInputAction;
  final FocusNode focusNode;
  final bool showPassword;
  final VoidCallback? onTogglePassword;

  const RegularTextField({
    required this.focusNode,
    required this.showPassword,
    required this.labelText,
    required this.hintText,
    required this.prefixIcon,
    required this.validator,
    required this.suffixIcon,
    required this.keyboardType,
    required this.isMessage,
    required this.controller,
    required this.initialValue,
    required this.onChanged,
    required this.onTap,
    required this.isPassword,
    required this.onSubmitted,
    required this.autoFillHints,
    required this.borderRadius,
    required this.enabled,
    required this.ischange,
    required this.autoFocus,
    required this.isPhoneNumber,
    required this.onPhoneChanged,
    required this.textInputAction,
    required this.inputFormatters,
    required this.isTablet,
    required this.onTogglePassword,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 4.responsiveHeight),
      child: TextFormField(
        enabled: enabled,
        autofillHints: autoFillHints ?? [AutofillHints.password, AutofillHints.email, AutofillHints.telephoneNumber],
        onTap: onTap,
        inputFormatters: isPhoneNumber
            ? [
          FilteringTextInputFormatter.digitsOnly,
          LengthLimitingTextInputFormatter(10),
        ]
            : inputFormatters,
        onTapOutside: (event) {
          FocusManager.instance.primaryFocus?.unfocus();
        },
        focusNode: focusNode,
        textInputAction: textInputAction,
        autofocus: autoFocus,
        onChanged: onChanged,
        validator: validator,
        keyboardType: isPhoneNumber ? TextInputType.number : keyboardType,
        maxLines: isMessage ? 5 : 1,
        minLines: isMessage ? 5 : 1,
        onFieldSubmitted: onSubmitted,
        obscureText: isPassword && !showPassword,
        controller: controller,
        initialValue: controller == null ? initialValue : null,
        decoration: InputDecoration(
          filled: true,
          fillColor: enabled! ? const Color(0xFFF8F9FB) : AppColors.gray02,
          labelText: labelText,
          prefixIcon: isPhoneNumber
              ? Padding(
            padding: EdgeInsets.only(
              left: isTablet == true ? 10.responsiveWidth : 12,
              right: isTablet == true ? 7.responsiveWidth : 8,
            ),
            child: YourCountryCodeContainerWidget(
              isTablet: isTablet,
              onCodeSelected: (code) {
                if (onPhoneChanged != null) {
                  onPhoneChanged!(code, controller?.text ?? '');
                }
              },
            ),
          )
              : prefixIcon,
          hintText: hintText,
          hintStyle: AppTextStyle().w400.displaySmall28.copyWith(
            fontSize: 12.responsiveFontSize,
            color: AppColors.gray500,
          ),
          prefixIconColor: focusNode.hasFocus ? AppColors.primaryBlue : AppColors.gray500,
          suffixIconColor: focusNode.hasFocus ? AppColors.primaryBlue : AppColors.gray500,
          suffixIcon:isPassword
              ? CustomInkWell(
            onTap: onTogglePassword,
            child: Padding(
              padding: EdgeInsets.all(8.0.responsiveSize),
              child: showPassword
                  ? SvgPicture.asset(AppIcons.eyeIconClosed)
                  : SvgPicture.asset(AppIcons.eyeIcon),
            ),
          )
              : suffixIcon,
          contentPadding: EdgeInsets.symmetric(
            horizontal: 15.responsiveWidth,
            vertical: isTablet == true ? 40.responsiveHeight : 18.responsiveHeight,
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: AppColors.gray02, width: 1.responsiveWidth),
            borderRadius: BorderRadius.all(Radius.circular(borderRadius ?? 20.responsiveSize)),
          ),
          disabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: AppColors.gray500, width:1.responsiveWidth),
            borderRadius: BorderRadius.all(Radius.circular(borderRadius ?? 20)),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: AppColors.primaryBlue, width: 1.responsiveWidth),
            borderRadius: BorderRadius.all(Radius.circular(borderRadius ?? 20.responsiveSize)),
          ),
          errorBorder: OutlineInputBorder(
            borderSide: BorderSide(color: AppColors.red, width: 1.5.responsiveWidth),
            borderRadius: BorderRadius.all(Radius.circular(borderRadius ?? 20.responsiveWidth)),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderSide: BorderSide(color: AppColors.red, width: 1.5.responsiveWidth),
            borderRadius: BorderRadius.all(Radius.circular(borderRadius ?? 20.responsiveWidth)),
          ),
        ),
      ),
    );
  }
}
class YourCountryCodeContainerWidget extends StatefulWidget {
  final void Function(String code)? onCodeSelected;
final bool ?isTablet;
  const YourCountryCodeContainerWidget({super.key, this.onCodeSelected,this.isTablet});

  @override
  State<YourCountryCodeContainerWidget> createState() => _YourCountryCodeContainerWidgetState();
}

class _YourCountryCodeContainerWidgetState extends State<YourCountryCodeContainerWidget> {
  late CountryData selectedCountry;

  final List<CountryData> countries = [
    CountryData(flagAsset: AppIcons.egyptFlag, code: '+20'),
    CountryData(flagAsset: AppIcons.egyptFlag, code: '+966'),
    CountryData(flagAsset: AppIcons.egyptFlag, code: '+971'),
    // أضف باقي الدول
  ];

  @override
  void initState() {
    super.initState();
    selectedCountry = countries.first;
  }

  void _onCountrySelected(CountryData country) {
    setState(() {
      selectedCountry = country;
    });
    widget.onCodeSelected?.call(country.code);
  }

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<CountryData>(
        color: AppColors.white,
      style: ButtonStyle( ),
      onSelected: _onCountrySelected,
      offset: Offset(0, 50),
      itemBuilder: (context) => countries
          .map((country) => PopupMenuItem(

        value: country,
        child: Row(
          children: [
            SvgPicture.asset(country.flagAsset,),
         10.sizedBoxWidth,
            Text(country.code),
          ],
        ),
      ))
          .toList(),
      child: Padding(
        padding:  EdgeInsets.symmetric(vertical:widget.isTablet==true?0:3.0.responsiveHeight,horizontal:widget.isTablet==true?0.responsiveWidth:0 ),
        child: Container(
       //   height:8.responsiveHeight ,
        //  width:71.responsiveWidth ,
          padding: EdgeInsets.only(left: 6.responsiveWidth,right: 6.responsiveWidth),
          decoration: BoxDecoration(
            color:AppColors.white,
            borderRadius: BorderRadius.circular(20.responsiveSize),
          ),
          child: Row(
           mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            spacing: 0,
            children: [

              SvgPicture.asset(selectedCountry.flagAsset,
                  width: 16.responsiveWidth, height: 16.responsiveHeight
              ),
             widget.isTablet==true?4.sizedBoxWidth: 14.sizedBoxWidth,
              Container(
                width: 1,
                height: 24.responsiveHeight,
                color:AppColors.gray300,
              ),
              widget.isTablet==true?4.sizedBoxWidth: 8.sizedBoxWidth,              Text(
                selectedCountry.code,
                style: const AppTextStyle().w400.displaySmall28.copyWith(
                  fontSize: 14.responsiveFontSize,
                  color: AppColors.primaryDarkFont,
                ),
              ),
           //   Icon(Icons.arrow_drop_down),
            ],
          ),
        ),
      ),
    );
  }
}

class CountryData {
  final String flagAsset;
  final String code;

  CountryData({required this.flagAsset, required this.code});
}
