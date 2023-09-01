import 'package:whatsapp/model.dart';
import 'package:flutter/material.dart';
import 'package:whatsapp/views/chatpage.dart';

class HomePage extends StatefulWidget {
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
            leadingWidth: 60,
            backgroundColor: Color(0xFF128c7e),
            actions: <Widget>[
              IconButton(
                icon: const Icon(Icons.camera_alt_outlined),
                onPressed: () {},
              ),
              IconButton(
                icon: Icon(Icons.search),
                onPressed: () {},
              ),
              IconButton(
                icon: Icon(Icons.more_vert),
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
                            backgroundImage:
                                NetworkImage(dummy[index].imageURL!),
                          ),
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => IndividualChats(
                                        dummy[index].userName!,
                                        dummy[index].imageURL!,
                                        dummy[index].messages!)));
                          },
                          title: Row(
                            children: <Widget>[
                              const Padding(
                                  padding: EdgeInsets.fromLTRB(0, 2, 2, 30)),
                              Text(
                                dummy[index].userName!,
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold),
                              )
                            ],
                          ),
                          subtitle: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Text(
                                  dummy[index].messages!,
                                  style: const TextStyle(color: Colors.grey),
                                ),
                                Text(dummy[index].time!)
                              ]),
                        )
                      ],
                    ))),
            const Icon(Icons.groups_sharp),
            const Icon(Icons.groups_sharp)
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {},
          backgroundColor: const Color(0xFF128c7e),
          child: const Icon(Icons.message_sharp),
        ),
      ),
    );
  }
}
