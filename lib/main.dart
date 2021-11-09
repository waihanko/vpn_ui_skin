import 'package:flutter/material.dart';
import 'package:vpn_ui_skin/resources/colors.dart';
import 'package:vpn_ui_skin/screens/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        appBarTheme: const AppBarTheme(
          toolbarHeight: 72,
          color: Colors.white,
          iconTheme: IconThemeData(color: iconColor, size: 24),
          centerTitle: true,
          elevation: 0,
          titleTextStyle: TextStyle(
            color: titleTextColor,
            fontSize: 18,
            fontWeight: FontWeight.w700,
          ),
        ),
        primarySwatch: Colors.green,
        scaffoldBackgroundColor: Colors.white,
        iconTheme: IconThemeData(color: Colors.blueAccent[700], size: 20),
        primaryIconTheme:
            IconThemeData(color: Colors.blueAccent[700], size: 24),
      ),
      home: const HomeScreen(),
    );
  }
}
