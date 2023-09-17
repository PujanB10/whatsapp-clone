import 'package:flutter/material.dart';
import 'package:whatsapp/screens/chat_page/model/chat_model.dart';

class ChatViewModel extends ChangeNotifier {
  static final Map<String, dynamic> _dummyChat = {
    "Pujan": [
      {"message": "Hey there! How's your day going?", "isUser": false},
    ],
    "Ram": [
      {"message": "I just tried a new recipe.", "isUser": false},
    ],
    "Shyam": [
      {"message": "Do you believe in aliens?", "isUser": false},
    ],
    "Gita": [
      {"message": "I can't wait for the weekend to relax.", "isUser": false},
    ],
    "Sita": [
      {"message": "Have you ever been on a trip?", "isUser": false},
    ],
    "Rakesh": [
      {"message": "What's your favorite book of all time?", "isUser": false},
    ],
    "Abishek": [
      {"message": "Just finished a great workout.", "isUser": false},
    ],
    "Rita": [
      {"message": "Thinking about starting a new hobby.", "isUser": false},
    ],
    "Nita": [
      {"message": "The weather today is so unpredictable.", "isUser": false},
    ],
  };

  Icon defaultIcon = const Icon(Icons.mic);

  Map get dummyChat => _dummyChat;

  /// Checks the existence of the user in the Static Variable [_dummyChat].
  /// If not, creates one. If it already exists adds the sent message
  /// to the Static Variable [_dummyChat]
  void addMessages(
      String userNameFromView, String messageFromView, bool isUserFromView) {
    ChatModel chat = ChatModel(
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
    notifyListeners();
  }

  /// Sets mic icon as default and changes the icon to send on calling the function.
  void setIcon() {
    defaultIcon = const Icon(Icons.send);
    notifyListeners();
  }
}
