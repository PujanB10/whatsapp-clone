class ChatModel {
  String userName;
  String? messages;
  bool? isUser;
  ChatModel({required this.userName, this.messages, this.isUser});

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
