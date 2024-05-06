import 'dart:ffi';
import 'dart:math';

import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:ansi_richtext_parser/ansi_richtext_parser.dart';
import 'package:petitparser/core.dart';

void main() {
  final colorscheme = AnsiColorscheme();

  test('Parse plain text', () {
    const input = 'asdkj238sdknvsdkjwskef';
    final output = parse(input, colorscheme);
    expect(output.data, equals(input));
  });

  // group(("Parser tests"), () {
  // test("Color parser", () {
  //   // helper function
  //   parse(val) => AnsiColor().build().parse(val);

  //   expect(parse('\x1B[30m').value, equals([30, null]));
  //   expect(parse('\x1B[30;40m').value, equals([30, 40]));
  //   expect(parse('\x1B[50;200m') is Failure, isTrue);
  //   expect(parse('\x1B[0;0m') is Failure, isTrue);
  //   expect(parse('\x1B[96m').value, equals([96, null]));
  //   expect(parse('\x1B[96;102m').value, equals([96, 102]));
  //   expect(parse('\x1B[;102m') is Failure, isTrue);
  //   expect(parse('\x1B[96;m') is Failure, isTrue);
  // });

  group("Ansi parser", () {
    final parser = AnsiParser().build();
    parse(val) => parser.parse(val);

    test('No colors', () {
      final result = parse("abc");
      expect(result is Success, isTrue);
      expect(result.value.length, equals(1));
      expect(result.value[0], equals("abc"));
    });

    test('FG color', () {
      final result = parse("\x1B[30m");
      expect(result is Success, isTrue);
      expect(result.value.length, equals(1));
      expect(result.value[0], equals(AnsiColor(30)));
    });

    test('FG + BG color', () {
      final result = parse("\x1B[30;40m");
      expect(result is Success, isTrue);
      expect(result.value.length, equals(1));
      expect(result.value[0], equals(AnsiColor(30, bgColor: 40)));
    });

    test('Mixed colors and text', () {
      final result = parse("\u001b[96m29/\u001b[36m40");
      expect(result is Success, isTrue);
      expect(result.value.length, equals(4));
      expect(result.value[0], equals(AnsiColor(96))); // first token
      expect(result.value[1], equals("29/")); // first string
      expect(result.value[2], equals(AnsiColor(36))); // second token
      expect(result.value[3], equals("40")); // second string
    });
  });

  group("Complex inputs", () {
    const raw_input =
        "\u001b[96m29/\u001b[36m40 | Filter: \u001b[93mrelay | Sort: \u001b[97m~name";

    test(
      "Get plain text, ignore color information",
      skip: true, // TODO...
      () {
        final output = parse(raw_input, colorscheme);
        expect(output.textSpan!.toPlainText(),
            "29/36 | Filter: relay | Sort: name");
      },
    );
  });
}
