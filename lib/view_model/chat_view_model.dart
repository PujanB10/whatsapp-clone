import 'package:whatsapp/model/chat_model.dart';

class ChatViewModel {
  //checks the existence of user in the model, adds if it does not exist
  //adds message if the user already exists
  void addMessages(
      String userNameFromView, String messageFromView, bool isUserFromView) {
    ChatMessages chat = ChatMessages(
        userName: userNameFromView,
        messages: messageFromView,
        isUser: isUserFromView);
    if (dummyChat.containsKey(userNameFromView)) {
      // Map<String, dynamic> chatMap = chat.toMapExisting();
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
