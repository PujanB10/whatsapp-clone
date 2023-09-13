import 'package:flutter/material.dart';

/// A customizable appbar for displaying information and other functionalities.
class AppBarWidget extends StatelessWidget implements PreferredSizeWidget {
  /// Creates a [AppBarWidget] widget.
  ///
  /// [username] and [imageUrl] must not be null.
  ///
  /// This appbar also consists of call, video-call and other options icons
  /// integrated in it.
  const AppBarWidget({
    super.key,
    required this.username,
    required this.imageUrl,
  });

  @override
  Size get preferredSize => const Size.fromHeight(55);

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
            padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
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
