// Widget _buildRegularField(BuildContext context) {
//   return Padding(
//     padding: EdgeInsets.symmetric(vertical: 4.responsiveHeight,),
//     child: TextFormField(
//       //maxLength: 11, // الحد الأقصى لعدد الأرقام
//
//       enabled: widget.enabled,
//       autofillHints:widget.autoFillHints??[AutofillHints.password, AutofillHints.email,AutofillHints.telephoneNumber],
//       // controller: widget.controller,
//       onTap: widget.onTap,
//       inputFormatters: widget.isPhoneNumber
//           ? [FilteringTextInputFormatter.digitsOnly,    LengthLimitingTextInputFormatter(10),
//       ]
//           : widget.inputFormatters,
//       onTapOutside: (event) {
//         //here we can un focus
//         FocusManager.instance.primaryFocus?.unfocus();
//       },
//
//       focusNode: myFocusNode,
//       textInputAction: widget.textInputAction,
//       autofocus: widget.autoFocus,
//       // style: getBoldStyle(fontSize: 13.sp),
//       onChanged: widget.onChanged,
//       validator: widget.validator,
//       keyboardType:  widget.isPhoneNumber ? TextInputType.number : widget.keyboardType,
//       maxLines: widget.isMessage ? 5 : 1,
//       minLines: widget.isMessage ? 5 : 1,
//       onFieldSubmitted: widget.onSubmitted,
//       initialValue: widget.controller == null ? widget.initialValue : null,
//       obscureText: widget.isPassword && !showPassword,
//       decoration: InputDecoration(
//
//         filled: true,
//         fillColor: widget.enabled!
//             ?  Color(0xFFF8F9FB)
//             : AppColors.gray02,
//         labelText: widget.labelText,
//         // labelStyle: getRegularStyle(
//         //   fontHeight: 1.5,
//         //   color: myFocusNode.hasFocus ? AppColors.primary : AppColors.gray,
//         // ),
//         prefixIcon: widget.isPhoneNumber
//             ?
//         Padding(
//           //  padding:  EdgeInsets.all(20),
//           padding: EdgeInsets.only(left: widget.isTablet==true?10.responsiveWidth:12, right: widget.isTablet==true?7.responsiveWidth:8),
//           child: YourCountryCodeContainerWidget(
//             isTablet: widget.isTablet,
//             onCodeSelected: (code) {
//               if (widget.onPhoneChanged != null) {
//                 widget.onPhoneChanged!(code, widget.controller?.text ?? '');
//               }
//             },
//           ),
//         )
//             : widget.prefixIcon,
//
//         hintText: widget.hintText,
//         hintStyle:AppTextStyle().w400.displaySmall28.copyWith(
//           fontSize: 12.responsiveFontSize,
//           color: AppColors.gray500,),
//         prefixIconColor:
//         myFocusNode.hasFocus ? AppColors.primaryBlue : AppColors.gray500,
//         suffixIconColor:
//         myFocusNode.hasFocus ? AppColors.primaryBlue : AppColors.gray500,
//         suffixIcon: widget.ischange
//             ? InkWell(
//           onTap: () {
//             setState(() {
//               showPassword = !showPassword;
//             });
//           },
//           child: Padding(
//             padding: const EdgeInsets.all(11.0),
//             child: Text(
//               // AppTranslations.
//               "change",
//               // style: getUnderLine(
//               //     fontSize: 14.sp, color: AppColors.primary),
//             ),
//           ),
//         )
//             : widget.isPassword
//             ?
//         CustomInkWell( onTap: () {
//           setState(() {
//             showPassword = !showPassword;
//           });
//         },child:
//         Padding(
//           padding:  EdgeInsets.all(8.0.responsiveSize),
//           child: showPassword==true?SvgPicture.asset(AppIcons.eyeIconClosed):SvgPicture.asset(AppIcons.eyeIcon,),
//         ),)
//
//             : widget.suffixIcon,
//         contentPadding:
//         EdgeInsets.symmetric(horizontal: 15.responsiveWidth, vertical: widget.isTablet==true?40.responsiveHeight:18.responsiveHeight),
//         // errorStyle: getRegularStyle(color: AppColors.red),
//         enabledBorder: OutlineInputBorder(
//           borderSide: BorderSide(color: AppColors.gray02, width: .6.responsiveWidth),
//           borderRadius:
//           BorderRadius.all(Radius.circular(widget.borderRadius ?? 20.responsiveSize)),
//         ),
//         disabledBorder: OutlineInputBorder(
//           borderSide: BorderSide(color: AppColors.gray500, width:.6.responsiveWidth),
//           borderRadius:
//           BorderRadius.all(Radius.circular(widget.borderRadius ?? 20)),
//         ),
//         focusedBorder: OutlineInputBorder(
//           borderSide: BorderSide(color: AppColors.primaryBlue, width: .9.responsiveWidth),
//           borderRadius:
//           BorderRadius.all(Radius.circular(widget.borderRadius ?? 20.responsiveSize)),
//         ),
//         errorBorder: OutlineInputBorder(
//           borderSide: BorderSide(color: AppColors.red, width: 1.5.responsiveWidth),
//           borderRadius:
//           BorderRadius.all(Radius.circular(widget.borderRadius ?? 20.responsiveWidth)),
//         ),
//         focusedErrorBorder: OutlineInputBorder(
//           borderSide: BorderSide(color: AppColors.red, width: 1.5.responsiveWidth),
//           borderRadius:
//           BorderRadius.all(Radius.circular(widget.borderRadius ?? 20.responsiveWidth)),
//         ),
//       ),
//     ),
//   );
// }