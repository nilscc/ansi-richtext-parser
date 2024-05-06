library ansi_richtext_parser;

import 'package:flutter/widgets.dart';
import 'package:petitparser/core.dart';
import 'package:petitparser/definition.dart';
import 'package:petitparser/parser.dart';

class AnsiColor {
  int fgColor;
  int? bgColor;

  // bool verify = true; // verify range of color numbers

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

  Color? color() {
    return null;
  }
}

class AnsiParser extends GrammarDefinition {
  @override
  Parser start() => ref0(elem).plus();

  Parser elem() => ref0(color) | ref0(text);

  Parser color() => (fgColor() & bgColor())
      .skip(before: escape(), after: char('m'))
      .map((values) => AnsiColor(values[0], bgColor: values[1]));

  Parser escape() => string('\x1B[');
  Parser fgColor() => ref0(integer);
  Parser bgColor() => ref0(integer).skip(before: char(';')).optional();

  Parser integer() => digit().plus().flatten().map(int.parse);

  Parser notEscape() => escape().not() & any();
  Parser text() => ref0(notEscape).plus().flatten();
}

class AnsiColorscheme {
  Color? ansi(final AnsiColor ansiColor) {
    return null;
  }
}

InlineSpan? _buildInlineSpan(values, colorscheme) {
  toStyle(AnsiColor ansiColor) => TextStyle(color: colorscheme.ansi(ansiColor));

  return switch (values) {
    [] => null,
    [String a] => TextSpan(text: a),
    [AnsiColor ansiColor, String text] => TextSpan(
        style: toStyle(ansiColor),
        text: text,
      ),
    _ => null,
  };
}

Text parse(String ansi, AnsiColorscheme colorscheme) {
  final parser = AnsiParser().build();
  final result = parser.parse(ansi);

  if (result is Failure) {
    throw result;
  }

  // check if there's only plain text
  if (result.value.length == 1 && result.value[0] is String) {
    return Text(result.value[0]);
  } else {
    return Text.rich(_buildInlineSpan(result.value, colorscheme)!);
  }
}
