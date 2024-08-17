import 'package:badges/badges.dart' as badge;
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import '../../../../gen/colors.gen.dart';

class NotificationButton extends StatelessWidget {
  final String svgAssetPath; // Path to your SVG asset
  final VoidCallback? onPressed;
  final bool showBadge;

  const NotificationButton({
    super.key,
    required this.svgAssetPath,
    this.onPressed,
    this.showBadge = false,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      shape: CircleBorder(
        side: BorderSide(
            color: AppColors.cE4E4E4, width: 2.sp), // Stroke color and width
      ),
      child: InkWell(
        borderRadius: BorderRadius.circular(50.sp),
        onTap: onPressed,
        splashColor: AppColors.cE4E4E4.withOpacity(0.3),
        child: Padding(
          padding: EdgeInsets.all(13.sp), // Padding inside the button
          child: badge.Badge(
            showBadge: showBadge,
            badgeStyle: const badge.BadgeStyle(badgeColor: AppColors.cFFB057),
            position: badge.BadgePosition.topEnd(top: 0, end: 0),
            child: SvgPicture.asset(svgAssetPath, width: 24.w, height: 24.h),
          ),
        ),
      ),
    );
  }
}
