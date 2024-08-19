/// GENERATED CODE - DO NOT MODIFY BY HAND
/// *****************************************************
///  FlutterGen
/// *****************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: directives_ordering,unnecessary_import,implicit_dynamic_list_literal,deprecated_member_use

import 'package:flutter/widgets.dart';

class $AssetsColorsGen {
  const $AssetsColorsGen();

  /// File path: assets/colors/colors.xml
  String get colors => 'assets/colors/colors.xml';

  /// List of all assets
  List<String> get values => [colors];
}

class $AssetsIconsGen {
  const $AssetsIconsGen();

  /// File path: assets/icons/activity.svg
  String get activity => 'assets/icons/activity.svg';

  /// File path: assets/icons/alert.svg
  String get alert => 'assets/icons/alert.svg';

  /// File path: assets/icons/calories.svg
  String get calories => 'assets/icons/calories.svg';

  /// File path: assets/icons/chart.svg
  String get chart => 'assets/icons/chart.svg';

  /// File path: assets/icons/distance.svg
  String get distance => 'assets/icons/distance.svg';

  /// File path: assets/icons/document.svg
  String get document => 'assets/icons/document.svg';

  /// File path: assets/icons/done.svg
  String get done => 'assets/icons/done.svg';

  /// File path: assets/icons/home.svg
  String get home => 'assets/icons/home.svg';

  /// File path: assets/icons/notification.svg
  String get notification => 'assets/icons/notification.svg';

  /// File path: assets/icons/pause.svg
  String get pause => 'assets/icons/pause.svg';

  /// File path: assets/icons/person.svg
  String get person => 'assets/icons/person.svg';

  /// File path: assets/icons/profile.svg
  String get profile => 'assets/icons/profile.svg';

  /// File path: assets/icons/right_arrow.svg
  String get rightArrow => 'assets/icons/right_arrow.svg';

  /// File path: assets/icons/sign_out.svg
  String get signOut => 'assets/icons/sign_out.svg';

  /// File path: assets/icons/sleep.svg
  String get sleep => 'assets/icons/sleep.svg';

  /// File path: assets/icons/steps.svg
  String get steps => 'assets/icons/steps.svg';

  /// File path: assets/icons/tick.svg
  String get tick => 'assets/icons/tick.svg';

  /// File path: assets/icons/time.svg
  String get time => 'assets/icons/time.svg';

  /// File path: assets/icons/wake_up.svg
  String get wakeUp => 'assets/icons/wake_up.svg';

  /// List of all assets
  List<String> get values => [
        activity,
        alert,
        calories,
        chart,
        distance,
        document,
        done,
        home,
        notification,
        pause,
        person,
        profile,
        rightArrow,
        signOut,
        sleep,
        steps,
        tick,
        time,
        wakeUp
      ];
}

class $AssetsImagesGen {
  const $AssetsImagesGen();

  /// File path: assets/images/abs_workout.png
  AssetGenImage get absWorkout =>
      const AssetGenImage('assets/images/abs_workout.png');

  /// File path: assets/images/banner.png
  AssetGenImage get banner => const AssetGenImage('assets/images/banner.png');

  /// File path: assets/images/both_side.png
  AssetGenImage get bothSide =>
      const AssetGenImage('assets/images/both_side.png');

  /// File path: assets/images/cycling.png
  AssetGenImage get cycling => const AssetGenImage('assets/images/cycling.png');

  /// File path: assets/images/default_profile_pic.png
  AssetGenImage get defaultProfilePic =>
      const AssetGenImage('assets/images/default_profile_pic.png');

  /// File path: assets/images/full_body.png
  AssetGenImage get fullBody =>
      const AssetGenImage('assets/images/full_body.png');

  /// File path: assets/images/jogging.png
  AssetGenImage get jogging => const AssetGenImage('assets/images/jogging.png');

  /// File path: assets/images/lower_back.png
  AssetGenImage get lowerBack =>
      const AssetGenImage('assets/images/lower_back.png');

  /// File path: assets/images/strength_exercise.png
  AssetGenImage get strengthExercise =>
      const AssetGenImage('assets/images/strength_exercise.png');

  /// File path: assets/images/torso_trap.png
  AssetGenImage get torsoTrap =>
      const AssetGenImage('assets/images/torso_trap.png');

  /// File path: assets/images/yoga.png
  AssetGenImage get yoga => const AssetGenImage('assets/images/yoga.png');

  /// List of all assets
  List<AssetGenImage> get values => [
        absWorkout,
        banner,
        bothSide,
        cycling,
        defaultProfilePic,
        fullBody,
        jogging,
        lowerBack,
        strengthExercise,
        torsoTrap,
        yoga
      ];
}

class Assets {
  Assets._();

  static const $AssetsColorsGen colors = $AssetsColorsGen();
  static const $AssetsIconsGen icons = $AssetsIconsGen();
  static const $AssetsImagesGen images = $AssetsImagesGen();
}

class AssetGenImage {
  const AssetGenImage(
    this._assetName, {
    this.size,
    this.flavors = const {},
  });

  final String _assetName;

  final Size? size;
  final Set<String> flavors;

  Image image({
    Key? key,
    AssetBundle? bundle,
    ImageFrameBuilder? frameBuilder,
    ImageErrorWidgetBuilder? errorBuilder,
    String? semanticLabel,
    bool excludeFromSemantics = false,
    double? scale,
    double? width,
    double? height,
    Color? color,
    Animation<double>? opacity,
    BlendMode? colorBlendMode,
    BoxFit? fit,
    AlignmentGeometry alignment = Alignment.center,
    ImageRepeat repeat = ImageRepeat.noRepeat,
    Rect? centerSlice,
    bool matchTextDirection = false,
    bool gaplessPlayback = false,
    bool isAntiAlias = false,
    String? package,
    FilterQuality filterQuality = FilterQuality.low,
    int? cacheWidth,
    int? cacheHeight,
  }) {
    return Image.asset(
      _assetName,
      key: key,
      bundle: bundle,
      frameBuilder: frameBuilder,
      errorBuilder: errorBuilder,
      semanticLabel: semanticLabel,
      excludeFromSemantics: excludeFromSemantics,
      scale: scale,
      width: width,
      height: height,
      color: color,
      opacity: opacity,
      colorBlendMode: colorBlendMode,
      fit: fit,
      alignment: alignment,
      repeat: repeat,
      centerSlice: centerSlice,
      matchTextDirection: matchTextDirection,
      gaplessPlayback: gaplessPlayback,
      isAntiAlias: isAntiAlias,
      package: package,
      filterQuality: filterQuality,
      cacheWidth: cacheWidth,
      cacheHeight: cacheHeight,
    );
  }

  ImageProvider provider({
    AssetBundle? bundle,
    String? package,
  }) {
    return AssetImage(
      _assetName,
      bundle: bundle,
      package: package,
    );
  }

  String get path => _assetName;

  String get keyName => _assetName;
}
