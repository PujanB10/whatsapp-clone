import 'package:flutter/material.dart';
import 'package:whatsapp/model/chat_model.dart';
import 'package:whatsapp/views/uitools/chatbox.dart';
import 'package:whatsapp/view_model/chat_view_model.dart';
import 'package:whatsapp/style/app_color.dart';
import 'package:whatsapp/style/app_font_sizes.dart';

class IndividualChats extends StatefulWidget {
  final String usrName;
  final String imgUrl;
  final String message;
  IndividualChats(this.usrName, this.imgUrl, this.message);
  @override
  State<StatefulWidget> createState() => IndividualChatState();
}

class IndividualChatState extends State<IndividualChats> {
  final textController = TextEditingController();
  late String textMessage;
  String message = "";
  int numberOfMessages = 0;
  bool isUser = false;
  var dynamicBottomBarIcon = const Icon(Icons.mic);
  void sendMessage() {
    setState(() {
      ChatViewModel().addMessages(widget.usrName, textMessage, isUser = true);
      textController.clear();
    });
  }

  void setIcon() {
    setState(() {
      dynamicBottomBarIcon = const Icon(Icons.send);
    });
  }

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
      appBar: PreferredSize(
          preferredSize: const Size.fromHeight(55),
          child: AppBarWidget(widget: widget)),
      body: ItemViewWidget(widget: widget),
      bottomNavigationBar: Padding(
        padding: MediaQuery.of(context).viewInsets,
        child: SizedBox(
          height: 50,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
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
                        // onTapOutside: resetIcon(),
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
                          prefixIcon: const Icon(Icons.emoji_emotions),
                          suffixIcon: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                iconInTextField(const Icon(Icons.attachment)),
                                iconInTextField(const Icon(Icons.camera_alt))
                              ]),
                        ))),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(1, 0, 4, 5),
                child: FloatingActionButton(
                  backgroundColor: AppColor.primary,
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

  Padding iconInTextField(Icon iconName) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: iconName,
    );
  }
}

class ItemViewWidget extends StatelessWidget {
  const ItemViewWidget({
    super.key,
    required this.widget,
  });

  final IndividualChats widget;

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

class AppBarWidget extends StatelessWidget {
  const AppBarWidget({
    super.key,
    required this.widget,
  });

  final IndividualChats widget;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Row(
        children: <Widget>[
          CircleAvatar(backgroundImage: AssetImage(widget.imgUrl)),
          const Padding(
            padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
          ),
          Text(widget.usrName)
        ],
      ),
      backgroundColor: AppColor.primary,
      actions: <Widget>[
        IconButton(onPressed: () {}, icon: const Icon(Icons.video_call_sharp)),
        IconButton(onPressed: () {}, icon: const Icon(Icons.call)),
        IconButton(onPressed: () {}, icon: const Icon(Icons.more_vert))
      ],
    );
  }
}
