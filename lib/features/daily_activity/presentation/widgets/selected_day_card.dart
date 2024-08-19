import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import '../../../../core/constants/text_font_style.dart';
import '../../../../gen/colors.gen.dart';
import '../../providers/date.dart';

class SelectDayCard extends StatefulWidget {
  const SelectDayCard({super.key});

  @override
  State<SelectDayCard> createState() => _SelectDayCardState();
}

class _SelectDayCardState extends State<SelectDayCard> {
  late ScrollController _scrollController;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final dateProvider = Provider.of<DateProvider>(context, listen: false);
      dateProvider.setSelectedDate(DateTime.now());
      _scrollToSelectedDate();
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void _scrollToSelectedDate() {
    final dateProvider = Provider.of<DateProvider>(context, listen: false);
    final selectedDateIndex =
        dateProvider.selectedDate.difference(DateTime.now()).inDays +
            7; // Calculate index based on selected date

    const itemCount = 15; // Total items (7 days before + today + 7 days after)

    // Ensure the index is within bounds
    if (selectedDateIndex >= 0 && selectedDateIndex < itemCount) {
      _scrollController.animateTo(
        selectedDateIndex * 35.5, // Assuming each item is 35.5 pixels wide
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeInOut,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<DateProvider>(
      builder: (context, dateProvider, child) {
        return SizedBox(
          // padding: EdgeInsets.all(12.r),

          // // Outer Shell Decoration
          // decoration: ShapeDecoration(
          //   color: AppColors.cFFFFFF,
          //   shape: RoundedRectangleBorder(
          //     borderRadius: BorderRadius.circular(10.r),
          //   ),

          // // Outer Shell Border
          // shadows: [
          //   BoxShadow(
          //     color: const Color(0x28000000),
          //     blurRadius: 2.r,
          //     offset: const Offset(0, 0),
          //     spreadRadius: 0,
          //   )
          // ],
          // ),
          child: SizedBox(
            height: 80.h,
            child: ListView.builder(
                controller: _scrollController,
                scrollDirection: Axis.horizontal,
                itemCount: 15, // 7 days before + today + 7 days after
                itemBuilder: (context, index) {
                  DateTime date =
                      DateTime.now().subtract(Duration(days: 7 - index));
                  String dayName = DateFormat('EEE')
                      .format(date); // Format day in English (Mon, Tue, etc.)
                  String formattedDate = DateFormat('d')
                      .format(date); // Format date in English (e.g., 03)

                  bool isSelected = date.day == dateProvider.selectedDate.day &&
                      date.month == dateProvider.selectedDate.month &&
                      date.year == dateProvider.selectedDate.year;

                  return GestureDetector(
                    onTap: () {
                      dateProvider.setSelectedDate(date);
                    },
                    child: Padding(
                      padding: EdgeInsets.only(right: 5.sp, left: 5.sp),
                      child: Container(
                        alignment: Alignment.center,
                        width: 45.w,
                        height: 65.h,
                        decoration: ShapeDecoration(
                          color: isSelected
                              ? AppColors.cF97316
                              : AppColors.cFFFFFF,
                          shape: RoundedRectangleBorder(
                            side: BorderSide(
                                width: 2.w, color: AppColors.cE4E4E4),
                            borderRadius: BorderRadius.circular(16.r),
                          ),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              dayName,
                              style: TextFontStyle.headline10RegularMontserrat
                                  .copyWith(
                                color: isSelected
                                    ? AppColors.cFFFFFF
                                    : AppColors.cF97316,
                              ),
                            ),
                            Text(
                              formattedDate,
                              style: TextFontStyle.headline14SemiBoldMontserrat
                                  .copyWith(
                                color: isSelected
                                    ? AppColors.cFFFFFF
                                    : AppColors.cF97316,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                }),
          ),
        );
      },
    );
  }
}
