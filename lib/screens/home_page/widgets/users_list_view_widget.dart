import 'package:flutter/material.dart';
import 'package:whatsapp/screens/home_page/view_model/home_view_model.dart';
import 'package:whatsapp/screens/chat_page/chat_page.dart';

/// A message view widget that views list of users with their last messages.
class UsersListViewWidget extends StatelessWidget {
  /// Creates a [UsersListViewWidget].
  ///
  /// Takes no arguments.
  ///
  /// Builds a [ListView] where each elements consists of the
  /// image of the user,username of the user, last sent message of
  /// the user and the time.
  const UsersListViewWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return TabBarView(
      children: [
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
                    onTap: () {
                      /// On tapping a user from the list, opens the private
                      /// chat with the user.
                      ChatPage.presentPage(context, index);
                    },
                    title: Row(
                      children: <Widget>[
                        const Padding(
                            padding: EdgeInsets.fromLTRB(
                                0, 2, 2, 30)), //create UIhelper and implement
                        Text(
                          HomeViewModel().userInfo(index)["userName"]!,
                          style: Theme.of(context).textTheme.titleMedium,
                        )
                      ],
                    ),
                    subtitle: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(
                          HomeViewModel().userInfo(index)["userMessages"]!,
                        ),
                        Text(HomeViewModel().userInfo(index)["time"]!)
                      ],
                    ),
                  ),
                ],
              )),
        ),
        const Icon(Icons.groups_sharp),
        const Icon(Icons.groups_sharp)
      ],
    );
  }
}
