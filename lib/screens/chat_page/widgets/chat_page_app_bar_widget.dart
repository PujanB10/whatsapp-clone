import 'package:flutter/material.dart';
import 'package:whatsapp/ui_helpers/ui_helpers.dart';

/// A customizable appbar for displaying information and other functionalities.
class ChatPageAppBarWidget extends StatelessWidget
    implements PreferredSizeWidget {
  /// Creates a [ChatPageAppBarWidget] widget.
  ///
  /// [username] and [imageUrl] must not be null.
  ///
  /// This appbar also consists of call, video-call and other options icons
  /// integrated in it.
  const ChatPageAppBarWidget({
    super.key,
    required this.username,
    required this.imageUrl,
  });

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  /// [username] is the username  of the
  /// user whose information is to be displayed in the appbar.
  final String username;

  /// [imageUrl] is the URL to the image of the
  /// user whose information is to be displayed in the appbar.
  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Row(
        children: <Widget>[
          CircleAvatar(backgroundImage: AssetImage(imageUrl)),
          const Padding(
            padding: UiHelpers.evenSpaceAroundMedium,
          ),
          Text(username)
        ],
      ),
      actions: <Widget>[
        /// Builds  call, video-call and options icons at the end of
        /// the appbar.
        IconButton(
            onPressed: () {}, icon: const Icon(Icons.video_call_rounded)),
        IconButton(onPressed: () {}, icon: const Icon(Icons.call)),
        IconButton(onPressed: () {}, icon: const Icon(Icons.more_vert))
      ],
    );
  }
}
