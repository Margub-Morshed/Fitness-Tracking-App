import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/constants/text_font_style.dart';
import '../../../../gen/colors.gen.dart';

class EditSmallButton extends StatelessWidget {
  final VoidCallback? onPressed;

  const EditSmallButton({super.key, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.cF97316,
        disabledBackgroundColor: AppColors.cF97316,
        minimumSize: Size(53.w, 32.h), // Minimum size to match the container
        padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 8.h),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.r), // Border radius
        ),
        elevation: 4, // Elevation to match the blur radius of the shadow
        shadowColor: const Color(0x28000000), // Shadow color
      ),
      child: Text('Edit',
          style: TextFontStyle.headline14SemiBoldMontserrat
              .copyWith(color: AppColors.cFFFFFF)),
    );
  }
}
