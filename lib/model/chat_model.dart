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

Map<String?, dynamic> dummyChat = {
  "Pujan": {
    "userMessages": ["Hey there! How's your day going?"],
    "isUser": false
  },
  "Ram": {
    "userMessages": ["I just tried a new recipe."],
    "isUser": false
  },
  "Shyam": {
    "userMessages": ["Do you believe in aliens?"],
    "isUser": false
  },
  "Gita": {
    "userMessages": ["I can't wait for the weekend to relax."],
    "isUser": false
  },
  "Sita": {
    "userMessages": ["Have you ever been on a trip?"],
    "isUser": false
  },
  "Rakesh": {
    "userMessages": ["What's your favorite book of all time?"],
    "isUser": false
  },
  "Abishek": {
    "userMessages": ["Just finished a great workout."],
    "isUser": false
  },
  "Rita": {
    "userMessages": ["Thinking about starting a new hobby."],
    "isUser": false
  },
  "Nita": {
    "userMessages": ["The weather today is so unpredictable."],
    "isUser": false
  }
};
