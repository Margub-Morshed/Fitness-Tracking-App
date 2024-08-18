// ignore_for_file: unused_field, deprecated_member_use
import 'package:fitness_tracking_app/features/daily_activity/presentation/screens/daily_activity.dart';
import 'package:fitness_tracking_app/features/my_account/presentation/screens/my_account.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import '/gen/assets.gen.dart';
import 'core/constants/text_font_style.dart';
import 'core/helpers/helper_methods.dart';
import 'features/home/presentation/screens/home.dart';
import 'gen/colors.gen.dart';
import 'package:custom_navigation_bar/custom_navigation_bar.dart';

final class NavigationScreen extends StatefulWidget {
  final Widget? pageNum;
  const NavigationScreen({super.key, this.pageNum});

  @override
  State<NavigationScreen> createState() => _NavigationScreenState();
}

class _NavigationScreenState extends State<NavigationScreen> {
  // Variable for navigation Index
  int _currentIndex = 0;

  // Variable for navigation Color Index
  int _colorIndex = 0;

  final bool _isFisrtBuild = true;
  bool _navigationOn = true;

  late final List<Widget> _screens = [
    const HomeScreen(),
    const DailyActivityScreen(),
    const HomeScreen(),
    const MyAccountScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    Object? args;
    StatefulWidget? screenPage;
    if (_isFisrtBuild) {
      args = ModalRoute.of(context)!.settings.arguments;
    }

    if (args != null) {
      _colorIndex = 5;
      screenPage = args as StatefulWidget;
      var newColorindex = -1;

      for (var element in _screens) {
        newColorindex++;
        if (element.toString() == screenPage.toString()) {
          _colorIndex = newColorindex;
          _currentIndex = newColorindex;
          break;
        }
      }
    }

    return PopScope(
      canPop: false,
      onPopInvoked: (bool didPop) async {
        showExitConfirmationDialog(context);
      },
      child: Scaffold(
        backgroundColor: Colors.white,
        extendBody: true,
        onDrawerChanged: (isOpened) => setState(() {
          _navigationOn = !isOpened;
        }),
        body: Center(
            child: (screenPage != null)
                ? screenPage
                : _screens.elementAt(_currentIndex)),
        bottomNavigationBar: CustomNavigationBar(
          iconSize: 30.r,
          selectedColor: AppColors.cF97316,
          strokeColor: AppColors.cF97316,
          unSelectedColor: AppColors.c667085,
          backgroundColor: Colors.white,
          items: [
            CustomNavigationBarItem(
              icon: SvgPicture.asset(
                Assets.icons.home,
                color: (_currentIndex == 0)
                    ? AppColors.cF97316
                    : AppColors.c667085,
              ),
              title: Text("Home ",
                  style: TextFontStyle.headline12SemiBoldOverpass.copyWith(
                    height: 1.7.h,
                    color: (_currentIndex == 0)
                        ? AppColors.cF97316
                        : AppColors.c667085,
                  )),
            ),
            CustomNavigationBarItem(
              icon: SvgPicture.asset(
                Assets.icons.activity,
                color: (_currentIndex == 1)
                    ? AppColors.cF97316
                    : AppColors.c667085,
              ),
              title: Text(
                "Search ",
                style: TextFontStyle.headline12SemiBoldOverpass.copyWith(
                  height: 1.7.h,
                  color: (_currentIndex == 1)
                      ? AppColors.cF97316
                      : AppColors.c667085,
                ),
              ),
            ),
            CustomNavigationBarItem(
              icon: SvgPicture.asset(
                Assets.icons.chart,
                color: (_currentIndex == 2)
                    ? AppColors.cF97316
                    : AppColors.c667085,
              ),
              title: Text(
                "Statistics ",
                style: TextFontStyle.headline12SemiBoldOverpass.copyWith(
                  height: 1.7.h,
                  color: (_currentIndex == 2)
                      ? AppColors.cF97316
                      : AppColors.c667085,
                ),
              ),
            ),
            CustomNavigationBarItem(
              icon: SvgPicture.asset(
                Assets.icons.profile,
                color: (_currentIndex == 3)
                    ? AppColors.cF97316
                    : AppColors.c667085,
              ),
              title: Text(
                "Profile ",
                style: TextFontStyle.headline12SemiBoldOverpass.copyWith(
                  height: 1.7.h,
                  color: (_currentIndex == 3)
                      ? AppColors.cF97316
                      : AppColors.c667085,
                ),
              ),
            ),
          ],
          currentIndex: _currentIndex,
          onTap: (index) {
            setState(() {
              _currentIndex = index;
            });
          },
        ),
      ),
    );
  }
}
