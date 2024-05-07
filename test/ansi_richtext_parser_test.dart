import 'package:ansi_richtext_parser/ansi_richtext_parser/color.dart';
import 'package:ansi_richtext_parser/ansi_richtext_parser/colorscheme.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:ansi_richtext_parser/ansi_richtext_parser.dart';

void main() {
  final colorscheme = colorschemeVSC;

  test('Parse plain text', () {
    const input = 'asdkj238sdknvsdkjwskef';
    final output = parse(input, colorscheme);
    expect(output?.data, equals(input));
  });

  const rawInput =
      "\u001b[96m29/\u001b[36m40 | Filter: \u001b[93mrelay | Sort: \u001b[97m~name";

  test("Get plain text, ignore color information", () {
    final output = parse(rawInput, colorscheme);
    expect(output, isNotNull);
    expect(output!.textSpan?.toPlainText(),
        equals("29/40 | Filter: relay | Sort: ~name"));
  });

  test("Check created text spans", () {
    final output = parse(rawInput, colorscheme);
    expect(output, isNotNull);
    expect(output!.textSpan, isNotNull);
    expect((output.textSpan as TextSpan).children?.length, equals(4));

    // helper for iterating children
    child(idx) => (output.textSpan as TextSpan).children![idx] as TextSpan;

    expect(child(0).style?.color, equals(colorscheme.color(AnsiColor(96))));
    expect(child(0).text, equals("29/"));

    expect(child(1).style?.color, equals(colorscheme.color(AnsiColor(36))));
    expect(child(1).text, equals("40 | Filter: "));

    expect(child(2).style?.color, equals(colorscheme.color(AnsiColor(93))));
    expect(child(2).text, equals("relay | Sort: "));

    expect(child(3).style?.color, equals(colorscheme.color(AnsiColor(97))));
    expect(child(3).text, equals("~name"));
  });

  test("Check color/style reset", () {
    const input = "\x1B[36;46mTest\x1B[0m...";
    final output = parse(input, colorscheme);
    expect(output, isNotNull);
    expect(output!.textSpan, isNotNull);
    expect((output.textSpan as TextSpan).children?.length, equals(2));

    child(idx) => (output.textSpan as TextSpan).children![idx] as TextSpan;

    expect(child(0).style?.color,
        equals(colorscheme.color(AnsiColor(36, bgColor: 46))));
    expect(child(0).text, equals("Test"));

    expect(child(1).style, isNull);
    expect(child(1).text, equals("..."));
  });
}
