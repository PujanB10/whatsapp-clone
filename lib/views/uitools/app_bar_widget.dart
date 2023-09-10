import 'package:flutter/material.dart';

class AppBarWidget extends StatelessWidget {
  const AppBarWidget(
      {super.key,
      required this.username,
      required this.imageUrl,
      required this.bgColor});

  final String username;
  final String imageUrl;
  final Color bgColor;
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
      backgroundColor: bgColor,
      actions: <Widget>[
        IconButton(onPressed: () {}, icon: const Icon(Icons.video_call_sharp)),
        IconButton(onPressed: () {}, icon: const Icon(Icons.call)),
        IconButton(onPressed: () {}, icon: const Icon(Icons.more_vert))
      ],
    );
  }
}
