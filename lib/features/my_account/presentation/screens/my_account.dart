import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/constants/text_font_style.dart';
import '../../../../core/helpers/ui_helpers.dart';
import '../../../../core/widgets/custom_appbar.dart';
import '../../../../gen/assets.gen.dart';
import '../widgets/info_row.dart';
import '../widgets/my_account.dart';
import '../widgets/other_card.dart';

class MyAccountScreen extends StatelessWidget {
  const MyAccountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: const CustomAppBar(title: 'Profile', isBackNeeded: true),
        body: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          padding: EdgeInsets.all(UIHelper.kDefaultPadding()),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              buildHeader(),
              UIHelper.verticalSpaceSmall,
              UIHelper.verticalSpace(14.h),

              // Week's Progress Panel
              Text(
                'This Week’s progress',
                style: TextFontStyle.headline16SemiBoldMontserrat,
              ),
              UIHelper.verticalSpaceMedium,
              Row(
                children: [
                  buildSingleWorkProgressCard(
                    iconPath: Assets.icons.steps,
                    count: '67,525',
                    label: 'steps',
                  ),
                  UIHelper.horizontalSpace(12.w),
                  buildSingleWorkProgressCard(
                    iconPath: Assets.icons.calories,
                    count: '6,730.5',
                    label: 'cal',
                  ),
                  UIHelper.horizontalSpace(12.w),
                  buildSingleWorkProgressCard(
                    iconPath: Assets.icons.distance,
                    count: '50.2',
                    label: 'mi',
                  ),
                ],
              ),
              UIHelper.verticalSpaceMedium,
              buildCompletionStatusText(),
              UIHelper.verticalSpaceSemiLarge,

              // Goal Setting Panel
              Text(
                'Your Goal setting',
                style: TextFontStyle.headline16SemiBoldMontserrat,
              ),
              UIHelper.verticalSpace(14.h),
              UIHelper.verticalSpaceSmall,
              InfoRow(
                iconPath: Assets.icons.calories,
                title: 'Calories to burn',
                count: '2,000',
                unit: 'cal',
                duration: '5 days',
              ),
              UIHelper.verticalSpace(14.h),
              UIHelper.verticalSpaceSmall,
              InfoRow(
                iconPath: Assets.icons.steps,
                title: 'Steps to cover',
                count: '20,000',
                unit: 'steps',
                duration: 'Daily',
              ),
              UIHelper.verticalSpaceSemiLarge,

              // Sleep Cycle Panel
              Text(
                'Your sleep cycle',
                style: TextFontStyle.headline16SemiBoldMontserrat,
              ),
              UIHelper.verticalSpace(14.h),
              UIHelper.verticalSpaceSmall,
              InfoRow(
                iconPath: Assets.icons.sleep,
                title: 'Bed time',
                count: '10.00',
                unit: 'PM',
                duration: 'Daily',
              ),
              UIHelper.verticalSpace(14.h),
              UIHelper.verticalSpaceSmall,
              InfoRow(
                iconPath: Assets.icons.wakeUp,
                title: 'Wake-up time',
                count: '6.00',
                unit: 'AM',
                duration: '5 days',
              ),
              UIHelper.verticalSpaceSemiLarge,

              // Other's Panel
              Text(
                'Others',
                style: TextFontStyle.headline16SemiBoldMontserrat,
              ),
              UIHelper.verticalSpace(14.h),
              OtherCard(
                  prefixIconPath: Assets.icons.person, label: 'My Account'),
              OtherCard(
                  prefixIconPath: Assets.icons.alert, label: 'Notification'),
              OtherCard(
                  prefixIconPath: Assets.icons.document,
                  label: 'Privacy Policy'),
              OtherCard(prefixIconPath: Assets.icons.signOut, label: 'Log out'),
            ],
          ),
        ),
      ),
    );
  }
}
