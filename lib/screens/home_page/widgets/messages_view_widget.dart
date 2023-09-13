import 'package:flutter/material.dart';
import 'package:whatsapp/screens/home_page/view_model/home_view_model.dart';
import 'package:provider/provider.dart';
import 'package:whatsapp/screens/chat_page/view_model/chat_view_model.dart';
import 'package:whatsapp/screens/chat_page/chat_page.dart';

class MessagesViewWidget extends StatelessWidget {
  const MessagesViewWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return TabBarView(children: [
      const Icon(Icons.groups_sharp),
      ListView.builder(
          itemCount: HomeViewModel().dummy.length,
          itemBuilder: ((BuildContext context, int index) => Column(
                children: [
                  const Divider(
                    height: 10,
                    color: Colors.white,
                  ),
                  ListTile(
                    leading: CircleAvatar(
                      backgroundImage: AssetImage(
                          HomeViewModel().userInfo(index)["imageURL"]!),
                    ),

                    /// On tapping a user from the list, opens the private
                    /// chat with the user.
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return ChangeNotifierProvider(
                            create: (context) => ChatViewModel(),
                            child: ChatPage(
                                usrName: HomeViewModel()
                                    .userInfo(index)["userName"]!,
                                imgUrl: HomeViewModel()
                                    .userInfo(index)["imageURL"]!,
                                message: HomeViewModel()
                                    .userInfo(index)["userMessages"]!));
                      }));
                    },
                    title: Row(
                      children: <Widget>[
                        const Padding(
                            padding: EdgeInsets.fromLTRB(0, 2, 2, 30)),
                        Text(
                          HomeViewModel().userInfo(index)["userName"]!,
                          style: const TextStyle(fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                    subtitle: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text(
                            HomeViewModel().userInfo(index)["userMessages"]!,
                            style: const TextStyle(color: Colors.grey),
                          ),
                          Text(HomeViewModel().userInfo(index)["time"]!)
                        ]),
                  )
                ],
              ))),
      const Icon(Icons.groups_sharp),
      const Icon(Icons.groups_sharp)
    ]);
  }
}
