import 'package:flutter/material.dart';

/// Custom chat boxes for chat features
class ChatBox extends StatelessWidget {
  /// Takes in <String?> message and <Bool?> to authenticate if its sender
  /// or receiver and creates a chat box accordidng to the arguments
  /// provided.
  const ChatBox({super.key, required this.message, required this.isUser});
  final String message;
  final bool isUser;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: isUser
          ? const EdgeInsets.fromLTRB(100, 8, 10, 8)
          : const EdgeInsets.fromLTRB(10, 8, 100, 8),
      child: Container(
        padding: const EdgeInsets.all(10),
        // height: 40,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: isUser
              ? const Color.fromARGB(255, 137, 211, 141)
              : const Color.fromARGB(255, 253, 253, 253),
        ),
        child: Text(
          message,
          style: const TextStyle(fontSize: 17),
        ),
      ),
    );
  }
}
