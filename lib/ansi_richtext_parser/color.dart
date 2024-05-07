import 'package:flutter/widgets.dart';

class AnsiColor {
  int fgColor;
  int? bgColor;

  AnsiColor(this.fgColor, {this.bgColor});

  @override
  String toString() => 'AnsiColor{fgColor: $fgColor, bgColor: $bgColor}';

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AnsiColor &&
          fgColor == other.fgColor &&
          bgColor == other.bgColor;

  @override
  int get hashCode => fgColor.hashCode + bgColor.hashCode;
}
