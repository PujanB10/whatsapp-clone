import 'package:flutter/material.dart';
import 'package:whatsapp/model/chat_model.dart';
import 'package:whatsapp/views/uitools/chat_box.dart';
import 'package:whatsapp/view_model/chat_view_model.dart';
import 'package:whatsapp/style/app_font_sizes.dart';
import 'package:whatsapp/views/uitools/app_bar_widget.dart';

/// Private chat page of the app.
class ChatPage extends StatefulWidget {
  final String usrName;
  final String imgUrl;
  final String message;

  /// Private chat page that opens after having clicked
  /// a particular user from the home page.
  const ChatPage(this.usrName, this.imgUrl, this.message, {super.key});
  @override
  State<StatefulWidget> createState() => ChatPageBody();
}

class ChatPageBody extends State<ChatPage> {
  final textController = TextEditingController();
  late String textMessage;
  String message = "";
  int numberOfMessages = 0;
  bool isUser = false;
  var dynamicBottomBarIcon = const Icon(Icons.mic);

  /// Adds the message to the model so as to extract later.
  void sendMessage() {
    setState(() {
      ChatViewModel().addMessages(widget.usrName, textMessage, isUser = true);
      textController.clear();
    });
  }

  /// Transforms the icon from mic to send on typing something in
  /// message field.
  void setIcon() {
    setState(() {
      dynamicBottomBarIcon = const Icon(Icons.send);
    });
  }

  /// Resets the icon back to mic after having sent the message.
  void resetIcon() {
    setState(() {
      dynamicBottomBarIcon = const Icon(Icons.mic);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: Colors.blueGrey.shade100,

      /// Calls the custom AppBar widget.
      appBar: PreferredSize(
          preferredSize: const Size.fromHeight(55),
          child: AppBarWidget(
            username: widget.usrName,
            imageUrl: widget.imgUrl,
            bgColor: Theme.of(context).primaryColor,
          )),

      /// Calls the chat message builder.
      body: MessagesViewWidget(widget: widget),
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
                          setIcon();
                        },
                        textAlignVertical: TextAlignVertical.bottom,
                        decoration: InputDecoration(
                          hintText: "Message",
                          hintStyle:
                              const TextStyle(fontSize: AppFontSizes.medium),
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
                  backgroundColor: Theme.of(context).primaryColor,
                  onPressed: sendMessage,
                  child: dynamicBottomBarIcon,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  /// Builds the icons in the suffix of the message text field.
  Widget buildIconsInMessageField(Icon iconName) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: iconName,
    );
  }
}

/// Builds the list of chat messages that comes in from the model.
class MessagesViewWidget extends StatelessWidget {
  const MessagesViewWidget({
    super.key,
    required this.widget,
  });

  final ChatPage widget;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        addAutomaticKeepAlives: false,
        itemCount: dummyChat[widget.usrName].length,
        itemBuilder: ((BuildContext context, int index) => Column(
              //aligning left if received message and right if sent message
              crossAxisAlignment: (dummyChat[widget.usrName][index]!["isUser"])
                  ? CrossAxisAlignment.end
                  : CrossAxisAlignment.start,
              children: [
                ChatBox(
                    message: dummyChat[widget.usrName]![index]["message"],
                    isUser: dummyChat[widget.usrName]![index]["isUser"])
              ],
            )));
  }
}
