// import 'package:audioplayers/audioplayers.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:flutter_svg/svg.dart';
// import 'package:tasesse_app/config/extensions/color_extension.dart';
// import 'package:tasesse_app/config/resources/app_colors.dart';
// import 'package:tasesse_app/config/resources/app_strings.dart';
// import 'package:tasesse_app/config/resources/app_text_style.dart';
// import 'package:tasesse_app/config/resources/app_values.dart';
// import 'package:tasesse_app/config/responsive/responsive_extensions.dart';
// import 'package:tasesse_app/core/api/end_points.dart';
// import 'package:tasesse_app/core/shared_widget/button_widget.dart';
// import 'package:tasesse_app/core/shared_widget/cached_network_image.dart';
// import 'package:tasesse_app/features/child_flow/questions/questions/presentation/questions_widgets/audio_widget/audio_widget.dart';
// import 'package:tasesse_app/features/child_flow/questions/questions/presentation/questions_widgets/video_widget/video.dart';
// import 'package:tasesse_app/my_app/app_reference.dart';
// import '../../../config/resources/app_assets.dart';
// import '../../../config/storages/keys.dart';
// import '../../../features/child_flow/questions/questions/questions.dart';
// import '../../enum/enum_generation.dart';
// import '../custom_inkwell.dart';
//
// showHintOfQuestionsDialog({
//   required BuildContext context,
//   required String? descriptionText,
//   String? descriptionType,
//   String? descriptionFile,
// }) {
//   showDialog(
//     context: context,
//     builder: (context) => HintOfQuestionsDialog(
//       descriptionText: descriptionText,
//       descriptionType: descriptionType,
//       descriptionFile: descriptionFile,
//     ),
//   );
// }
//
// class HintOfQuestionsDialog extends StatelessWidget {
//   final String? descriptionType;
//   final String? descriptionFile;
//   final String? descriptionText;
//
//   const HintOfQuestionsDialog({
//     super.key,
//     this.descriptionText,
//     this.descriptionType,
//     this.descriptionFile,
//   });
//
//   @override
//   Widget build(BuildContext context) {
//     return AlertDialog(
//       scrollable: true,
//       insetPadding: EdgeInsets.zero,
//       contentPadding: EdgeInsets.zero,
//       shape:  RoundedRectangleBorder(
//         borderRadius:BorderRadius.all(Radius.circular(
//             AppPadding.p20.responsiveSize),
//     ),),
//       content: Container(
//         width: AppReference.deviceWidth(context) * 0.8,
//         padding: EdgeInsets.all(AppPadding.p10.responsiveSize),
//         decoration: BoxDecoration(
//           color: AppColors.primary2,
//           border: Border.all(
//             color: AppColors.primaryColorBlue,
//             width: 3.responsiveSize,
//           ),
//           borderRadius:
//               BorderRadius.all(Radius.circular(AppPadding.p20.responsiveSize)),
//         ),
//         child: SingleChildScrollView(
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.spaceAround,
//             children: [
//               SizedBox(
//                 height: AppReference.deviceHeight(context) *
//                     0.08.responsiveHeightRatio,
//                 child: Column(
//                   children: [
//                     Text(
//                       AppStrings.hintOfQuestion,
//                       style: const AppTextStyle().quranFont.bodyLarge16,
//                     ),
//                     Divider(
//                       color: AppColors.primary2,
//                       thickness: 5.responsiveSize,
//                       endIndent: 20,
//                       indent: 20,
//                     ),
//                   ],
//                 ),
//               ),
//               if(descriptionText!=null)...[
//                 Text(
//                   '$descriptionText',
//                   style: const AppTextStyle().quranFont.bodyLarge16,
//                   textAlign: TextAlign.justify,
//                 ),
//                 AppSize.s10.sizedBoxHeight,
//               ],
//
//               HintBuilderWithType(
//                 descriptionFile: descriptionFile,
//                 descriptionType: descriptionType,
//               ),
//               AppSize.s10.sizedBoxHeight,
//
//               DefaultButtonWidget(
//                 label: "فهمت",
//                 onPressed: () {
//                   Navigator.pop(context);
//                 },
//                 buttonColor: AppColors.primaryColorOrange,
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
//
// }
//
// class HintBuilderWithType extends StatelessWidget {
//   final String? descriptionFile;
//   final String? descriptionType;
//
//   const HintBuilderWithType(
//       {super.key,
//       required this.descriptionFile,
//       required this.descriptionType});
//
//   @override
//   Widget build(BuildContext context) {
//     if (descriptionFile == null ||
//         descriptionFile!.isEmpty ||
//         descriptionFile == '') {
//       return const SizedBox.shrink();
//     } else {
//       return switch (descriptionType) {
//         AppKeys.audioKey => SizedBox(
//             height: 45.responsiveHeight,
//             width: AppReference.deviceWidth(context) * 0.64,
//             child: AudioPlayerWidget(
//               source: '${EndPoints.baseUrl}${descriptionFile!}',
//               isAnswerAudio: false,
//             ),
//           ),
//         AppKeys.imageKey => BaseCachedNetworkImage(
//             height: AppReference.deviceHeight(context) * 0.25.responsiveHeightRatio,
//             width: AppReference.deviceWidth(context) * 0.64,
//             imgUrl: '${EndPoints.baseUrl}${descriptionFile!}',
//             fit: BoxFit.contain,
//           ),
//         AppKeys.videoKey => SizedBox(
//           height: AppReference.deviceHeight(context) * 0.25.responsiveHeightRatio,
//             width: AppReference.deviceWidth(context) * 0.64,
//             child: VideoWidget(
//               source:'${EndPoints.baseUrl}${descriptionFile!}',
//               reachedTheEnd: () {},
//               isAnswerVideo: true,
//             ),
//           ),
//         _ => const SizedBox.shrink(),
//       };
//     }
//   }
// }
//
//
// showHintOfQuestionsForLessonsAndGroupsDialog({
//   required BuildContext context,
//   required String? descriptionText,
//   required QuestionEntity question,
//   required QuestionsBloc questionBloc,
//   String? descriptionType,
//   String? descriptionFile,
// }) {
//   showDialog(
//     context: context,
//     builder: (context) => BlocProvider.value(
//   value:questionBloc,
//   child: HintOfQuestionsForLessonsAndGroupsDialog(
//         descriptionText: descriptionText,
//         descriptionType: descriptionType,
//         descriptionFile: descriptionFile,
//         currentQuestion: question,
//       ),
// ),
//   );
// }
//
// class HintOfQuestionsForLessonsAndGroupsDialog extends StatefulWidget {
//   final String? descriptionType;
//   final String? descriptionFile;
//   final String? descriptionText;
//   final QuestionEntity currentQuestion;
//
//   const HintOfQuestionsForLessonsAndGroupsDialog({
//     super.key,
//     this.descriptionText,
//     this.descriptionType,
//     this.descriptionFile,
//     required this.currentQuestion,
//   });
//
//   @override
//   State<HintOfQuestionsForLessonsAndGroupsDialog> createState() => _HintOfQuestionsForLessonsAndGroupsDialogState();
// }
//
// class _HintOfQuestionsForLessonsAndGroupsDialogState extends State<HintOfQuestionsForLessonsAndGroupsDialog> {
//   final AudioPlayer _audioPlayer = AudioPlayer();
//   @override
//   void dispose() {
//     _audioPlayer.dispose();
//     super.dispose();
//   }
//   @override
//   Widget build(BuildContext context) {
//     return AlertDialog(
//       scrollable: true,
//       insetPadding: EdgeInsets.zero,
//       contentPadding: EdgeInsets.zero,
//       shape:  RoundedRectangleBorder(
//         borderRadius:BorderRadius.all(Radius.circular(
//             AppPadding.p20.responsiveSize),
//         ),),
//       content: Container(
//         width: AppReference.deviceWidth(context) * 0.8,
//         padding: EdgeInsets.all(AppPadding.p10.responsiveSize),
//         decoration: BoxDecoration(
//           color: AppColors.primary2,
//           border: Border.all(
//             color: AppColors.primaryColorBlue,
//             width: 3.responsiveSize,
//           ),
//           borderRadius:
//           BorderRadius.all(Radius.circular(AppPadding.p20.responsiveSize)),
//         ),
//         child: SingleChildScrollView(
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.spaceAround,
//             children: [
//               SizedBox(
//                 height: AppReference.deviceHeight(context) *
//                     0.06.responsiveHeightRatio,
//                 child: Column(
//                   children: [
//                     Text(
//                       AppStrings.hintOfQuestion,
//                       style: const AppTextStyle().w800.quranFont.titleLarge22,
//                     ),
//                     Divider(
//                       color: AppColors.textColor6,
//                       thickness: 5.responsiveSize,
//                       endIndent: 20,
//                       indent: 20,
//                     ),
//                   ],
//                 ),
//               ),
//               BlocConsumer<QuestionsBloc, QuestionsState>(
//                 listener: (context, state) {
//                   if(state.textConvertDescState == RequestStates.loaded) {
//                     _audioPlayer.play(UrlSource("${EndPoints.baseUrl}${state.textConvertMessage}"));
//                   }
//                 },
//                 builder: (context, state) {
//                   return CustomInkWell(
//                     onTap: (){
//
//                       if (context.read<QuestionsBloc>().state.currentQuestion!.descriptionFileApi == null) {
//                         "${widget.currentQuestion.descriptionFileApi}".log();
//                         context.read<QuestionsBloc>().add(
//                           TextConvertEvent(
//                             parameters: TextConvertParameters(
//                               questionId: widget.currentQuestion.id,
//                               type: TextConverterType.description.name,
//                             ),
//                           ),
//                         );
//                       } else {
//                         context.read<QuestionsBloc>().state.currentQuestion == null?
//                         _audioPlayer.play(UrlSource("${EndPoints.baseUrl}${widget.currentQuestion.descriptionFileApi}")):
//                         _audioPlayer.play(UrlSource("${EndPoints.baseUrl}${context.read<QuestionsBloc>().state.currentQuestion?.descriptionFileApi}"));
//                       }
//                     },
//                     child: Row(
//                       children: [
//                         state.textConvertDescState == RequestStates.loading?
//                         Center(child: CircularProgressIndicator()):
//                         SvgPicture.asset(AppImagesAssets.sSpeaker,),
//                         AppSize.s4.sizedBoxWidth,
//                         Text(
//                           "سماع الشرح",
//                           style: const AppTextStyle().blue.w700.bodyMedium14.copyWith(
//                             fontFamily: 'NewFont',
//                           ),)
//                       ],
//                     ),
//                   );
//                 },
//               ),
//
//               if(widget.descriptionText!=null)...[
//                 Text(
//                   '${widget.descriptionText}',
//                   style: const AppTextStyle().quranFont.bodyLarge16,
//                   textAlign: TextAlign.justify,
//                 ),
//                 AppSize.s10.sizedBoxHeight,
//               ],
//
//               HintBuilderWithType(
//                 descriptionFile: widget.descriptionFile,
//                 descriptionType: widget.descriptionType,
//               ),
//               AppSize.s10.sizedBoxHeight,
//
//               DefaultButtonWidget(
//                 label: "فهمت",
//                 onPressed: () {
//                   Navigator.pop(context);
//                 },
//                 buttonColor: AppColors.primaryColorOrange,
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }