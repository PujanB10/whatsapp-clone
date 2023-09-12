import 'package:whatsapp/screens/home_page/model/user_model.dart';

class UserViewModel {
  Map<String, String> userInfo(int index) {
    return {
      "userName": dummy[index].userName!,
      "userMessages": dummy[index].messages!,
      "imageURL": dummy[index].imageURL!,
      "time": dummy[index].time!
    };
  }
}
