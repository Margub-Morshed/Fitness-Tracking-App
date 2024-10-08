// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:fitness_tracking_app/core/helpers/ui_helpers.dart';
import 'package:fitness_tracking_app/features/home/data/models/activities_list.dart';
import 'package:fitness_tracking_app/features/home/presentation/widgets/carousel_with_indicators.dart';
import 'package:fitness_tracking_app/features/home/presentation/widgets/health_dashboard.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../widgets/custom_form_field.dart';
import '../widgets/goal_card.dart';
import '../widgets/home.dart';
import '../widgets/progress_card.dart';
import '../widgets/section_header.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final ValueNotifier<int> _currentIndexNotifier = ValueNotifier<int>(0);
  final TextEditingController _searchController = TextEditingController();
  ValueNotifier<bool> isSearchClearEnabled = ValueNotifier<bool>(false);

  @override
  void initState() {
    _searchController.addListener(() {
      isSearchClearEnabled.value = _searchController.text.isNotEmpty;
    });
    super.initState();
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          padding: EdgeInsets.all(UIHelper.kDefaultPadding()),
          child: Column(
            children: [
              buildHeader(),
              UIHelper.verticalSpace16,

              // Search Field
              CustomFormField(
                hintText: 'Search',
                textEditingController: _searchController,
                isSearchClearEnabled: isSearchClearEnabled,
              ),
              UIHelper.verticalSpaceSmall,
              UIHelper.verticalSpaceMedium,

              const SectionHeader(title: 'Your Statistics'),
              UIHelper.verticalSpace(14.h),

              ProgressCard(
                title: 'In-Progress',
                progressPercentage: 56,
                progressWidth: (MediaQuery.of(context).size.width -
                        (UIHelper.kDefaultPadding() * 2)) *
                    0.45,
                caloriesBurned: '1,116.5',
                caloriesGoal: '2,000',
              ),
              UIHelper.verticalSpaceMediumLarge,

              const HealthDashboard(),
              UIHelper.verticalSpaceMediumLarge,

              const SectionHeader(title: 'Daily Activities'),
              UIHelper.verticalSpace(14.h),

              CarouselWithIndicators(
                activities: ActivitiesListModel.activities,
                currentIndexNotifier: _currentIndexNotifier,
              ),
              UIHelper.verticalSpace(14.h),
              UIHelper.verticalSpace16,

              const SectionHeader(title: 'Goals', option: 'View All'),
              UIHelper.verticalSpace(8.h),

              const GoalCard(
                title: 'ABS & Stretch',
                dateTime: 'Saturday, April 14 | 08:00 AM',
                duration: '30 Min/day',
              ),
              const GoalCard(
                title: 'Push Up',
                dateTime: 'Sunday, April 15 | 08:00 AM',
                duration: '50 Sets/day',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
