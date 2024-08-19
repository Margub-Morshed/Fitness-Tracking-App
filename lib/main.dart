import 'package:fitness_tracking_app/features/daily_activity/providers/date.dart';
import 'package:fitness_tracking_app/gen/colors.gen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'core/helpers/all_routes.dart';
import 'core/helpers/helper_methods.dart';
import 'core/helpers/navigation_service.dart';
import 'loading_screen.dart';
import 'package:intl/date_symbol_data_local.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initializeDateFormatting('en');
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    rotation();
    setInitValue();
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (didPop, result) {
        showExitConfirmationDialog(context);
      },
      child: LayoutBuilder(
        builder: (context, constraints) {
          return const UtillScreenMobile();
        },
      ),
    );
  }
}

class UtillScreenMobile extends StatelessWidget {
  const UtillScreenMobile({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (_, child) {
        return MultiProvider(
          providers: [
            ChangeNotifierProvider(create: (context) => DateProvider()),
          ],
          child: PopScope(
            canPop: false,
            onPopInvokedWithResult: (didPop, result) {
              showExitConfirmationDialog(context);
            },
            child: GetMaterialApp(
              debugShowCheckedModeBanner: false,
              title: 'Fitness Tracking App',
              theme: ThemeData(
                scaffoldBackgroundColor: AppColors.cFFFFFF,
                primaryColor: AppColors.cF97316,
                useMaterial3: false,
              ),
              builder: (context, widget) {
                return MediaQuery(data: MediaQuery.of(context), child: widget!);
              },
              navigatorKey: NavigationService.navigatorKey,
              onGenerateRoute: RouteGenerator.generateRoute,
              home: const Loading(),
            ),
          ),
        );
      },
    );
  }
}
