import 'package:flutter/material.dart';
import 'package:whatsapp/screens/chat_page/widgets/message_list_view_widget.dart';
import 'package:whatsapp/screens/chat_page/widgets/chatpage_app_bar_widget.dart';
import 'package:whatsapp/screens/chat_page/widgets/bottom_nav_bar_widget.dart';
import 'package:provider/provider.dart';
import 'package:whatsapp/screens/chat_page/view_model/chat_view_model.dart';

/// A private chat page for viewing and sending messages.
class ChatPage extends StatelessWidget {
  /// Creates a [ChatPage] widget.
  ///
  /// [userName], [imageUrl] and [message] must not be null.
  ///
  /// [userName] is the username, [imageUrl] is the Url of image and [message] is the
  /// last message of the user of whom the private chat page is to
  /// be opened.
  const ChatPage(
      {required this.userName,
      required this.imageUrl,
      required this.message,
      super.key});
  final String userName;
  final String imageUrl;
  final String message;

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (context) => ChatViewModel(),
        child: Scaffold(
          resizeToAvoidBottomInset: true,
          backgroundColor: Colors.blueGrey.shade100,

          /// Calls the custom AppBar
          appBar: ChatPageAppBarWidget(
            username: userName,
            imageUrl: imageUrl,
          ),

          /// Calls the chat message builder.
          body: MesssageListViewWidget(userName: userName),

          /// Calls the Bottom Navigation Bar widget.
          bottomNavigationBar: BottomNavBar(
            userName: userName,
          ),
        ));
  }
}
