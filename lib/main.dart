import 'package:flutter/material.dart';
import 'package:whatsapp/views/home_page.dart';
import 'package:whatsapp/style/app_color.dart';

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
      ),
      home: const HomePage(),
    );
  }
}
