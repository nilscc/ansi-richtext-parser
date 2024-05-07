import 'package:ansi_richtext_parser/ansi_richtext_parser/color.dart';
import 'package:flutter/widgets.dart';

class AnsiColorscheme {
  final String? name;

  final Color // eol
      black,
      red,
      green,
      yellow,
      blue,
      magenta,
      cyan,
      white, // eol
      brightBlack,
      brightRed,
      brightGreen,
      brightYellow,
      brightBlue,
      brightMagenta,
      brightCyan,
      brightWhite;

  const AnsiColorscheme({
    this.name,
    required this.black,
    required this.red,
    required this.green,
    required this.yellow,
    required this.blue,
    required this.magenta,
    required this.cyan,
    required this.white,
    required this.brightBlack,
    required this.brightRed,
    required this.brightGreen,
    required this.brightYellow,
    required this.brightBlue,
    required this.brightMagenta,
    required this.brightCyan,
    required this.brightWhite,
  });

  _fgMapping(int i) => switch (i) {
        30 => black,
        31 => red,
        32 => green,
        33 => yellow,
        34 => blue,
        35 => magenta,
        36 => cyan,
        37 => white,
        90 => brightBlack,
        91 => brightRed,
        92 => brightGreen,
        93 => brightYellow,
        94 => brightBlue,
        95 => brightMagenta,
        96 => brightCyan,
        97 => brightWhite,
        _ => null,
      };

  _bgMapping(int i) => switch (i) {
        40 => black,
        41 => red,
        42 => green,
        43 => yellow,
        44 => blue,
        45 => magenta,
        46 => cyan,
        47 => white,
        100 => brightBlack,
        101 => brightRed,
        102 => brightGreen,
        103 => brightYellow,
        104 => brightBlue,
        105 => brightMagenta,
        106 => brightCyan,
        107 => brightWhite,
        _ => null,
      };

  Color? color(final AnsiColor ansiColor) => _fgMapping(ansiColor.fgColor);
  Color? backgroundColor(final AnsiColor ansiColor) =>
      _bgMapping(ansiColor.bgColor ?? 0);

  TextStyle textStyle(final AnsiColor ansiColor) => TextStyle(
        color: color(ansiColor),
        backgroundColor: backgroundColor(ansiColor),
      );
}

// color schemes taken from https://en.wikipedia.org/wiki/ANSI_escape_code#3-bit_and_4-bit
final _names = [
  "VGA", // 0
  "WindowsXP Console", // 1
  "Windows PowerShell 1.0–6.0", // 2
  "Visual Studio Code", // 3
  "Windows 10 Console", // 4
  "Terminal.app", // 5
  "PuTTY", // 6
  "mIRC", // 7
  "xterm", // 8
  "Ubuntu", // 9
  "Eclipse Terminal", // 10
];

final _blacks = [
  (0, 0, 0),
  (0, 0, 0),
  (0, 0, 0),
  (0, 0, 0),
  (12, 12, 12),
  (0, 0, 0),
  (0, 0, 0),
  (0, 0, 0),
  (0, 0, 0),
  (1, 1, 1),
  (0, 0, 0),
];

final _reds = [
  (170, 0, 0),
  (128, 0, 0),
  (128, 0, 0),
  (205, 49, 49),
  (197, 15, 31),
  (153, 0, 0),
  (187, 0, 0),
  (127, 0, 0),
  (205, 0, 0),
  (222, 56, 43),
  (205, 0, 0),
];

final _greens = [
  (0, 170, 0),
  (0, 128, 0),
  (0, 128, 0),
  (13, 188, 121),
  (19, 161, 14),
  (0, 166, 0),
  (0, 187, 0),
  (0, 147, 0),
  (0, 205, 0),
  (57, 181, 74),
  (0, 205, 0),
];

final _yellows = [
  (170, 85, 0),
  (128, 128, 0),
  (238, 237, 240),
  (229, 229, 16),
  (193, 156, 0),
  (153, 153, 0),
  (187, 187, 0),
  (252, 127, 0),
  (205, 205, 0),
  (255, 199, 6),
  (205, 205, 0),
];

final _blues = [
  (0, 0, 170),
  (0, 0, 128),
  (0, 0, 128),
  (36, 114, 200),
  (0, 55, 218),
  (0, 0, 178),
  (0, 0, 187),
  (0, 0, 127),
  (0, 0, 238),
  (0, 111, 184),
  (0, 0, 238),
];

final _magentas = [
  (170, 0, 170),
  (128, 0, 128),
  (1, 36, 86),
  (188, 63, 188),
  (136, 23, 152),
  (178, 0, 178),
  (187, 0, 187),
  (156, 0, 156),
  (205, 0, 205),
  (118, 38, 113),
  (205, 0, 205),
];

final _cyans = [
  (0, 170, 170),
  (0, 128, 128),
  (0, 128, 128),
  (17, 168, 205),
  (58, 150, 221),
  (0, 166, 178),
  (0, 187, 187),
  (0, 147, 147),
  (0, 205, 205),
  (44, 181, 233),
  (0, 205, 205),
];

