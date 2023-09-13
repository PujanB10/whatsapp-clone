import 'package:flutter/material.dart';
import 'package:whatsapp/screens/chat_page/widgets/message_view_widget.dart';
import 'package:whatsapp/screens/chat_page/widgets/app_bar_widget.dart';
import 'package:whatsapp/screens/chat_page/widgets/bottom_nav_bar_widget.dart';
import 'package:provider/provider.dart';
import 'package:whatsapp/screens/chat_page/view_model/chat_view_model.dart';

/// A private chat page for viewing and sending messages.
class ChatPage extends StatelessWidget {
  /// Creates a [ChatPage] widget.
  ///
  /// [usrName], [imgUrl] and [message] must not be null.
  ///
  /// [usrName] is the username, [imgUrl] is the Url of image and [message] is the
  /// last message of the user of whom the private chat page is to
  /// be opened.
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
    return ChangeNotifierProvider(
        create: (context) => ChatViewModel(),
        child: Scaffold(
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
        ));
  }
}
