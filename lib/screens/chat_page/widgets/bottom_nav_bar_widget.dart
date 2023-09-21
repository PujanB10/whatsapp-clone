import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:whatsapp/screens/chat_page/view_model/chat_view_model.dart';
import 'package:whatsapp/screens/chat_page/widgets/bottom_nav_bar_floating_button.dart';
import 'package:whatsapp/ui_helpers/ui_helpers.dart';
import 'package:whatsapp/ui_kit/floating_action_button_kit.dart';

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
        height: kBottomNavigationBarHeight,
        child: Row(
          children: [
            Expanded(
              child: Padding(
                padding: UiHelpers.paddingVertical(hspacing: 3),
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
                    fillColor: Colors.white,
                    filled: true,
                    border: OutlineInputBorder(
                        borderSide: BorderSide.none,
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
            BottomNavBarFloatingButton(
                userName: userName, textController: textController),
          ],
        ),
      ),
    );
  }

  /// Builds the icons in the suffix of the message text field.
  /// [iconName] is the icon to be displayed.
  Widget buildIconsInMessageField(Icon iconName) {
    return Padding(
      padding: UiHelpers.evenSpaceAroundMedium,
      child: iconName,
    );
  }

  void dispose() {
    textController.dispose();
  }
}
