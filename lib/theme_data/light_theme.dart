import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/material.dart';

class LightThemeData {
  ThemeData lightTheme = ThemeData(
    // ListTile theme with custom styling
    listTileTheme: ListTileThemeData(
      textColor: Colors.black,
      iconColor: Colors.black,
      contentPadding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      tileColor: Colors.white,
      selectedTileColor: Colors.blueAccent,
      style: ListTileStyle.list,
      titleTextStyle: GoogleFonts.roboto(
        textStyle: const TextStyle(
          color: Colors.black,
          fontSize: 30,
        ),
      ),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style:ElevatedButton.styleFrom(
        padding: const EdgeInsets.all(15),
        elevation: 0,
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        minimumSize: const Size(double.infinity, 48),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(16)),
        ),
      ),
    ),
    // Drawer theme with background and text styling
    drawerTheme: const DrawerThemeData(
      shadowColor: Colors.white54,
      backgroundColor: Colors.white,
      elevation: 10,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.horizontal(
          left: Radius.circular(20),
          right: Radius.circular(20),
        ),
      ),
    ),

    // Switch theme customization
    switchTheme: SwitchThemeData(
      trackColor: WidgetStateProperty.all(Colors.yellow),
      thumbColor: WidgetStateProperty.all(Colors.blueAccent),
      thumbIcon:
          WidgetStateProperty.all(const Icon(Icons.sunny, color: Colors.yellow)),
    ),

    // App bar theme
    appBarTheme: AppBarTheme(
      iconTheme: const IconThemeData(color: Colors.black),
      color: Colors.blueAccent,
      titleTextStyle: GoogleFonts.roboto(
        textStyle: const TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.w800,
          fontSize: 35,
        ),
      ),
    ),

    // Scaffold background color for light mode
    scaffoldBackgroundColor: Colors.lightBlue,

    // Text theme customization
    textTheme: TextTheme(
      // Display styles
      displayLarge: GoogleFonts.roboto(
        textStyle: const TextStyle(
          color: Colors.black,
          fontSize: 96,
          fontWeight: FontWeight.w300,
        ),
      ),
      displayMedium: GoogleFonts.roboto(
        textStyle: const TextStyle(
          color: Colors.black,
          fontSize: 60,
          fontWeight: FontWeight.w300,
        ),
      ),
      displaySmall: GoogleFonts.roboto(
        textStyle: const TextStyle(
          color: Colors.black,
          fontSize: 48,
          fontWeight: FontWeight.w400,
        ),
      ),

      // Headline styles
      headlineLarge: GoogleFonts.roboto(
        textStyle: const TextStyle(
          color: Colors.black,
          fontSize: 34,
          fontWeight: FontWeight.w400,
        ),
      ),
      headlineMedium: GoogleFonts.roboto(
        textStyle: const TextStyle(
          color: Colors.black,
          fontSize: 24,
          fontWeight: FontWeight.w400,
        ),
      ),
      headlineSmall: GoogleFonts.roboto(
        textStyle: const TextStyle(
          color: Colors.black,
          fontSize: 20,
          fontWeight: FontWeight.w500,
        ),
      ),

      // Title styles
      titleLarge: GoogleFonts.roboto(
        textStyle: const TextStyle(
          color: Colors.black87,
          fontSize: 16,
          fontWeight: FontWeight.w400,
        ),
      ),
      titleMedium: GoogleFonts.roboto(
        textStyle: const TextStyle(
          color: Colors.black87,
          fontSize: 14,
          fontWeight: FontWeight.w500,
        ),
      ),
      titleSmall: GoogleFonts.roboto(
        textStyle: const TextStyle(
          color: Colors.black87,
          fontSize: 14,
          fontWeight: FontWeight.w500,
        ),
      ),

      // Body text styles
      bodyLarge: GoogleFonts.roboto(
        textStyle: const TextStyle(
          color: Colors.black,
          fontSize: 16,
          fontWeight: FontWeight.w400,
        ),
      ),
      bodyMedium: GoogleFonts.roboto(
        textStyle: const TextStyle(
          color: Colors.black54,
          fontSize: 14,
          fontWeight: FontWeight.w400,
        ),
      ),
      bodySmall: GoogleFonts.roboto(
        textStyle: const TextStyle(
          color: Colors.black54,
          fontSize: 12,
          fontWeight: FontWeight.w400,
        ),
      ),

      // Label (button) styles
      labelLarge: GoogleFonts.roboto(
        textStyle: const TextStyle(
          color: Colors.black,
          fontSize: 14,
          fontWeight: FontWeight.w500,
        ),
      ),
      labelMedium: GoogleFonts.roboto(
        textStyle: const TextStyle(
          color: Colors.black54,
          fontSize: 12,
          fontWeight: FontWeight.w400,
        ),
      ),
      labelSmall: GoogleFonts.roboto(
        textStyle: const TextStyle(
          color: Colors.black54,
          fontSize: 10,
          fontWeight: FontWeight.w400,
        ),
      ),
    ),

    // Text button theme with custom styles
    textButtonTheme: TextButtonThemeData(
      style: ButtonStyle(
        foregroundColor: WidgetStateProperty.all(Colors.black),
        textStyle: WidgetStateProperty.all(
          GoogleFonts.roboto(
            textStyle: const TextStyle(
              color: Colors.black,
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
      fillColor: Colors.white, // Background color of TextFormField
      contentPadding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 20.0),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(20), // Radius set to 20
        borderSide: const BorderSide(
          color: Colors.black54, // Default border color
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
          color: Colors.black54, // Border color when enabled
          width: 1.5,
        ),
      ),
      hintStyle: const TextStyle(color: Colors.black38), // Hint text style
      labelStyle: const TextStyle(color: Colors.black), // Label text style
    ),
  );
}
