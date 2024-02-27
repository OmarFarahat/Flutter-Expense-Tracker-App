import 'package:flutter/material.dart';
import 'package:expense_tracker/widgets/expenses.dart';

//var kColorScheme= ColorScheme.fromSeed(seedColor: Color.fromARGB(255, 12, 87, 88),
var kColorScheme = ColorScheme.fromSeed(seedColor: Color.fromARGB(255, 12, 87, 88),
  brightness: Brightness.light,
  primary: Color(0xFF5085A4), // #ff5085a4
  secondary: Color(0xFF5085A4), // #ff5085a4
  surface: Color(0xFFFFFFFF), // #ffffffff
  background: Color(0xFFFF85AABF), // #ff85aabf
  error: Color(0xFFFB00020), // #ffb00020
  onPrimary: Color(0xFF000000), // #ff000000
  onSecondary: Color(0xFF000000), // #ff000000
  onSurface: Color(0xFF000000), // #ff000000
  onBackground: Color(0xFF000000), // #ff000000
  onError: Color(0xFFFFFFFF), // #ffffffff
);

var kDarkColorScheme = ColorScheme.fromSeed(seedColor: Color.fromARGB(255, 5, 99 ,125));

void main() {
  runApp(
     MaterialApp(
      darkTheme: ThemeData.dark().copyWith(
        brightness: Brightness.dark,
        colorScheme: kDarkColorScheme,
        appBarTheme: AppBarTheme().copyWith(
          backgroundColor: kDarkColorScheme.onPrimaryContainer,
          foregroundColor: Colors.white,

          centerTitle: true,
          shadowColor: Colors.black.withOpacity(0.5),
          elevation: 2
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(style: ElevatedButton.styleFrom(
          backgroundColor: kDarkColorScheme.primaryContainer,
          foregroundColor: kDarkColorScheme.onPrimaryContainer 
        )),
        cardTheme: CardTheme().copyWith(
          color: kDarkColorScheme.secondaryContainer,
          margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          elevation: 4,
          shadowColor: Colors.black.withOpacity(1),
          shape: RoundedRectangleBorder(  borderRadius: BorderRadius.circular(10)),

          
          
          
        )
      ),
      theme: ThemeData().copyWith(
        colorScheme: kColorScheme,
        appBarTheme: AppBarTheme().copyWith(
          backgroundColor: Color.fromARGB(166, 209, 209, 209),
          foregroundColor: Colors.black,
          centerTitle: true,
          shadowColor: Colors.black.withOpacity(0.5),
          elevation: 2

        ),
        cardTheme: CardTheme().copyWith(
          color: Color.fromARGB(255, 176, 202, 211),
          margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          elevation: 4,
          shadowColor: Colors.black.withOpacity(1),
          shape: RoundedRectangleBorder(  borderRadius: BorderRadius.circular(10)),
          
          
          
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(style: ElevatedButton.styleFrom(
          backgroundColor: Colors.white 
        )),
        textTheme: ThemeData().textTheme.copyWith(
          titleLarge: TextStyle(fontWeight: FontWeight.normal, color: Colors.black, fontSize: 14),)
      ),
    home: Expenses(),
    themeMode: ThemeMode.system,
    ),
  );
}

