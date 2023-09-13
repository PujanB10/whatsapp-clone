import 'package:flutter/material.dart';
import 'package:whatsapp/screens/chat_page/widgets/message_view_widget.dart';
import 'package:whatsapp/screens/chat_page/widgets/app_bar_widget.dart';
import 'package:whatsapp/screens/chat_page/widgets/bottom_nav_bar_widget.dart';

/// Private chat page of the app.
class ChatPage extends StatelessWidget {
  /// Private chat page that opens after having clicked
  /// a particular user from the home page.
  const ChatPage(
      {required this.usrName,
      required this.imgUrl,
      required this.message,
      super.key});
  final String usrName;
  final String imgUrl;
  final String message;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: Colors.blueGrey.shade100,

      /// Calls the custom AppBar
      appBar: AppBarWidget(
        username: usrName,
        imageUrl: imgUrl,
      ),

      /// Calls the chat message builder.
      body: MessagesViewWidget(usrName: usrName),

      /// Calls the Bottom Navigation Bar widget.
      bottomNavigationBar: BottomNavBar(
        usrName: usrName,
      ),
    );
  }
}