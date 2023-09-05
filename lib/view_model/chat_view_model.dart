import 'package:whatsapp/model/chat_model.dart';

void addMessages(String messageFromView, String userNameFromView) {
  if (dummyChat.containsKey(userNameFromView)) {
    dummyChat[userNameFromView]?.add(messageFromView);
  } else {
    dummyChat[userNameFromView] = [];
    dummyChat[userNameFromView]?.add(messageFromView);
  }
}
