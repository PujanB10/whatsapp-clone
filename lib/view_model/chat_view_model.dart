import 'package:whatsapp/model/chat_model.dart';

class ChatViewModel {
  void addMessages(
      String userNameFromView, String messageFromView, bool isUserFromView) {
    if (dummyChat.containsKey(userNameFromView)) {
      dummyChat[userNameFromView]!["userMessages"].add(messageFromView);
      dummyChat[userNameFromView]!["isUser"] = isUserFromView;
    } else {
      ChatMessages chat = ChatMessages(
          userName: userNameFromView,
          messages: messageFromView,
          isUser: isUserFromView);
      Map<String?, dynamic> chatMap = chat.toMap();
      dummyChat.addEntries(chatMap.entries);
    }
  }
}
