import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hexcolor/hexcolor.dart';

class MyColor {
  static Color red = const Color.fromRGBO(255, 28, 39, 1);
  static Color white = const Color.fromRGBO(255, 255, 255, 1);
  static Color black = const Color.fromRGBO(5, 5, 5, 1);
  static Color mainColor = HexColor('#ff565a');
  static Color grey = HexColor('#CCCCCC');
  static Color secondryColor = HexColor('#FEE5E0');
  static Color transparent = Colors.transparent;
}

ThemeData lightTheme(context) => ThemeData(
    cardTheme: CardTheme(
        clipBehavior: Clip.antiAliasWithSaveLayer,
        shape:
            OutlineInputBorder(borderSide: BorderSide(color: MyColor.black))),
    scaffoldBackgroundColor: MyColor.white,
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      elevation: 1.5,
      backgroundColor: MyColor.white,
      type: BottomNavigationBarType.fixed,
      showUnselectedLabels: true,
      selectedIconTheme: IconThemeData(color: MyColor.red, size: 25),
      unselectedIconTheme: IconThemeData(color: MyColor.black, size: 20),
      unselectedLabelStyle: TextStyle(fontSize: 12, color: MyColor.black),
      selectedLabelStyle:
          const TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
      selectedItemColor: MyColor.red,
      unselectedItemColor: MyColor.black,
    ),
    appBarTheme: AppBarTheme(
        backgroundColor: MyColor.mainColor,
        actionsIconTheme: const IconThemeData(color: Colors.black),
        titleTextStyle: TextStyle(color: MyColor.black, fontSize: 30),
        elevation: 0.0,
        iconTheme: IconThemeData(color: MyColor.white),
        systemOverlayStyle: SystemUiOverlayStyle(
            statusBarIconBrightness: Brightness.dark,
            statusBarBrightness: Brightness.light,
            statusBarColor: MyColor.mainColor)),
    inputDecorationTheme: InputDecorationTheme(
        errorBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.red, width: 1.9)),
        labelStyle: Theme.of(context).textTheme.titleSmall,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5),
        ),
        focusedErrorBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.red))),
    textTheme: TextTheme(
      bodyLarge: TextStyle(color: MyColor.black),
      bodyMedium: TextStyle(color: MyColor.black),
      titleMedium: TextStyle(color: MyColor.black),
      titleSmall: TextStyle(color: MyColor.black),
      titleLarge: TextStyle(color: MyColor.black),
    ));

ThemeData darkTheme(context) => ThemeData(
    floatingActionButtonTheme: FloatingActionButtonThemeData(
        backgroundColor: HexColor('#2D3C48'),
        shape: OutlineInputBorder(
            borderSide: BorderSide(color: MyColor.white, width: 3),
            borderRadius: BorderRadius.circular(50.0))),
    iconTheme: IconThemeData(color: MyColor.white),
    cardColor: HexColor('#2D3C48'),
    cardTheme: CardTheme(
        clipBehavior: Clip.antiAliasWithSaveLayer,
        shape:
            OutlineInputBorder(borderSide: BorderSide(color: MyColor.white))),
    scaffoldBackgroundColor: HexColor('#2D3C48'),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      elevation: 0,
      backgroundColor: HexColor('#2D3C48'),
      type: BottomNavigationBarType.fixed,
      showUnselectedLabels: true,
      selectedIconTheme: IconThemeData(color: MyColor.red, size: 25),
      unselectedIconTheme: IconThemeData(color: MyColor.white, size: 20),
      unselectedLabelStyle: TextStyle(fontSize: 12, color: MyColor.white),
      selectedLabelStyle:
          const TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
      selectedItemColor: MyColor.red,
      unselectedItemColor: MyColor.white,
    ),
    appBarTheme: AppBarTheme(
        actionsIconTheme: const IconThemeData(color: Colors.white),
        titleTextStyle: const TextStyle(color: Colors.white, fontSize: 30),
        color: HexColor('#2D3C48'),
        elevation: 0,
        iconTheme: IconThemeData(color: MyColor.white),
        systemOverlayStyle: SystemUiOverlayStyle(
            statusBarIconBrightness: Brightness.light,
            statusBarBrightness: Brightness.dark,
            statusBarColor: HexColor('#2D3C48'))),
    inputDecorationTheme: InputDecorationTheme(
        enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: MyColor.white, width: 1.9),
            borderRadius: BorderRadius.circular(5.0)),
        errorBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.red, width: 1.9)),
        labelStyle: Theme.of(context)
            .textTheme
            .titleSmall!
            .copyWith(color: MyColor.white),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5),
        ),
        focusedErrorBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.red))),
    textTheme: TextTheme(
      bodyLarge: TextStyle(color: MyColor.white),
      bodyMedium: TextStyle(color: MyColor.white),
      titleMedium: TextStyle(color: MyColor.white),
      titleSmall: TextStyle(color: MyColor.white),
      titleLarge: TextStyle(color: MyColor.white),
    ));