final _whites = [
  (170, 170, 170),
  (192, 192, 192),
  (192, 192, 192),
  (229, 229, 229),
  (204, 204, 204),
  (191, 191, 191),
  (187, 187, 187),
  (210, 210, 210),
  (229, 229, 229),
  (204, 204, 204),
  (229, 229, 229),
];

final _brightBlacks = [
  (85, 85, 85),
  (128, 128, 128),
  (128, 128, 128),
  (102, 102, 102),
  (118, 118, 118),
  (102, 102, 102),
  (85, 85, 85),
  (127, 127, 127),
  (127, 127, 127),
  (128, 128, 128),
  (0, 0, 0),
];

final _brightReds = [
  (255, 85, 85),
  (255, 0, 0),
  (255, 0, 0),
  (241, 76, 76),
  (231, 72, 86),
  (230, 0, 0),
  (255, 85, 85),
  (255, 0, 0),
  (255, 0, 0),
  (255, 0, 0),
  (255, 0, 0),
];

final _brightGreens = [
  (85, 255, 85),
  (0, 255, 0),
  (0, 255, 0),
  (35, 209, 139),
  (22, 198, 12),
  (0, 217, 0),
  (85, 255, 85),
  (0, 252, 0),
  (0, 255, 0),
  (0, 255, 0),
  (0, 255, 0),
];

final _brightYellows = [
  (255, 255, 85),
  (255, 255, 0),
  (255, 255, 0),
  (245, 245, 67),
  (249, 241, 165),
  (230, 230, 0),
  (255, 255, 85),
  (255, 255, 0),
  (255, 255, 0),
  (255, 255, 0),
  (255, 255, 0),
];

final _brightBlues = [
  (85, 85, 255),
  (0, 0, 255),
  (0, 0, 255),
  (59, 142, 234),
  (59, 120, 255),
  (0, 0, 255),
  (85, 85, 255),
  (0, 0, 252),
  (92, 92, 255),
  (0, 0, 255),
  (92, 92, 255),
];

final _brightMagentas = [
  (255, 85, 255),
  (255, 0, 255),
  (255, 0, 255),
  (214, 112, 214),
  (180, 0, 158),
  (230, 0, 230),
  (255, 85, 255),
  (255, 0, 255),
  (255, 0, 255),
  (255, 0, 255),
  (255, 0, 255),
];

final _brightCyans = [
  (85, 255, 255),
  (0, 255, 255),
  (0, 255, 255),
  (41, 184, 219),
  (97, 214, 214),
  (0, 230, 230),
  (85, 255, 255),
  (0, 255, 255),
  (0, 255, 255),
  (0, 255, 255),
  (0, 255, 255),
];

final _brightWhites = [
  (255, 255, 255),
  (255, 255, 255),
  (255, 255, 255),
  (229, 229, 229),
  (242, 242, 242),
  (230, 230, 230),
  (255, 255, 255),
  (255, 255, 255),
  (255, 255, 255),
  (255, 255, 255),
  (255, 255, 255),
];

Color _toColor(tuple, {int alpha = 1}) {
  var (int r, int g, int b) = tuple;
  return Color.fromARGB(alpha, r, g, b);
}

_pickColorscheme(int index) => AnsiColorscheme(
      name: _names[index],
      black: _toColor(_blacks[index]),
      red: _toColor(_reds[index]),
      green: _toColor(_greens[index]),
      yellow: _toColor(_yellows[index]),
      blue: _toColor(_blues[index]),
      magenta: _toColor(_magentas[index]),
      cyan: _toColor(_cyans[index]),
      white: _toColor(_whites[index]),
      brightBlack: _toColor(_brightBlacks[index]),
      brightRed: _toColor(_brightReds[index]),
      brightGreen: _toColor(_brightGreens[index]),
      brightYellow: _toColor(_brightYellows[index]),
      brightBlue: _toColor(_brightBlues[index]),
      brightMagenta: _toColor(_brightMagentas[index]),
      brightCyan: _toColor(_brightCyans[index]),
      brightWhite: _toColor(_brightWhites[index]),
    );

final AnsiColorscheme colorschemeVGA = _pickColorscheme(0);
final AnsiColorscheme colorschemeWindowsXPConsole = _pickColorscheme(1);
final AnsiColorscheme colorschemeWindowsPowerShell = _pickColorscheme(2);
final AnsiColorscheme colorschemeVSC = _pickColorscheme(3);
final AnsiColorscheme colorschemeWindows10Console = _pickColorscheme(4);
final AnsiColorscheme colorschemeTerminalApp = _pickColorscheme(5);
final AnsiColorscheme colorschemePuTTY = _pickColorscheme(6);
final AnsiColorscheme colorschememIRC = _pickColorscheme(7);
final AnsiColorscheme colorschemexterm = _pickColorscheme(8);
final AnsiColorscheme colorschemeUbuntu = _pickColorscheme(9);
final AnsiColorscheme colorschemeEclipseTerminal = _pickColorscheme(10);
