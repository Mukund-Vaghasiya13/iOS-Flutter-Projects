import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
class MyThems {

static Color BackgroundColor = const Color.fromARGB(255, 237, 237, 237);
static Color DarkBackgroundColor = Colors.blueGrey.shade900;
static Color CardColor = Colors.white;
static Color DarkCardColor = Colors.black;
static Color ButtonColor = Colors.black;
static Color DarkButtonColor = Colors.indigoAccent;

static ThemeData lightThemData()
{
  return ThemeData(
    iconTheme: const IconThemeData(color: Colors.black),
    canvasColor: BackgroundColor,
    cardColor: CardColor,
    textTheme: TextTheme(
      labelMedium: GoogleFonts.lato(
            textStyle: const TextStyle(
              color: Colors.black,
              fontSize: 50,
              fontWeight: FontWeight.bold
            )
           ), 
          titleMedium:GoogleFonts.lato(
            textStyle: const TextStyle(
              color: Colors.black,
              fontSize: 15
            )
           ),
          labelLarge:GoogleFonts.lato(
            textStyle: const TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
              fontSize: 40
            ),
          ), 
          titleLarge: GoogleFonts.lato(
            textStyle: const TextStyle(
              color: Colors.black,
              fontSize: 20,
              fontWeight: FontWeight.bold
            ),
          ),
          titleSmall: GoogleFonts.lato(
            textStyle: const TextStyle(
              color: Colors.black,
            ),
          ),
        ),
    // ignore: deprecated_member_use
    buttonColor: ButtonColor,
    
  );
}

static ThemeData darkThemData()
{
  return ThemeData(
    canvasColor: DarkBackgroundColor,
    cardColor: DarkCardColor,
     iconTheme: const IconThemeData(color: Colors.white),
    textTheme: TextTheme(
        labelMedium: GoogleFonts.lato(
            textStyle: const TextStyle(
              color: Colors.white,
              fontSize: 50,
              fontWeight: FontWeight.bold
            )
           ),
          titleMedium:GoogleFonts.lato(
            textStyle: const TextStyle(
              color: Colors.white,
              fontSize: 15
            )
           ),
          labelLarge:GoogleFonts.lato(
            textStyle: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 30
            ),
          ), 
          titleLarge: GoogleFonts.lato(
            textStyle: const TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.bold
            ),
          ),
          titleSmall: GoogleFonts.lato(
            textStyle: const TextStyle(
              color: Colors.white,
            ),
          ),
        ),
    // ignore: deprecated_member_use
    buttonColor: DarkButtonColor,
   
  );
}


}