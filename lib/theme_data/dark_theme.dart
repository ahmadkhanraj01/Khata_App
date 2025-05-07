import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DarkThemeData {
  ThemeData darkTheme = ThemeData(
    listTileTheme: ListTileThemeData(
      textColor: Colors.white,
      iconColor: Colors.white,
      contentPadding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      tileColor: const Color(0xff1a1a2e),
      selectedTileColor: Colors.blueAccent,
      style: ListTileStyle.list,
      titleTextStyle: GoogleFonts.openSans(
        textStyle: const TextStyle(
          color: Colors.white,
          fontSize: 30,
        ),
      ), // Applying text style to title
    ),

    // Drawer theme with a background and text styling
    drawerTheme: const DrawerThemeData(
      shadowColor: Color(0xff1a1a2e),
      backgroundColor: Color(0xff1a1a2e),
      elevation: 10,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.horizontal(
          left: Radius.circular(20),
          right: Radius.circular(20),
        ),
      ),
    ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style:ElevatedButton.styleFrom(
      padding: const EdgeInsets.all(15),
      elevation: 0,
      backgroundColor: const Color(0xFFFF7643),
      foregroundColor: Colors.white,
      minimumSize: const Size(double.infinity, 48),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(16)),
      ),
    ),
  ),
    // Switch theme customization
    switchTheme: SwitchThemeData(
      thumbColor: WidgetStateProperty.all(Colors.black),
      thumbIcon: WidgetStateProperty.all(
        const Icon(Icons.nightlight_round, color: Colors.white),
      ),
    ),

    // App bar theme
    appBarTheme: AppBarTheme(
      iconTheme: const IconThemeData(color: Colors.white),
      color: const Color(0xff00001c),
      titleTextStyle: GoogleFonts.openSans(
        textStyle: const TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.w800,
          fontSize: 35,
        ),
      ),
    ),

    // Scaffold background color for dark mode
    scaffoldBackgroundColor: const Color(0xff00002a),

    textButtonTheme: TextButtonThemeData(
      style: ButtonStyle(
        foregroundColor: WidgetStateProperty.all(Colors.white),
        textStyle: WidgetStateProperty.all(
          GoogleFonts.openSans(
            textStyle: const TextStyle(
              color: Colors.white,
              fontSize: 30,
            ),
          ),
        ),
        shape: WidgetStateProperty.all(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20), // Button radius set to 20
          ),
        ),
      ),
    ),

    // Text form field theme with custom border and styles
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: const Color(0xff1a1a2e), // Background color of TextFormField
      contentPadding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 20.0),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(20), // Radius set to 20
        borderSide: const BorderSide(
          color: Colors.white54, // Default border color
        ),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(20), // Radius when focused
        borderSide: const BorderSide(
          color: Colors.blueAccent, // Border color when focused
          width: 2.0,
        ),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(20), // Radius for enabled state
        borderSide: const BorderSide(
          color: Colors.white54, // Border color when enabled
          width: 1.5,
        ),
      ),
      hintStyle: const TextStyle(color: Colors.white38), // Hint text style
      labelStyle: const TextStyle(color: Colors.white), // Label text style
    ),

    // Adding full TextTheme
    textTheme: TextTheme(
      // Display styles
      displayLarge: GoogleFonts.openSans(
        textStyle: const TextStyle(
          color: Colors.white,
          fontSize: 96,
          fontWeight: FontWeight.w300,
        ),
      ),
      displayMedium: GoogleFonts.openSans(
        textStyle: const TextStyle(
          color: Colors.white,
          fontSize: 60,
          fontWeight: FontWeight.w300,
        ),
      ),
      displaySmall: GoogleFonts.openSans(
        textStyle: const TextStyle(
          color: Colors.white,
          fontSize: 48,
          fontWeight: FontWeight.w400,
        ),
      ),

      // Headline styles
      headlineLarge: GoogleFonts.openSans(
        textStyle: const TextStyle(
          color: Colors.white,
          fontSize: 34,
          fontWeight: FontWeight.w400,
        ),
      ),
      headlineMedium: GoogleFonts.openSans(
        textStyle: const TextStyle(
          color: Colors.white,
          fontSize: 24,
          fontWeight: FontWeight.w400,
        ),
      ),
      headlineSmall: GoogleFonts.openSans(
        textStyle: const TextStyle(
          color: Colors.white,
          fontSize: 20,
          fontWeight: FontWeight.w500,
        ),
      ),

      // Title styles
      titleLarge: GoogleFonts.openSans(
        textStyle: const TextStyle(
          color: Colors.white70,
          fontSize: 16,
          fontWeight: FontWeight.w400,
        ),
      ),
      titleMedium: GoogleFonts.openSans(
        textStyle: const TextStyle(
          color: Colors.white70,
          fontSize: 14,
          fontWeight: FontWeight.w500,
        ),
      ),
      titleSmall: GoogleFonts.openSans(
        textStyle: const TextStyle(
          color: Colors.white70,
          fontSize: 14,
          fontWeight: FontWeight.w500,
        ),
      ),

      // Body text styles
      bodyLarge: GoogleFonts.openSans(
        textStyle: const TextStyle(
          color: Colors.white,
          fontSize: 16,
          fontWeight: FontWeight.w400,
        ),
      ),
      bodyMedium: GoogleFonts.openSans(
        textStyle: const TextStyle(
          color: Colors.white70,
          fontSize: 14,
          fontWeight: FontWeight.w400,
        ),
      ),
      bodySmall: GoogleFonts.openSans(
        textStyle: const TextStyle(
          color: Colors.white70,
          fontSize: 12,
          fontWeight: FontWeight.w400,
        ),
      ),

      // Label (button) styles
      labelLarge: GoogleFonts.openSans(
        textStyle: const TextStyle(
          color: Colors.white,
          fontSize: 14,
          fontWeight: FontWeight.w500,
        ),
      ),
      labelMedium: GoogleFonts.openSans(
        textStyle: const TextStyle(
          color: Colors.white70,
          fontSize: 12,
          fontWeight: FontWeight.w400,
        ),
      ),
      labelSmall: GoogleFonts.openSans(
        textStyle: const TextStyle(
          color: Colors.white70,
          fontSize: 10,
          fontWeight: FontWeight.w400,
        ),
      ),
    ),
  );
}
