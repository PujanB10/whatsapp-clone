class ChatMessages {
  String userName;
  String? messages;
  bool? isUser;
  ChatMessages({required this.userName, this.messages, this.isUser});

  Map<String, dynamic> toMapNew() {
    return {
      userName: {
        [
          {"message": messages, "isUser": isUser}
        ],
      }
    };
  }

  Map<String, dynamic> toMapExisting() {
    return {"message": messages, "isUser": isUser};
  }
}

Map<String, dynamic> dummyChat = {
  "Pujan": [
    {"message": "Hey there! How's your day going?", "isUser": false}
  ],
  "Ram": [
    {"message": "I just tried a new recipe.", "isUser": false}
  ],
  "Shyam": [
    {"message": "Do you believe in aliens?", "isUser": false}
  ],
  "Gita": [
    {"message": "I can't wait for the weekend to relax.", "isUser": false}
  ],
  "Sita": [
    {"message": "Have you ever been on a trip?", "isUser": false}
  ],
  "Rakesh": [
    {"message": "What's your favorite book of all time?", "isUser": false}
  ],
  "Abishek": [
    {"message": "Just finished a great workout.", "isUser": false}
  ],
  "Rita": [
    {"message": "Thinking about starting a new hobby.", "isUser": false}
  ],
  "Nita": [
    {"message": "The weather today is so unpredictable.", "isUser": false}
  ],
};
