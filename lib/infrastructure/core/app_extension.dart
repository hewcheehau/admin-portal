import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

extension LocalizedBuildContext on BuildContext {
  AppLocalizations get loc => AppLocalizations.of(this)!;
}

/// Text
extension CustomText on String {
  Widget get extralargeText =>
      _text(text: this, fontSize: 25, fontWeight: FontWeight.bold);
  Widget get largeText =>
      _text(text: this, fontSize: 20, fontWeight: FontWeight.bold);
  Widget get mediumText =>
      _text(text: this, fontSize: 17, fontWeight: FontWeight.w500);
  Widget get normalText =>
      _text(text: this, fontSize: 14, fontWeight: FontWeight.normal);
  Widget customText({
    Color? color,
    double? size,
    FontWeight? fontWeight,
  }) =>
      _text(
          text: this,
          color: color,
          fontSize: size ?? 14,
          fontWeight: fontWeight ?? FontWeight.normal);

  Text _text(
      {String text = "",
      double? fontSize,
      int maxLine = 2,
      TextAlign textAlign = TextAlign.left,
      TextOverflow textOverflow = TextOverflow.ellipsis,
      Color? color,
      FontWeight? fontWeight}) {
    return Text(
      text,
      style: TextStyle(
        fontSize: fontSize,
        color: color,
        fontWeight: fontWeight,
      ),
      maxLines: maxLine,
      textAlign: textAlign,
      overflow: textOverflow,
    );
  }
}

// Image path
extension ImagePath on String {
  toPng() => "assets/image/$this.png";
}
