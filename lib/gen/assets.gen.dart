/// GENERATED CODE - DO NOT MODIFY BY HAND
/// *****************************************************
///  FlutterGen
/// *****************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: directives_ordering,unnecessary_import,implicit_dynamic_list_literal,deprecated_member_use

import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter/services.dart';

class $AssetsIconsGen {
  const $AssetsIconsGen();

  /// File path: assets/icons/alma.svg
  SvgGenImage get alma => const SvgGenImage('assets/icons/alma.svg');

  /// File path: assets/icons/alpine.svg
  SvgGenImage get alpine => const SvgGenImage('assets/icons/alpine.svg');

  /// File path: assets/icons/clink.svg
  SvgGenImage get clink => const SvgGenImage('assets/icons/clink.svg');

  /// File path: assets/icons/cmd.svg
  SvgGenImage get cmd => const SvgGenImage('assets/icons/cmd.svg');

  /// File path: assets/icons/cmder-powershell.svg
  SvgGenImage get cmderPowershell =>
      const SvgGenImage('assets/icons/cmder-powershell.svg');

  /// File path: assets/icons/cmder.svg
  SvgGenImage get cmder => const SvgGenImage('assets/icons/cmder.svg');

  /// File path: assets/icons/cygwin.svg
  SvgGenImage get cygwin => const SvgGenImage('assets/icons/cygwin.svg');

  /// File path: assets/icons/debian.svg
  SvgGenImage get debian => const SvgGenImage('assets/icons/debian.svg');

  /// File path: assets/icons/docker.svg
  SvgGenImage get docker => const SvgGenImage('assets/icons/docker.svg');

  /// File path: assets/icons/git-bash.svg
  SvgGenImage get gitBash => const SvgGenImage('assets/icons/git-bash.svg');

  /// File path: assets/icons/kali.svg
  SvgGenImage get kali => const SvgGenImage('assets/icons/kali.svg');

  /// File path: assets/icons/linux.svg
  SvgGenImage get linux => const SvgGenImage('assets/icons/linux.svg');

  /// File path: assets/icons/msys2.svg
  SvgGenImage get msys2 => const SvgGenImage('assets/icons/msys2.svg');

  /// File path: assets/icons/open-euler.svg
  SvgGenImage get openEuler => const SvgGenImage('assets/icons/open-euler.svg');

  /// File path: assets/icons/oracle-linux.svg
  SvgGenImage get oracleLinux =>
      const SvgGenImage('assets/icons/oracle-linux.svg');

  /// File path: assets/icons/powershell-core.svg
  SvgGenImage get powershellCore =>
      const SvgGenImage('assets/icons/powershell-core.svg');

  /// File path: assets/icons/powershell.svg
  SvgGenImage get powershell =>
      const SvgGenImage('assets/icons/powershell.svg');

  /// File path: assets/icons/suse.svg
  SvgGenImage get suse => const SvgGenImage('assets/icons/suse.svg');

  /// File path: assets/icons/ubuntu.svg
  SvgGenImage get ubuntu => const SvgGenImage('assets/icons/ubuntu.svg');

  /// File path: assets/icons/vs2017.svg
  SvgGenImage get vs2017 => const SvgGenImage('assets/icons/vs2017.svg');

  /// File path: assets/icons/vs2019.svg
  SvgGenImage get vs2019 => const SvgGenImage('assets/icons/vs2019.svg');

  /// File path: assets/icons/vs2022.svg
  SvgGenImage get vs2022 => const SvgGenImage('assets/icons/vs2022.svg');

  /// List of all assets
  List<SvgGenImage> get values => [
        alma,
        alpine,
        clink,
        cmd,
        cmderPowershell,
        cmder,
        cygwin,
        debian,
        docker,
        gitBash,
        kali,
        linux,
        msys2,
        openEuler,
        oracleLinux,
        powershellCore,
        powershell,
        suse,
        ubuntu,
        vs2017,
        vs2019,
        vs2022
      ];
}

class $AssetsImagesGen {
  const $AssetsImagesGen();

  /// File path: assets/images/ic_chrome_close.png
  AssetGenImage get icChromeClose =>
      const AssetGenImage('assets/images/ic_chrome_close.png');

  /// File path: assets/images/ic_chrome_maximize.png
  AssetGenImage get icChromeMaximize =>
      const AssetGenImage('assets/images/ic_chrome_maximize.png');

  /// File path: assets/images/ic_chrome_minimize.png
  AssetGenImage get icChromeMinimize =>
      const AssetGenImage('assets/images/ic_chrome_minimize.png');

  /// File path: assets/images/ic_chrome_unmaximize.png
  AssetGenImage get icChromeUnmaximize =>
      const AssetGenImage('assets/images/ic_chrome_unmaximize.png');

  /// List of all assets
  List<AssetGenImage> get values =>
      [icChromeClose, icChromeMaximize, icChromeMinimize, icChromeUnmaximize];
}

class $AssetsScriptsGen {
  const $AssetsScriptsGen();

  /// File path: assets/scripts/fterm
  String get fterm => 'assets/scripts/fterm';

  /// List of all assets
  List<String> get values => [fterm];
}

class Assets {
  Assets._();

  static const $AssetsIconsGen icons = $AssetsIconsGen();
  static const $AssetsImagesGen images = $AssetsImagesGen();
  static const $AssetsScriptsGen scripts = $AssetsScriptsGen();
  static const AssetGenImage terminalPng = AssetGenImage('assets/terminal.png');
  static const SvgGenImage terminalSvg = SvgGenImage('assets/terminal.svg');

  /// List of all assets
  List<dynamic> get values => [terminalPng, terminalSvg];
}

class AssetGenImage {
  const AssetGenImage(this._assetName);

  final String _assetName;

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

class SvgGenImage {
  const SvgGenImage(this._assetName);

  final String _assetName;

  SvgPicture svg({
    Key? key,
    bool matchTextDirection = false,
    AssetBundle? bundle,
    String? package,
    double? width,
    double? height,
    BoxFit fit = BoxFit.contain,
    AlignmentGeometry alignment = Alignment.center,
    bool allowDrawingOutsideViewBox = false,
    WidgetBuilder? placeholderBuilder,
    String? semanticsLabel,
    bool excludeFromSemantics = false,
    SvgTheme theme = const SvgTheme(),
    ColorFilter? colorFilter,
    Clip clipBehavior = Clip.hardEdge,
    @deprecated Color? color,
    @deprecated BlendMode colorBlendMode = BlendMode.srcIn,
    @deprecated bool cacheColorFilter = false,
  }) {
    return SvgPicture.asset(
      _assetName,
      key: key,
      matchTextDirection: matchTextDirection,
      bundle: bundle,
      package: package,
      width: width,
      height: height,
      fit: fit,
      alignment: alignment,
      allowDrawingOutsideViewBox: allowDrawingOutsideViewBox,
      placeholderBuilder: placeholderBuilder,
      semanticsLabel: semanticsLabel,
      excludeFromSemantics: excludeFromSemantics,
      theme: theme,
      colorFilter: colorFilter,
      color: color,
      colorBlendMode: colorBlendMode,
      clipBehavior: clipBehavior,
      cacheColorFilter: cacheColorFilter,
    );
  }

  String get path => _assetName;

  String get keyName => _assetName;
}
