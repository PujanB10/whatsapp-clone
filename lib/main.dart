import 'package:flutter/material.dart';
import 'package:whatsapp/views/home_page/home_page.dart';
import 'package:whatsapp/styles/app_color.dart';

void main() {
  runApp(const MainApp());
}

// Main app from where the app starts.
class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Whatsapp',

      /// Setting the theme of the app.
      theme: ThemeData(
          primaryColor: AppColor.primary,
          appBarTheme: const AppBarTheme(color: AppColor.primary),
          floatingActionButtonTheme: const FloatingActionButtonThemeData(
              backgroundColor: AppColor.primary)),
      home: const HomePage(),
    );
  }
}
