import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_diary/src/providers/entry_provider.dart';
import 'package:my_diary/src/screens/home.dart';
import 'package:provider/provider.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => EntryProvider(),
      child: MaterialApp(
          home: HomeScreen(),
          theme: ThemeData(
            accentColor: Colors.pinkAccent,
            primaryColor: Colors.black,
            textTheme: GoogleFonts.patrickHandScTextTheme(),
          )),
    );
  }
}