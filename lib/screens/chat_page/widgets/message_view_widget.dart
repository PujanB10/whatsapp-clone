import 'package:flutter/material.dart';
import 'package:whatsapp/screens/chat_page/widgets/chat_box.dart';
import 'package:whatsapp/screens/chat_page/view_model/chat_view_model.dart';
import 'package:provider/provider.dart';

/// A messages viewing widget for building a list of chat messages.
class MessagesViewWidget extends StatelessWidget {
  /// Creates a [MessagesViewWidget]
  ///
  /// [usrName] must not be null.
  const MessagesViewWidget({
    super.key,
    required this.usrName,
  });

  /// [usrName] is the username with whom the user's messages is to
  /// be displayed.
  final String usrName;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        addAutomaticKeepAlives: false,

        /// The numbers of messages present at an instance with the given user.
        itemCount: context.watch<ChatViewModel>().dummyChat[usrName].length,
        itemBuilder: ((BuildContext context, int index) => Column(
              /// Align at start if the message is received, align at
              /// the end if the message is sent.
              crossAxisAlignment: (context
                      .read<ChatViewModel>()
                      .dummyChat[usrName][index]!["isUser"])
                  ? CrossAxisAlignment.end
                  : CrossAxisAlignment.start,
              children: [
                ChatBox(
                    message: context
                        .read<ChatViewModel>()
                        .dummyChat[usrName]![index]["message"],
                    isUser: context
                        .read<ChatViewModel>()
                        .dummyChat[usrName]![index]["isUser"])
              ],
            )));
  }
}
