import 'dart:developer';

import 'package:expenses_app/widgets/expenses.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

// ignore: must_be_immutable
class MyApp extends StatelessWidget {
  MyApp({super.key});
  var myColorScheme = ColorScheme.fromSeed(
    seedColor: const Color.fromARGB(255, 55, 130, 201),
  );
  var myDarkColorScheme = ColorScheme.fromSeed(
    seedColor: const Color.fromARGB(255, 55, 130, 201),
  );
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    log(MediaQuery.of(context).size.width.toString());
    log(MediaQuery.of(context).size.height.toString());
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      themeMode: ThemeMode.system,
      theme: ThemeData().copyWith(
        useMaterial3: true,
        colorScheme: myColorScheme,
        appBarTheme: const AppBarTheme().copyWith(
          backgroundColor: myColorScheme.onPrimaryContainer,
          foregroundColor: myColorScheme.primaryContainer,
        ),
        cardTheme: const CardTheme().copyWith(
          color: myColorScheme.secondaryContainer,
          margin: const EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 8,
          ),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: myColorScheme.secondaryContainer,
          ),
        ),
        textTheme: ThemeData().textTheme.copyWith(
              titleLarge: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.normal,
                color: myColorScheme.onSecondaryContainer,
              ),
            ),
      ),
      darkTheme: ThemeData.dark().copyWith(
        useMaterial3: true,
        colorScheme: myDarkColorScheme,
        appBarTheme: const AppBarTheme().copyWith(
          backgroundColor: myDarkColorScheme.onPrimaryContainer,
          foregroundColor: myDarkColorScheme.primaryContainer,
        ),
        bottomSheetTheme: BottomSheetThemeData().copyWith(
          backgroundColor: myDarkColorScheme.onPrimaryContainer,
        ),
        cardTheme: const CardTheme().copyWith(
          color: myDarkColorScheme.secondaryContainer,
          margin: const EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 8,
          ),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: myDarkColorScheme.secondaryContainer,
          ),
        ),
        textTheme: ThemeData().textTheme.copyWith(
              titleLarge: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.normal,
                color: myDarkColorScheme.onSecondaryContainer,
              ),
            ),
      ),
      home: const Expenses(),
    );
  }
}
