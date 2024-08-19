import 'package:fitness_tracking_app/core/helpers/ui_helpers.dart';
import 'package:fitness_tracking_app/gen/assets.gen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import '../../gen/colors.gen.dart';
import '../constants/text_font_style.dart';
import '../helpers/navigation_service.dart';

@immutable
class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final List<Widget>? action;
  final bool isBackNeeded;
  final bool centerTitle;
  final bool showNotification;
  final VoidCallback? onTap;
  final VoidCallback? onPop;
  final Color? bgColor;
  final Color? popIconColor;
  final TextStyle? textFontStyle;

  const CustomAppBar({
    this.title = "",
    this.action,
    this.isBackNeeded = false,
    super.key,
    this.onTap,
    this.centerTitle = false,
    this.showNotification = false,
    this.onPop,
    this.bgColor,
    this.popIconColor,
    this.textFontStyle,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: centerTitle,
      backgroundColor: bgColor ?? Colors.transparent,
      elevation: 0,
      automaticallyImplyLeading: isBackNeeded,
      title: Text(
        title,
        style: textFontStyle ?? TextFontStyle.headline20SemiBoldMontserrat,
        textAlign: TextAlign.left,
      ),
      leading: isBackNeeded
          ? GestureDetector(
              onTap: onPop ??
                  () {
                    NavigationService.goBack;
                  },
              child: Icon(Icons.arrow_back_ios,
                  color: popIconColor ?? AppColors.c000B23, size: 24.sp),
            )
          : null,
      actions: action ??
          [
            // Notification
            showNotification
                ? Padding(
                    padding: EdgeInsets.only(right: UIHelper.kDefaultPadding()),
                    child: SvgPicture.asset(Assets.icons.notification,
                        height: 24.h, width: 24.w),
                  )
                : const SizedBox.shrink(),
          ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
