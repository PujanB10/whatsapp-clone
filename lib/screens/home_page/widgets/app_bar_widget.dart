import 'package:flutter/material.dart';

class AppBarWidget extends StatelessWidget implements PreferredSizeWidget {
  const AppBarWidget({super.key});

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
        bottom: const TabBar(tabs: <Widget>[
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
        ]));
  }
}
