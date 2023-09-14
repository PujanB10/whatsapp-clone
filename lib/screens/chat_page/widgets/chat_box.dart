import 'package:flutter/material.dart';

/// Custom chat boxes for displaying chat messages.
class ChatBox extends StatelessWidget {
  /// Creates a [ChatBox] widget.
  ///
  /// [message] and [isUser] must not be null.
  ///
  /// [message] is the chat message that is to be displayed in the chatbox.
  /// [isUser] is to check whether the message is being sent or being received
  /// by the user.

  const ChatBox({super.key, required this.message, required this.isUser});
  final String message;

  /// ```isUser = true;``` means the message is sent.
  /// ```isUser = false;``` means the message is received.
  final bool isUser;

  @override
  Widget build(BuildContext context) {
    return Padding(
      /// Aligns the chabox to the right if the message is sent
      /// and alignts the chatbox to the left if the message is received.
      padding: isUser
          ? const EdgeInsets.fromLTRB(100, 8, 10, 8)
          : const EdgeInsets.fromLTRB(10, 8, 100, 8),
      child: Container(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),

          /// Sets the color of chatbox to green if the message is received.
          /// Sets the color of chatbox to white if the message is sent.
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
