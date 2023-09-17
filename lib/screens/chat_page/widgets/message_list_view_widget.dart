import 'package:flutter/material.dart';
import 'package:whatsapp/screens/chat_page/widgets/chat_box.dart';
import 'package:whatsapp/screens/chat_page/view_model/chat_view_model.dart';
import 'package:provider/provider.dart';

/// A messages viewing widget for building a list of chat messages.
class MesssageListViewWidget extends StatelessWidget {
  /// Creates a [MesssageListViewWidget]
  ///
  /// [userName] must not be null.
  const MesssageListViewWidget({
    super.key,
    required this.userName,
  });

  /// [userName] is the username with whom the user's messages is to
  /// be displayed.
  final String userName;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      addAutomaticKeepAlives: false,

      /// The numbers of messages present at an instance with the given user.
      itemCount: context.watch<ChatViewModel>().dummyChat[userName].length,
      itemBuilder: ((BuildContext context, int index) => Column(
            /// Align at start if the message is received, align at
            /// the end if the message is sent.
            crossAxisAlignment: (context
                    .read<ChatViewModel>()
                    .dummyChat[userName][index]!["isUser"])
                ? CrossAxisAlignment.end
                : CrossAxisAlignment.start,
            children: [
              ChatBox(
                  message: context
                      .read<ChatViewModel>()
                      .dummyChat[userName]![index]["message"],
                  isUser: context
                      .read<ChatViewModel>()
                      .dummyChat[userName]![index]["isUser"])
            ],
          )),
    );
  }
}
