import 'package:flutter/material.dart';
import 'package:whatsapp/ui_helpers/ui_helpers.dart';

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
    return message.isNotEmpty
        ? Align(
            alignment: isUser ? Alignment.centerRight : Alignment.centerLeft,
            child: Padding(
              padding: UiHelpers.evenSpaceAroundMedium,
              child: Container(
                padding: UiHelpers.evenSpaceAroundMediumLarge,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),

                  /// Sets the color of chatbox to green if the message is received.
                  /// Sets the color of chatbox to white if the message is sent.
                  color: isUser
                      ? Theme.of(context).colorScheme.primary.withOpacity(0.5)
                      : const Color.fromARGB(255, 253, 253, 253),
                ),
                child: Text(
                  message,
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
              ),
            ),
          )
        : Container();
  }
}
