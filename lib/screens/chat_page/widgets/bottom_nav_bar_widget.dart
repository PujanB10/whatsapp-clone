import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:whatsapp/screens/chat_page/view_model/chat_view_model.dart';
import 'package:whatsapp/utils/styles/app_font_sizes.dart';

/// A customizable bottom navigation bar for sending messages
class BottomNavBar extends StatelessWidget {
  /// Creates a [BottomNavBar] widget
  ///
  /// [userName] must not be null.
  ///
  /// [userName] is the username associated with this navigation bar.
  BottomNavBar({super.key, required this.userName});
  final textController = TextEditingController();
  final String userName;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: MediaQuery.of(context).viewInsets,
      child: SizedBox(
        height: 50,
        child: Row(
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(7, 0, 4, 8),
                child: TextField(
                  controller: textController,
                  onChanged: (value) {
                    /// Updates the text message inserted in the message field
                    /// and triggers an icon change.
                    context.read<ChatViewModel>().setIcon();
                  },
                  textAlignVertical: TextAlignVertical.bottom,
                  decoration: InputDecoration(
                    hintText: "Message",
                    hintStyle:
                        const TextStyle(fontSize: AppFontSizes.smallMedium),
                    fillColor: Colors.white,
                    filled: true,
                    enabledBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: Colors.white),
                        borderRadius: BorderRadius.circular(20)),

                    /// Adds a prefix icon in front of the message text field.
                    prefixIcon: const Icon(Icons.emoji_emotions),
                    suffixIcon: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        buildIconsInMessageField(const Icon(Icons.attachment)),
                        buildIconsInMessageField(const Icon(Icons.camera_alt))
                      ],
                    ),
                  ),
                ),
              ),
            ),

            /// Send or Record button that resides in the bottom navigation
            /// bar alongside message text field.
            Padding(
              padding: const EdgeInsets.fromLTRB(1, 0, 4, 5),
              child: FloatingActionButton(
                onPressed: () {
                  /// Send the message and clears the message text field
                  /// on pressing the button.
                  context
                      .read<ChatViewModel>()
                      .addMessages(userName, textController.text, true);
                  textController.clear();
                },
                child: context.watch<ChatViewModel>().defaultIcon,
              ),
            ),
          ],
        ),
      ),
    );
  }

  /// Builds the icons in the suffix of the message text field.
  /// [iconName] is the icon to be displayed.
  Widget buildIconsInMessageField(Icon iconName) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: iconName,
    );
  }

  void dispose() {
    textController.dispose();
  }
}
