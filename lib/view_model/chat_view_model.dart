import 'package:whatsapp/model/chat_model.dart';

void addMessages(String messageFromView) {
  dummyChat.add(ChatMessages(userMessages: messageFromView));
}
