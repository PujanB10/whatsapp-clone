import 'package:flutter/material.dart';
import 'package:whatsapp/screens/chat_page/widgets/chat_box.dart';
import 'package:whatsapp/screens/chat_page/view_model/chat_view_model.dart';
import 'package:provider/provider.dart';

class MessagesViewWidget extends StatelessWidget {
  const MessagesViewWidget({
    super.key,
    required this.usrName,
  });
  final String usrName;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        addAutomaticKeepAlives: false,
        itemCount: context.watch<ChatViewModel>().dummyChat[usrName].length,
        itemBuilder: ((BuildContext context, int index) => Column(
              //aligning left if received message and right if sent message
              crossAxisAlignment: (context
                      .watch<ChatViewModel>()
                      .dummyChat[usrName][index]!["isUser"])
                  ? CrossAxisAlignment.end
                  : CrossAxisAlignment.start,
              children: [
                ChatBox(
                    message: context
                        .watch<ChatViewModel>()
                        .dummyChat[usrName]![index]["message"],
                    isUser: context
                        .watch<ChatViewModel>()
                        .dummyChat[usrName]![index]["isUser"])
              ],
            )));
  }
}
