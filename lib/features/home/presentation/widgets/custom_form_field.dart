// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../core/constants/text_font_style.dart';
import '../../../../gen/assets.gen.dart';
import '../../../../gen/colors.gen.dart';

final class CustomFormField extends StatelessWidget {
  String? hintText;
  final String? labelText;
  TextEditingController? textEditingController;
  final TextInputType inputType;
  double? fieldHeight;
  int? maxline;
  final String? Function(String?)? validator;
  bool? validation;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  bool isObsecure;
  bool isPass;
  FocusNode? focusNode;
  TextInputAction? textInputAction;
  Function(String)? onFieldSubmitted;
  Function(String)? onChanged;
  List<TextInputFormatter>? inputFormatters;
  final TextStyle? labelStyle;
  final TextStyle? style;
  final bool? isEnabled;
  final bool readOnly;
  final double? cursorHeight;
  final ValueNotifier<bool> isSearchClearEnabled;

  CustomFormField({
    super.key,
    this.hintText,
    this.labelText,
    this.textEditingController,
    this.inputType = TextInputType.text,
    this.fieldHeight,
    this.maxline,
    this.validator,
    this.validation = false,
    this.suffixIcon,
    this.prefixIcon,
    this.isObsecure = false,
    this.isPass = false,
    this.readOnly = false,
    this.focusNode,
    this.textInputAction = TextInputAction.done,
    this.onFieldSubmitted,
    this.onChanged,
    this.inputFormatters,
    this.labelStyle,
    this.isEnabled,
    this.style,
    this.cursorHeight,
    required this.isSearchClearEnabled,
  });

  @override
  Widget build(BuildContext context) {
    final double borderRadius = 36.r;
    final double borderWidth = 1.5.sp;

    return TextFormField(
      cursorHeight: cursorHeight ?? 20.h,
      cursorColor: AppColors.c667085,
      focusNode: focusNode,
      obscureText: isPass ? isObsecure : false,
      textInputAction: textInputAction,
      autovalidateMode:
          validation! ? AutovalidateMode.always : AutovalidateMode.disabled,
      validator: validator,
      maxLines: maxline ?? 1,
      controller: textEditingController,
      onFieldSubmitted: onFieldSubmitted ??
          (value) {
            // Collapse the keyboard
            FocusScope.of(context).unfocus();

            // Set isSearchClearEnabled to false when search is submitted
            isSearchClearEnabled.value = false;
          },
      readOnly: readOnly,
      onChanged: onChanged,
      inputFormatters: inputFormatters,
      enabled: isEnabled,
      decoration: InputDecoration(
        prefixIcon: prefixIcon ??
            Container(
                padding: EdgeInsets.only(left: 10.w),
                margin: EdgeInsets.all(12.sp), // Adjust padding as needed
                child: SvgPicture.asset(Assets.icons.search)),
        suffixIcon: suffixIcon ??
            ValueListenableBuilder(
              valueListenable: isSearchClearEnabled,
              builder: (context, value, child) {
                return value
                    ? Container(
                        padding: EdgeInsets.only(right: 10.w),
                        child: GestureDetector(
                          onTap: () {
                            // Clear the text in the search controller
                            textEditingController!.clear();
                            isSearchClearEnabled.value = false;

                            // Collapse the keyboard and unfocus the cursor
                            FocusScope.of(context).unfocus();
                            FocusScope.of(context).nextFocus();
                            // KeyboardUti
                          },
                          child: Container(
                            margin: EdgeInsets.all(
                                7.sp), // Adjust padding as needed
                            decoration: const BoxDecoration(
                                shape: BoxShape.circle,
                                color: AppColors.cD0D5DD),
                            child: Icon(Icons.clear,
                                color: AppColors.c667085, size: 20.sp),
                          ),
                        ),
                      )
                    : const SizedBox.shrink();
              },
            ),
        contentPadding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 28.w),
        hintText: hintText,
        hintStyle: TextFontStyle.headline16RegularMontserrat
            .copyWith(color: AppColors.c667085),
        labelText: labelText,
        labelStyle: labelStyle ??
            TextFontStyle.headline16RegularMontserrat
                .copyWith(color: AppColors.c667085),
        errorStyle: TextFontStyle.headline10RegularMontserrat
            .copyWith(color: Colors.red),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(borderRadius),
          borderSide: BorderSide(color: AppColors.cD0D5DD, width: borderWidth),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(borderRadius),
          borderSide: BorderSide(color: AppColors.cD0D5DD, width: borderWidth),
        ),
        disabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(borderRadius),
          borderSide: BorderSide(color: AppColors.cD0D5DD, width: borderWidth),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(borderRadius),
          borderSide: BorderSide(color: Colors.red, width: borderWidth),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(borderRadius),
          borderSide: BorderSide(color: AppColors.cD0D5DD, width: borderWidth),
        ),
      ),
      style: style ??
          TextStyle(
            fontSize: 14.sp,
            fontWeight: FontWeight.w400,
            color: AppColors.c667085,
          ),
      keyboardType: inputType,
    );
  }
}
