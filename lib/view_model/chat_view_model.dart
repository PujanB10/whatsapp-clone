import 'package:whatsapp/model/chat_model.dart';

class ChatViewModel {
  void addMessages(
      String userNameFromView, String messageFromView, bool isUserFromView) {
    ChatMessages chat = ChatMessages(
        userName: userNameFromView,
        messages: messageFromView,
        isUser: isUserFromView);
    if (dummyChat.containsKey(userNameFromView)) {
      Map<String, dynamic> chatMap = chat.toMapExisting();
      dummyChat[userNameFromView]!
          .add({"message": messageFromView, "isUser": isUserFromView});
    } else {
      {
        Map<String, dynamic> chatMap = chat.toMapNew();
        dummyChat.addEntries(chatMap.entries);
      }
    }
  }
}
