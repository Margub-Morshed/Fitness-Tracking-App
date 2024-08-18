import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import '../../../../core/constants/text_font_style.dart';
import '../../../../core/helpers/ui_helpers.dart';

class OtherCard extends StatelessWidget {
  final String prefixIconPath;
  final String label;

  const OtherCard({
    super.key,
    required this.prefixIconPath,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 16.h),
      child: Row(
        children: [
          SvgPicture.asset(prefixIconPath),
          UIHelper.horizontalSpace(16.w),
          Text(label, style: TextFontStyle.headline16MediumMontserrat),
        ],
      ),
    );
  }
}
