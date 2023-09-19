import 'package:whatsapp/screens/home_page/model/user_model.dart';

class HomeViewModel {
  List<Users> dummy = [
    Users(
        userName: "Pujan",
        messages: "Hey there! How's your day going?",
        time: "2:00 AM",
        imageURL: "assets/icon1.jpeg"),
    Users(
        userName: "Ram",
        messages: "I just tried a new recipe.",
        time: "3:00 AM",
        imageURL: "assets/icon2.png"),
    Users(
        userName: "Shyam",
        messages: "Do you believe in aliens?",
        time: "6:00 AM",
        imageURL: "assets/icon1.jpeg"),
    Users(
        userName: "Gita",
        messages: "I can't wait for the weekend to relax.",
        time: "2:03 PM",
        imageURL: "assets/icon2.png"),
    Users(
        userName: "Sita",
        messages: "Have you ever been on a trip?",
        time: "3:20 AM",
        imageURL: "assets/icon1.jpeg"),
    Users(
        userName: "Rakesh",
        messages: "What's your favorite book of all time?",
        time: "3:00 AM",
        imageURL: "assets/icon2.png"),
    Users(
        userName: "Abishek",
        messages: "Just finished a great workout.",
        time: "6:00 AM",
        imageURL: "assets/icon1.jpeg"),
    Users(
        userName: "Rita",
        messages: "Thinking about starting a new hobby.",
        time: "2:50 PM",
        imageURL: "assets/icon2.png"),
    Users(
        userName: "Nita",
        messages: "The weather today is so unpredictable.",
        time: "2:03 PM",
        imageURL: "assets/icon1.jpeg")
  ];

  Map<String, String> userInfo(int index) {
    return {
      "userName": dummy[index].userName,
      "userMessages": dummy[index].messages,
      "imageURL": dummy[index].imageURL,
      "time": dummy[index].time
    };
  }
}
