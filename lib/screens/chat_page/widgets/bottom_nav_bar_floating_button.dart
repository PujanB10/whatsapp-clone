import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:whatsapp/screens/chat_page/view_model/chat_view_model.dart';
import 'package:whatsapp/ui_helpers/ui_helpers.dart';
import 'package:whatsapp/ui_kit/floating_action_button_kit.dart';

class BottomNavBarFloatingButton extends StatelessWidget {
  const BottomNavBarFloatingButton({
    super.key,
    required this.userName,
    required this.textController,
  });

  final String userName;
  final TextEditingController textController;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: UiHelpers.paddingVertical(hspacing: 3),
      child: FloatingActionButtonKit(
        onClick: () {
          /// Send the message and clears the message text field
          /// on pressing the button.
          context
              .read<ChatViewModel>()
              .addMessages(userName, textController.text, true);
          textController.clear();
        },
        floatingIcon: context.watch<ChatViewModel>().defaultIcon,
      ),
    );
  }
}
