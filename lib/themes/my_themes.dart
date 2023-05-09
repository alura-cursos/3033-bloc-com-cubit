import 'package:flutter/material.dart';

abstract class MyThemes {
  MyThemes();

  static final Map<String, Color>_genreColors = {"default": Colors.white, "Suspense": Colors.red, "Terror": Colors.yellow, "Comédia": Colors.green, "Drama": Colors.red};

  static final Map<String, Brightness>_genreBrightness = {"default": Brightness.light, "Suspense": Brightness.dark, "Terror": Brightness.dark, "Comédia": Brightness.light, "Drama": Brightness.light};

  static ThemeData getTheme(String? genre) {

    return ThemeData(
      useMaterial3: true,
      colorSchemeSeed: _genreColors[genre],
      brightness: _genreBrightness[genre],
      fontFamily: 'Poppins',
      textTheme: const TextTheme(
          displaySmall: TextStyle(
            fontSize: 16,
            overflow: TextOverflow.ellipsis,
          ),
          displayMedium: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            overflow: TextOverflow.ellipsis,
          ),
          displayLarge: TextStyle(
            fontSize: 36,
            fontWeight: FontWeight.w700,
            overflow: TextOverflow.ellipsis,
          ),
          labelMedium: TextStyle(
            color: Colors.white,
            fontSize: 16,
            fontWeight: FontWeight.bold,
            overflow: TextOverflow.ellipsis,
          )),
    );
  }
}
