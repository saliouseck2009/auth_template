import "package:flutter/material.dart";
import "package:flutter/services.dart";

import "app_color.dart";
// how to use this class in MaterialApp widget.

class MaterialTheme {
  const MaterialTheme();

  static ColorScheme lightScheme() {
    return const ColorScheme(
      brightness: Brightness.light,
      primary: Color(0xff3DAE2B),
      surfaceTint: Color(0xff096e00),
      onPrimary: Color(0xffffffff),
      primaryContainer: Color(0xff3dae2b),
      onPrimaryContainer: Color(0xff033a00),
      secondary: Color(0xff0055B8),
      onSecondary: Color(0xffffffff),
      secondaryContainer: Color(0xff0055b8),
      onSecondaryContainer: Color(0xffbcd0ff),
      tertiary: Color(0xff745b00),
      onTertiary: Color(0xffffffff),
      tertiaryContainer: Color(0xffffcc00),
      onTertiaryContainer: Color(0xff6f5700),
      error: Color(0xffba1a1a),
      onError: Color(0xffffffff),
      errorContainer: Color(0xffffdad6),
      onErrorContainer: Color(0xff93000a),
      surface: Color(0xFFF5F5F5),
      onSurface: Color(0xff171d14),
      onSurfaceVariant: Color(0xff3f4a3a),
      outline: Color(0xff6f7b68),
      outlineVariant: Color(0xffbecab5),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xff2b3228),
      inversePrimary: Color(0xff6edf57),
      primaryFixed: Color(0xff89fc70),
      onPrimaryFixed: Color(0xff012200),
      primaryFixedDim: Color(0xff6edf57),
      onPrimaryFixedVariant: Color(0xff055300),
      secondaryFixed: Color(0xffd8e2ff),
      onSecondaryFixed: Color(0xff001a42),
      secondaryFixedDim: Color(0xffaec6ff),
      onSecondaryFixedVariant: Color(0xff004395),
      tertiaryFixed: Color(0xffffe08b),
      onTertiaryFixed: Color(0xff241a00),
      tertiaryFixedDim: Color(0xfff1c100),
      onTertiaryFixedVariant: Color(0xff584400),
      surfaceDim: Color(0xffd5dccd),
      surfaceBright: Color(0xfff5fcec),
      surfaceContainerLowest: Color(0xffffffff),
      surfaceContainerLow: Color(0xffeff6e6),
      surfaceContainer: Color(0xffe9f0e1),
      surfaceContainerHigh: Color(0xffe3ebdb),
      surfaceContainerHighest: Color(0xffdee5d6),
    );
  }

  ThemeData light() {
    return ThemeData(
      colorScheme: lightScheme(),
      //fontFamily: CustomFont.dinPro,
      appBarTheme: const AppBarTheme(
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: Colors.white,
          statusBarIconBrightness: Brightness.dark,
          systemNavigationBarColor: AppColor.white,
          systemNavigationBarIconBrightness: Brightness.dark,
        ),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
        ),
      ),
    );
  }

  static ColorScheme lightMediumContrastScheme() {
    return const ColorScheme(
      brightness: Brightness.light,
      primary: Color(0xff3DAE2B),
      surfaceTint: Color(0xff096e00),
      onPrimary: Color(0xffffffff),
      primaryContainer: Color(0xff3DAE2B),
      onPrimaryContainer: Color(0xffffffff),
      secondary: Color(0xff0055B8),
      onSecondary: Color(0xffffffff),
      secondaryContainer: Color(0xff0055b8),
      onSecondaryContainer: Color(0xffffffff),
      tertiary: Color(0xff443400),
      onTertiary: Color(0xffffffff),
      tertiaryContainer: Color(0xff856a00),
      onTertiaryContainer: Color(0xffffffff),
      error: Color(0xff740006),
      onError: Color(0xffffffff),
      errorContainer: Color(0xffcf2c27),
      onErrorContainer: Color(0xffffffff),
      surface: Color(0xfff5fcec),
      onSurface: Color(0xff0c130a),
      onSurfaceVariant: Color(0xff2e392a),
      outline: Color(0xff4a5645),
      outlineVariant: Color(0xff65715e),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xff2b3228),
      inversePrimary: Color(0xff6edf57),
      primaryFixed: Color(0xff0c7f00),
      onPrimaryFixed: Color(0xffffffff),
      primaryFixedDim: Color(0xff086300),
      onPrimaryFixedVariant: Color(0xffffffff),
      secondaryFixed: Color(0xff2b6ace),
      onSecondaryFixed: Color(0xffffffff),
      secondaryFixedDim: Color(0xff0051b0),
      onSecondaryFixedVariant: Color(0xffffffff),
      tertiaryFixed: Color(0xff856a00),
      onTertiaryFixed: Color(0xffffffff),
      tertiaryFixedDim: Color(0xff685200),
      onTertiaryFixedVariant: Color(0xffffffff),
      surfaceDim: Color(0xffc2c9ba),
      surfaceBright: Color(0xfff5fcec),
      surfaceContainerLowest: Color(0xffffffff),
      surfaceContainerLow: Color(0xffeff6e6),
      surfaceContainer: Color(0xffe3ebdb),
      surfaceContainerHigh: Color(0xffd8dfd0),
      surfaceContainerHighest: Color(0xffcdd4c5),
    );
  }

  ThemeData lightMediumContrast() {
    return theme(lightMediumContrastScheme());
  }

  static ColorScheme lightHighContrastScheme() {
    return const ColorScheme(
      brightness: Brightness.light,
      primary: Color(0xff3DAE2B),
      surfaceTint: Color(0xff096e00),
      onPrimary: Color(0xffffffff),
      primaryContainer: Color(0xff065600),
      onPrimaryContainer: Color(0xffffffff),
      secondary: Color(0xff002a62),
      onSecondary: Color(0xffffffff),
      secondaryContainer: Color(0xff004699),
      onSecondaryContainer: Color(0xffffffff),
      tertiary: Color(0xff382b00),
      onTertiary: Color(0xffffffff),
      tertiaryContainer: Color(0xff5a4700),
      onTertiaryContainer: Color(0xffffffff),
      error: Color(0xff600004),
      onError: Color(0xffffffff),
      errorContainer: Color(0xff98000a),
      onErrorContainer: Color(0xffffffff),
      surface: Color(0xfff5fcec),
      onSurface: Color(0xff000000),
      onSurfaceVariant: Color(0xff000000),
      outline: Color(0xff242f20),
      outlineVariant: Color(0xff414c3c),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xff2b3228),
      inversePrimary: Color(0xff6edf57),
      primaryFixed: Color(0xff065600),
      onPrimaryFixed: Color(0xffffffff),
      primaryFixedDim: Color(0xff033c00),
      onPrimaryFixedVariant: Color(0xffffffff),
      secondaryFixed: Color(0xff004699),
      onSecondaryFixed: Color(0xffffffff),
      secondaryFixedDim: Color(0xff00306e),
      onSecondaryFixedVariant: Color(0xffffffff),
      tertiaryFixed: Color(0xff5a4700),
      onTertiaryFixed: Color(0xffffffff),
      tertiaryFixedDim: Color(0xff3f3100),
      onTertiaryFixedVariant: Color(0xffffffff),
      surfaceDim: Color(0xffb4bbad),
      surfaceBright: Color(0xfff5fcec),
      surfaceContainerLowest: Color(0xffffffff),
      surfaceContainerLow: Color(0xffecf3e4),
      surfaceContainer: Color(0xffdee5d6),
      surfaceContainerHigh: Color(0xffd0d7c8),
      surfaceContainerHighest: Color(0xffc2c9ba),
    );
  }

  ThemeData lightHighContrast() {
    return theme(lightHighContrastScheme());
  }

  static ColorScheme darkScheme() {
    return const ColorScheme(
      brightness: Brightness.dark,
      primary: Color(0xff6edf57),
      surfaceTint: Color(0xff6edf57),
      onPrimary: Color(0xff033900),
      primaryContainer: Color(0xff3dae2b),
      onPrimaryContainer: Color(0xff033a00),
      secondary: Color(0xffaec6ff),
      onSecondary: Color(0xff0055B8),
      secondaryContainer: Color(0xff0055b8),
      onSecondaryContainer: Color(0xffbcd0ff),
      tertiary: Color(0xffffedc3),
      onTertiary: Color(0xff3d2f00),
      tertiaryContainer: Color(0xffffcc00),
      onTertiaryContainer: Color(0xff6f5700),
      error: Color(0xffffb4ab),
      onError: Color(0xff690005),
      errorContainer: Color(0xff93000a),
      onErrorContainer: Color(0xffffdad6),
      surface: Color(0xff0f150c),
      onSurface: Color(0xffdee5d6),
      onSurfaceVariant: Color(0xffbecab5),
      outline: Color(0xff889481),
      outlineVariant: Color(0xff3f4a3a),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xffdee5d6),
      inversePrimary: Color(0xff096e00),
      primaryFixed: Color(0xff89fc70),
      onPrimaryFixed: Color(0xff012200),
      primaryFixedDim: Color(0xff6edf57),
      onPrimaryFixedVariant: Color(0xff055300),
      secondaryFixed: Color(0xffd8e2ff),
      onSecondaryFixed: Color(0xff001a42),
      secondaryFixedDim: Color(0xffaec6ff),
      onSecondaryFixedVariant: Color(0xff004395),
      tertiaryFixed: Color(0xffffe08b),
      onTertiaryFixed: Color(0xff241a00),
      tertiaryFixedDim: Color(0xfff1c100),
      onTertiaryFixedVariant: Color(0xff584400),
      surfaceDim: Color(0xff0f150c),
      surfaceBright: Color(0xff343b31),
      surfaceContainerLowest: Color(0xff0a1007),
      surfaceContainerLow: Color(0xff171d14),
      surfaceContainer: Color(0xff1b2118),
      surfaceContainerHigh: Color(0xff252c22),
      surfaceContainerHighest: Color(0xff30372c),
    );
  }

  ThemeData dark() {
    return theme(darkScheme());
  }

  static ColorScheme darkMediumContrastScheme() {
    return const ColorScheme(
      brightness: Brightness.dark,
      primary: Color(0xff83f66a),
      surfaceTint: Color(0xff6edf57),
      onPrimary: Color(0xff022d00),
      primaryContainer: Color(0xff3dae2b),
      onPrimaryContainer: Color(0xff000700),
      secondary: Color(0xffcfdcff),
      onSecondary: Color(0xff002455),
      secondaryContainer: Color(0xff578ff4),
      onSecondaryContainer: Color(0xff000000),
      tertiary: Color(0xffffedc3),
      onTertiary: Color(0xff3d2f00),
      tertiaryContainer: Color(0xffffcc00),
      onTertiaryContainer: Color(0xff4d3c00),
      error: Color(0xffffd2cc),
      onError: Color(0xff540003),
      errorContainer: Color(0xffff5449),
      onErrorContainer: Color(0xff000000),
      surface: Color(0xff0f150c),
      onSurface: Color(0xffffffff),
      onSurfaceVariant: Color(0xffd4e0ca),
      outline: Color(0xffa9b6a1),
      outlineVariant: Color(0xff889480),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xffdee5d6),
      inversePrimary: Color(0xff065400),
      primaryFixed: Color(0xff89fc70),
      onPrimaryFixed: Color(0xff011600),
      primaryFixedDim: Color(0xff6edf57),
      onPrimaryFixedVariant: Color(0xff034000),
      secondaryFixed: Color(0xffd8e2ff),
      onSecondaryFixed: Color(0xff00102e),
      secondaryFixedDim: Color(0xffaec6ff),
      onSecondaryFixedVariant: Color(0xff003475),
      tertiaryFixed: Color(0xffffe08b),
      onTertiaryFixed: Color(0xff171000),
      tertiaryFixedDim: Color(0xfff1c100),
      onTertiaryFixedVariant: Color(0xff443400),
      surfaceDim: Color(0xff0f150c),
      surfaceBright: Color(0xff3f473b),
      surfaceContainerLowest: Color(0xff040903),
      surfaceContainerLow: Color(0xff191f16),
      surfaceContainer: Color(0xff232a20),
      surfaceContainerHigh: Color(0xff2e352a),
      surfaceContainerHighest: Color(0xff394035),
    );
  }

  ThemeData darkMediumContrast() {
    return theme(darkMediumContrastScheme());
  }

  static ColorScheme darkHighContrastScheme() {
    return const ColorScheme(
      brightness: Brightness.dark,
      primary: Color(0xffc7ffb3),
      surfaceTint: Color(0xff6edf57),
      onPrimary: Color(0xff000000),
      primaryContainer: Color(0xff6adb53),
      onPrimaryContainer: Color(0xff000f00),
      secondary: Color(0xffecefff),
      onSecondary: Color(0xff000000),
      secondaryContainer: Color(0xffa7c2ff),
      onSecondaryContainer: Color(0xff000a22),
      tertiary: Color(0xffffefc9),
      onTertiary: Color(0xff000000),
      tertiaryContainer: Color(0xffffcc00),
      onTertiaryContainer: Color(0xff261c00),
      error: Color(0xffffece9),
      onError: Color(0xff000000),
      errorContainer: Color(0xffffaea4),
      onErrorContainer: Color(0xff220001),
      surface: Color(0xff0f150c),
      onSurface: Color(0xffffffff),
      onSurfaceVariant: Color(0xffffffff),
      outline: Color(0xffe7f4dd),
      outlineVariant: Color(0xffbac6b1),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xffdee5d6),
      inversePrimary: Color(0xff065400),
      primaryFixed: Color(0xff89fc70),
      onPrimaryFixed: Color(0xff000000),
      primaryFixedDim: Color(0xff6edf57),
      onPrimaryFixedVariant: Color(0xff011600),
      secondaryFixed: Color(0xffd8e2ff),
      onSecondaryFixed: Color(0xff000000),
      secondaryFixedDim: Color(0xffaec6ff),
      onSecondaryFixedVariant: Color(0xff00102e),
      tertiaryFixed: Color(0xffffe08b),
      onTertiaryFixed: Color(0xff000000),
      tertiaryFixedDim: Color(0xfff1c100),
      onTertiaryFixedVariant: Color(0xff171000),
      surfaceDim: Color(0xff0f150c),
      surfaceBright: Color(0xff4b5247),
      surfaceContainerLowest: Color(0xff000000),
      surfaceContainerLow: Color(0xff1b2118),
      surfaceContainer: Color(0xff2b3228),
      surfaceContainerHigh: Color(0xff363d33),
      surfaceContainerHighest: Color(0xff42493e),
    );
  }

  ThemeData darkHighContrast() {
    return theme(darkHighContrastScheme());
  }

  ThemeData theme(ColorScheme colorScheme) => ThemeData(
        useMaterial3: true,
        brightness: colorScheme.brightness,
        colorScheme: colorScheme,
        scaffoldBackgroundColor: colorScheme.surface,
        canvasColor: colorScheme.surface,
      );

  List<ExtendedColor> get extendedColors => [];
}

class ExtendedColor {
  final Color seed, value;
  final ColorFamily light;
  final ColorFamily lightHighContrast;
  final ColorFamily lightMediumContrast;
  final ColorFamily dark;
  final ColorFamily darkHighContrast;
  final ColorFamily darkMediumContrast;

  const ExtendedColor({
    required this.seed,
    required this.value,
    required this.light,
    required this.lightHighContrast,
    required this.lightMediumContrast,
    required this.dark,
    required this.darkHighContrast,
    required this.darkMediumContrast,
  });
}

class ColorFamily {
  const ColorFamily({
    required this.color,
    required this.onColor,
    required this.colorContainer,
    required this.onColorContainer,
  });

  final Color color;
  final Color onColor;
  final Color colorContainer;
  final Color onColorContainer;
}
