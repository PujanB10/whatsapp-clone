class ChatMessages {
  String? userName;
  String? messages;
  bool? isUser;
  ChatMessages({this.userName, this.messages, this.isUser});

  Map<String?, dynamic> toMap() {
    return {
      userName: {
        "userMessages": [messages],
        "isUser": isUser
      }
    };
  }
}

Map<String?, dynamic> dummyChat = {};
