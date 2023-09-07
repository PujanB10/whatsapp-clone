import 'package:whatsapp/model/chat_model.dart';

void addMessages(
    String userNameFromView, String messageFromView, bool isUserFromView) {
  if (dummyChat.containsKey(userNameFromView)) {
    dummyChat[userNameFromView]!["userMessages"].add(messageFromView);
  } else {
    ChatMessages chat = ChatMessages(
        userName: userNameFromView,
        messages: messageFromView,
        isUser: isUserFromView);
    Map<String?, dynamic> chatMap = chat.toMap();
    dummyChat.addEntries(chatMap.entries);
  }
}
