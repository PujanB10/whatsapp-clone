import 'package:flutter/material.dart';

/// A appbar for displaying information and other functionalities.
class HomePageAppBarWidget extends StatelessWidget
    implements PreferredSizeWidget {
  /// Creates a [HomePageAppBarWidget] widget.
  ///
  /// Takes no arguments.
  ///
  /// Creates a app bar with "WhatsApp" as its title.
  /// Also creates a tab bar with options as Groups, Chats,
  /// Status, Calls.
  const HomePageAppBarWidget({super.key});

  @override
  Size get preferredSize => const Size.fromHeight(100);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: const Text('WhatsApp'),
      backgroundColor: Theme.of(context).primaryColor,
      leadingWidth: 60,
      actions: <Widget>[
        IconButton(
          icon: const Icon(Icons.camera_alt_outlined),
          onPressed: () {},
        ),
        IconButton(
          icon: const Icon(Icons.search),
          onPressed: () {},
        ),
        IconButton(
          icon: const Icon(Icons.more_vert),
          onPressed: () {},
        )
      ],

      /// Create tab bar with four tabs.
      bottom: const TabBar(
        tabs: <Widget>[
          Tab(
            icon: Icon(Icons.groups),
          ),
          Tab(
            text: 'Chats',
          ),
          Tab(text: 'Status'),
          Tab(
            text: 'Calls',
          ),
        ],
      ),
    );
  }
}
