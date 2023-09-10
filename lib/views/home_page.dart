import 'package:whatsapp/model/user_model.dart';
import 'package:flutter/material.dart';
import 'package:whatsapp/style/app_color.dart';
import 'package:whatsapp/view_model/user_view_model.dart';
import 'package:whatsapp/views/chat_page.dart';

/// Home Page of the app.
class HomePage extends StatefulWidget {
  /// Home Page routed by MaterialApp that is displayed on opening the app.
  const HomePage({super.key});

  @override
  State<StatefulWidget> createState() {
    return ChatState();
  }
}

class ChatState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: AppBar(
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
            ])),

        /// Builds the list of users with their pictures as leading
        /// image, their last text and time.
        body: TabBarView(
          children: [
            const Icon(Icons.groups_sharp),
            ListView.builder(
                itemCount: dummy.length,
                itemBuilder: ((BuildContext context, int index) => Column(
                      children: [
                        const Divider(
                          height: 10,
                          color: Colors.white,
                        ),
                        ListTile(
                          leading: CircleAvatar(
                            backgroundImage: AssetImage(
                                UserViewModel().userInfo(index)["imageURL"]!),
                          ),

                          /// On tapping a user from the list, opens the private
                          /// chat with the user.
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => ChatPage(
                                        UserViewModel()
                                            .userInfo(index)["userName"]!,
                                        UserViewModel()
                                            .userInfo(index)["imageURL"]!,
                                        UserViewModel().userInfo(
                                            index)["userMessages"]!)));
                          },
                          title: Row(
                            children: <Widget>[
                              const Padding(
                                  padding: EdgeInsets.fromLTRB(0, 2, 2, 30)),
                              Text(
                                UserViewModel().userInfo(index)["userName"]!,
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold),
                              )
                            ],
                          ),
                          subtitle: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Text(
                                  UserViewModel()
                                      .userInfo(index)["userMessages"]!,
                                  style: const TextStyle(color: Colors.grey),
                                ),
                                Text(UserViewModel().userInfo(index)["time"]!)
                              ]),
                        )
                      ],
                    ))),
            const Icon(Icons.groups_sharp),
            const Icon(Icons.groups_sharp)
          ],
        ),

        /// Floating button that resides on the bottom right to create
        /// a new message.
        floatingActionButton: FloatingActionButton(
          onPressed: () {},
          backgroundColor: AppColor.primary,
          child: const Icon(Icons.message_sharp),
        ),
      ),
    );
  }
}
