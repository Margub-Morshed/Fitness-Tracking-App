import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import '../../../../core/constants/text_font_style.dart';
import '../../../../core/helpers/ui_helpers.dart';
import '../../../../gen/assets.gen.dart';
import '../../../../gen/colors.gen.dart';
import '../../../home/presentation/widgets/dot_divider.dart';
import 'edit_small_button.dart';
import 'info_data.dart';
import 'label_count_tspan.dart';

Row buildSingleWorkProgressCard(
    {required final String iconPath,
    required final String count,
    required final String label}) {
  return Row(
    children: [
      SvgPicture.asset(iconPath, height: 24.h, width: 24.w),
      UIHelper.horizontalSpace(2.w),
      LabelCountTSpan(count: count, label: label)
    ],
  );
}

Row buildHeader() {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    crossAxisAlignment: CrossAxisAlignment.center, // Center align vertically
    children: [
      // Left Portion (Circular Profile Image & Greeting's with Today's Date)
      Row(
        crossAxisAlignment:
            CrossAxisAlignment.center, // Align items in the center vertically
        children: [
          CircleAvatar(
            radius: 38.r, // Adjust the size as needed
            backgroundImage: AssetImage(
              Assets.images.defaultProfilePic.path,
            ), // Default image
          ),
          UIHelper.horizontalSpaceSmall,

          // Name - Joining Date - Basic Info (Height - Weight - Age)
          buildInfoDataPanel(),
        ],
      ),
      const EditSmallButton(),
    ],
  );
}

Column buildInfoDataPanel() {
  return Column(
    mainAxisSize: MainAxisSize.min,
    crossAxisAlignment: CrossAxisAlignment.start,
    mainAxisAlignment:
        MainAxisAlignment.center, // Align the entire column to the center
    children: [
      // Greeting's
      Text(
        'Johan Smith',
        style: TextFontStyle.headline18SemiBoldMontserrat.copyWith(
          height: 1.2, // Adjust the line height for better spacing
          letterSpacing: 0.09,
        ),
      ),
      UIHelper.verticalSpace4,

      // Date
      Text(
        'joined 15-06-2024',
        textAlign: TextAlign.left,
        style: TextFontStyle.headline12MediumMontserrat
            .copyWith(color: AppColors.c494949, height: 1.2),
      ),
      UIHelper.verticalSpace6,

      // Basic Information's
      Row(
        children: [
          // Height - Meter
          const InfoData(prefix: '180 ', postfix: 'm'),

          // Dot
          UIHelper.horizontalSpace6,
          const DotDivider(),
          UIHelper.horizontalSpace6,

          // Weight - Kg
          const InfoData(prefix: '82 ', postfix: 'kg'),

          // Dot
          UIHelper.horizontalSpace6,
          const DotDivider(),
          UIHelper.horizontalSpace6,

          // Age - Years
          const InfoData(prefix: '30 ', postfix: 'yrs'),
        ],
      )
    ],
  );
}

Text buildCompletionStatusText() {
  return Text.rich(
    TextSpan(
      children: [
        TextSpan(
          text: 'You’ve completed',
          style: TextFontStyle.headline14RegularMontserrat
              .copyWith(color: AppColors.c494949),
        ),
        TextSpan(
          text: ' 3',
          style: TextFontStyle.headline20SemiBoldMontserrat,
        ),
        TextSpan(
          text: ' out of',
          style: TextFontStyle.headline14RegularMontserrat
              .copyWith(color: AppColors.c494949),
        ),
        TextSpan(
          text: ' 7',
          style: TextFontStyle.headline14SemiBoldMontserrat,
        ),
        TextSpan(
          text: ' daily goals.',
          style: TextFontStyle.headline14RegularMontserrat
              .copyWith(color: AppColors.c494949),
        ),
      ],
    ),
  );
}
