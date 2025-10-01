import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:imcflutter/pages/login_page.dart';
import 'package:imcflutter/shared/widgets/appcolors.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LoginPage(),
      theme: 
      ThemeData(
        inputDecorationTheme: InputDecorationTheme(
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Appcolors.bluedark)
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Appcolors.bluelight)
          ),
          labelStyle: TextStyle(color: Appcolors.bluedark),
        ),

        brightness: Brightness.light,
        primaryColor: Colors.black,
        primarySwatch: Colors.blue,
        textTheme: GoogleFonts.openSansTextTheme(),

        textSelectionTheme: TextSelectionThemeData(
          cursorColor: Appcolors.bluelight,
        ),

        textButtonTheme: TextButtonThemeData(
          style: TextButton.styleFrom(
            foregroundColor: Appcolors.bluedark
          )
        )
      ),
    );
  }
} 