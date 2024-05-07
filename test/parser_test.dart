import 'package:ansi_richtext_parser/ansi_richtext_parser/color.dart';
import 'package:ansi_richtext_parser/ansi_richtext_parser/parser.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:petitparser/core.dart';

void main() {
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
}
