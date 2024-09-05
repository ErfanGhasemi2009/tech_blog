/// GENERATED CODE - DO NOT MODIFY BY HAND
/// *****************************************************
///  FlutterGen
/// *****************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: directives_ordering,unnecessary_import,implicit_dynamic_list_literal,deprecated_member_use

import 'package:flutter/widgets.dart';

class $AssetsImagesGen {
  const $AssetsImagesGen();

  /// File path: assets/images/audiofile.png
  AssetGenImage get audiofile =>
      const AssetGenImage('assets/images/audiofile.png');

  /// File path: assets/images/blue_pen.png
  AssetGenImage get bluePen =>
      const AssetGenImage('assets/images/blue_pen.png');

  /// File path: assets/images/down_cat_arrow.png
  AssetGenImage get downCatArrow =>
      const AssetGenImage('assets/images/down_cat_arrow.png');

  /// File path: assets/images/empty_state.png
  AssetGenImage get emptyState =>
      const AssetGenImage('assets/images/empty_state.png');

  /// File path: assets/images/hashtagicon.png
  AssetGenImage get hashtagicon =>
      const AssetGenImage('assets/images/hashtagicon.png');

  /// File path: assets/images/home.png
  AssetGenImage get home => const AssetGenImage('assets/images/home.png');

  /// File path: assets/images/logo.png
  AssetGenImage get logo => const AssetGenImage('assets/images/logo.png');

  /// File path: assets/images/microphon.png
  AssetGenImage get microphon =>
      const AssetGenImage('assets/images/microphon.png');

  /// File path: assets/images/poster_test.png
  AssetGenImage get posterTest =>
      const AssetGenImage('assets/images/poster_test.png');

  /// File path: assets/images/profileAvatar.png
  AssetGenImage get profileAvatar =>
      const AssetGenImage('assets/images/profileAvatar.png');

  /// File path: assets/images/single_place_holder.jpg
  AssetGenImage get singlePlaceHolder =>
      const AssetGenImage('assets/images/single_place_holder.jpg');

  /// File path: assets/images/tcbot.svg
  String get tcbot => 'assets/images/tcbot.svg';

  /// File path: assets/images/user.png
  AssetGenImage get user => const AssetGenImage('assets/images/user.png');

  /// File path: assets/images/write.png
  AssetGenImage get write => const AssetGenImage('assets/images/write.png');

  /// File path: assets/images/write_article.png
  AssetGenImage get writeArticle =>
      const AssetGenImage('assets/images/write_article.png');

  /// File path: assets/images/write_article_icon.png
  AssetGenImage get writeArticleIcon =>
      const AssetGenImage('assets/images/write_article_icon.png');

  /// File path: assets/images/write_microphone.png
  AssetGenImage get writeMicrophone =>
      const AssetGenImage('assets/images/write_microphone.png');

  /// File path: assets/images/write_podcast_icon.png
  AssetGenImage get writePodcastIcon =>
      const AssetGenImage('assets/images/write_podcast_icon.png');

  /// List of all assets
  List<dynamic> get values => [
        audiofile,
        bluePen,
        downCatArrow,
        emptyState,
        hashtagicon,
        home,
        logo,
        microphon,
        posterTest,
        profileAvatar,
        singlePlaceHolder,
        tcbot,
        user,
        write,
        writeArticle,
        writeArticleIcon,
        writeMicrophone,
        writePodcastIcon
      ];
}

class Assets {
  Assets._();

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
