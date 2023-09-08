import 'package:whatsapp/model/chat_model.dart';

class UserViewModel {
  Map<String, String> giveInfo(int index) {
    return {
      "userName": dummyChat[index].userName,
      "imgURL": dummyChat[index].imageURL,
      "userMessage": dummyChat[index].messages,
      "time": dummyChat[index].time
    };
  }
}
