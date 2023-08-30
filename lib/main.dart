import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Whatsapp',
        home: Scaffold(
          appBar: AppBar(
              title: Text('Whatsapp'),
              backgroundColor: Color(0xFF128c7e),
              actions: <Widget>[
                IconButton(
                  icon: Icon(Icons.camera_alt_outlined),
                  onPressed: () {},
                ),
                IconButton(
                  icon: Icon(Icons.search),
                  onPressed: () {},
                ),
                IconButton(
                  icon: Icon(Icons.more_vert),
                  onPressed: () {},
                )
              ]),
        ));
  }
}
