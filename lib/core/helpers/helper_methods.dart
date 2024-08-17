// ignore_for_file: use_build_context_synchronously, unused_local_variable, avoid_print
import 'dart:async';
import 'package:fitness_tracking_app/core/helpers/navigation_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../constants/text_font_style.dart';
// import 'package:package_info_plus/package_info_plus.dart';

// Declared for Cart scrren calling bottom shit with this from reorder rx
final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
final GlobalKey<PopupMenuButtonState<String>> popUpGlobalkey =
    GlobalKey<PopupMenuButtonState<String>>();

Future<void> setInitValue() async {
  // var deviceInfo = DeviceInfoPlugin();
  // if (Platform.isIOS) {
  //   var iosDeviceInfo = await deviceInfo.iosInfo;
  //   appData.writeIfNull(
  //       kKeyDeviceID, iosDeviceInfo.identifierForVendor); // unique ID on iOS
  // } else if (Platform.isAndroid) {
  //   var androidDeviceInfo =
  //       await deviceInfo.androidInfo; // unique ID on Android
  //   appData.writeIfNull(kKeyDeviceID, androidDeviceInfo.id);
  // }
  await Future.delayed(const Duration(seconds: 2));
}

// Future<void> initiInternetChecker() async {
//   InternetConnectionChecker.createInstance(
//           checkTimeout: const Duration(seconds: 1),
//           checkInterval: const Duration(seconds: 2))
//       .onStatusChange
//       .listen((status) {
//     switch (status) {
//       case InternetConnectionStatus.connected:
//         ToastUtil.showShortToast('Data connection is available.');
//         break;
//       case InternetConnectionStatus.disconnected:
//         ToastUtil.showNoInternetToast();
//         break;
//     }
//   });
// }

Completer<T> wrapInCompleter<T>(Future<T> future) {
  final completer = Completer<T>();
  future.then(completer.complete).catchError(completer.completeError);
  return completer;
}

Future<void> getInvisible() async {
  Future.delayed(const Duration(milliseconds: 500), () {});
}

void showExitConfirmationDialog(BuildContext context) {
  showCupertinoDialog(
    context: context,
    builder: (BuildContext context) {
      return CupertinoAlertDialog(
        title: Text('Exit Application',
            style: TextFontStyle.headline16SemiBoldMontserrat),
        content: Padding(
          padding: EdgeInsets.only(top: 8.h),
          child: Text(
              'Do you want to exit the app? Any unsaved changes will be lost.',
              style: TextFontStyle.headline14LightMontserrat),
        ),
        actions: <Widget>[
          CupertinoDialogAction(
            child: Text(
              'Cancel',
              style: TextFontStyle.headline16SemiBoldMontserrat
                  .copyWith(color: Colors.blueAccent),
            ),
            onPressed: () {
              NavigationService.goBack(); // Dismiss the dialog
            },
          ),
          CupertinoDialogAction(
            child: Text('Exit',
                style: TextFontStyle.headline16SemiBoldMontserrat
                    .copyWith(color: Colors.blueAccent)),
            onPressed: () {
              NavigationService.goBack(); // Dismiss the dialog
              _exitApp();
            },
          ),
        ],
      );
    },
  );
}

void _exitApp() {
  // Ensure all routes are popped from the stack
  while (NavigationService.navigatorKey.currentState!.canPop()) {
    NavigationService.navigatorKey.currentState!.pop();
  }

  // Exit the app
  SystemNavigator.pop(); // This will close the app on Android
}

void rotation() {
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
    statusBarIconBrightness: Brightness.dark,
  ));

  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
}

void changeFocus(
    {required BuildContext context,
    required FocusNode current,
    required FocusNode next}) {
  current.unfocus();
  FocusScope.of(context).requestFocus(next);
}
