import 'package:device_preview/device_preview.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:meals/screens/filters.dart';
import 'package:meals/screens/tabs_screen.dart';

/*
  In Flutter, ThemeData is the object that holds the visual styling for your app, such as colors, fonts, and overall design rules.
  
  The line colorScheme: ColorScheme.fromSeed( starts defining the app’s color palette. A color scheme is a set of related colors that Flutter can use consistently across your UI. The fromSeed method generates that scheme automatically from one base color instead of you manually specifying every color.

  The next line, brightness: Brightness.dark,, tells Flutter to create a dark-themed color palette rather than a light one. This means the app will use darker background colors and lighter text colors by default.

The line seedColor: const Color.fromARGB(255, 131, 57, 0), provides the base color that the theme is built around.

The final line, textTheme: GoogleFonts.latoTextTheme(),, applies a text style set based on the Lato font. GoogleFonts is a package that lets you use many popular fonts, and latoTextTheme() creates a predefined set of text styles for that font. This makes your app’s text look consistent and styled without having to define each font manually.
 */

final theme = ThemeData(
  colorScheme: ColorScheme.fromSeed(
    seedColor: const Color.fromARGB(255, 246, 220, 200),
    brightness: Brightness.dark,
  ),
  textTheme: GoogleFonts.latoTextTheme(),
);

void main() {
  runApp(
    DevicePreview(enabled: !kReleaseMode, builder: (context) => const App()),
  );
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      locale: DevicePreview.locale(context),
      builder: DevicePreview.appBuilder,
      theme: theme,
      home: TabsScreen(),
    );
  }
}
