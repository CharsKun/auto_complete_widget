import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

// All Color
const MaterialColor primary = MaterialColor(
  0xFF021427,
  <int, Color>{
    50: Color(0xFFD4EFF8),
    100: Color(0xFFC5E5F4),
    200: Color(0xFF90C8E9),
    300: Color(0xFF5191BE),
    400: Color(0xFF24537D),
    500: Color(0xFF021427),
    600: Color(0xFF010F21),
    700: Color(0xFF010B1C),
    800: Color(0xFF000816),
    900: Color(0xFF000512),
  },
);

const lightColorScheme = ColorScheme(
  brightness: Brightness.light,
  primary: Color(0xFF24537D),
  onPrimary: Color(0xFFFFFFFF),
  primaryContainer: Color(0xFFE1FDEF),
  onPrimaryContainer: Color(0xFF04384E),
  secondary: Color(0xFF90C8E9),
  onSecondary: Color(0xFFFFFFFF),
  secondaryContainer: Color(0xFFCCF9EB),
  onSecondaryContainer: Color(0xFF24537D),
  tertiary: Color(0xFF5C6300),
  onTertiary: Color(0xFFFFFFFF),
  tertiaryContainer: Color(0xFFE0EA75),
  onTertiaryContainer: Color(0xFF1B1D00),
  error: Color(0xFFBA1A1A),
  errorContainer: Color(0xFFFFDAD6),
  onError: Color(0xFFFFFFFF),
  onErrorContainer: Color(0xFF410002),
  background: Color(0xFFFFFBFF),
  onBackground: Color(0xFF231A00),
  surface: Color(0xFFFFFBFF),
  onSurface: Color(0xFF231A00),
  surfaceVariant: Color(0xFFE1E2EC),
  onSurfaceVariant: Color(0xFF45464F),
  outline: Color(0xFF757780),
  onInverseSurface: Color(0xFFFFF0CB),
  inverseSurface: Color(0xFF3C2F00),
  inversePrimary: Color(0xFFC5E5F4),
  shadow: Color(0xFF000000),
  surfaceTint: Color(0xFF5191BE),
  outlineVariant: Color(0xFFCCF9EB),
  scrim: Color(0xFF000000),
);

// All Text Styles
TextStyle body12 = GoogleFonts.robotoCondensed(
  textStyle: const TextStyle(fontSize: 12),
);

TextStyle body12b = GoogleFonts.robotoCondensed(
  textStyle: const TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.w700,
  ),
);

TextStyle bodyStyle = GoogleFonts.robotoCondensed(
  textStyle: const TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w400,
  ),
);
// All Button Styles
ButtonStyle primaryButtonStyle = ButtonStyle(
  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
    RoundedRectangleBorder(
      borderRadius: primaryBorder,
    ),
  ),
  padding: MaterialStateProperty.all<EdgeInsetsGeometry>(buttonPadding),
  elevation: MaterialStateProperty.all<double>(3),
);

// All Decoration and Borders
BoxDecoration primaryDecoration = BoxDecoration(
  borderRadius: BorderRadius.circular(12),
);

BorderRadius secondaryBorder = const BorderRadius.only(
  topLeft: Radius.circular(0),
  topRight: Radius.circular(0),
  bottomLeft: Radius.circular(0),
  bottomRight: Radius.circular(0),
);

BorderRadius primaryBorder = BorderRadius.circular(8);

OutlineInputBorder formBorder = OutlineInputBorder(
  borderRadius: primaryBorder,
  borderSide: const BorderSide(),
);

TextStyle buttonStyle = GoogleFonts.quicksand(
    textStyle: const TextStyle(
  fontSize: 13,
  fontWeight: FontWeight.bold,
));

EdgeInsets buttonPadding =
    const EdgeInsets.symmetric(horizontal: 16, vertical: 8);
