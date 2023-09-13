import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:whatsapp/screens/chat_page/widgets/message_view_widget.dart';
import 'package:whatsapp/screens/chat_page/view_model/chat_view_model.dart';
import 'package:whatsapp/utils/styles/app_font_sizes.dart';
import 'package:whatsapp/screens/chat_page/widgets/app_bar_widget.dart';

/// Private chat page of the app.
class ChatPage extends StatelessWidget {
  final String usrName;
  final String imgUrl;
  final String message;

  /// Private chat page that opens after having clicked
  /// a particular user from the home page.
  ChatPage(this.usrName, this.imgUrl, this.message, {super.key});
  final textController = TextEditingController();
  late String textMessage;
  var dynamicBottomBarIcon = const Icon(Icons.mic);

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
      bottomNavigationBar: Padding(
        padding: MediaQuery.of(context).viewInsets,
        child: SizedBox(
          height: 50,
          child: Row(
            children: [
              Expanded(
                child: Padding(
                    padding: const EdgeInsets.fromLTRB(7, 0, 4, 8),
                    child: TextField(
                        controller: textController,
                        onChanged: (value) {
                          textMessage = value;
                          context.read<ChatViewModel>().setIcon();
                        },
                        textAlignVertical: TextAlignVertical.bottom,
                        decoration: InputDecoration(
                          hintText: "Message",
                          hintStyle: const TextStyle(
                              fontSize: AppFontSizes.smallMedium),
                          fillColor: Colors.white,
                          filled: true,
                          enabledBorder: OutlineInputBorder(
                              borderSide: const BorderSide(color: Colors.white),
                              borderRadius: BorderRadius.circular(20)),

                          /// Adds a prefix icon in front of the message text
                          /// field.
                          prefixIcon: const Icon(Icons.emoji_emotions),
                          suffixIcon: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                buildIconsInMessageField(
                                    const Icon(Icons.attachment)),
                                buildIconsInMessageField(
                                    const Icon(Icons.camera_alt))
                              ]),
                        ))),
              ),

              /// Send or Record button that resides in the bottom navigation
              /// bar alongside message text field.
              Padding(
                padding: const EdgeInsets.fromLTRB(1, 0, 4, 5),
                child: FloatingActionButton(
                  onPressed: () {
                    context
                        .read<ChatViewModel>()
                        .addMessages(usrName, textMessage, true);
                    textController.clear();
                  },
                  child: context.watch<ChatViewModel>().defaultIcon,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

/// Builds the icons in the suffix of the message text field.
Widget buildIconsInMessageField(Icon iconName) {
  return Padding(
    padding: const EdgeInsets.all(8),
    child: iconName,
  );
}

/// Builds the list of chat messages that comes in from the model.

