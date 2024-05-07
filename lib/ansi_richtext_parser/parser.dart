import 'package:ansi_richtext_parser/ansi_richtext_parser/color.dart';
import 'package:petitparser/petitparser.dart';

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
