import 'package:whatsapp/screens/home_page/widgets/users_list_view_widget.dart';
import 'package:whatsapp/screens/home_page/widgets/home_page_app_bar_widget.dart';
import 'package:flutter/material.dart';
import 'package:whatsapp/ui_kit/floating_action_button_kit.dart';

/// Home Page of the app.
class HomePage extends StatelessWidget {
  /// Creates a [HomePage] widget.
  ///
  /// Takes no arguments.
  ///
  /// Home Page routed by MaterialApp that is displayed on opening the app.
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: const HomePageAppBarWidget(),

        /// Builds the list of users with their pictures as leading
        /// image, their last text and time.
        body: const UsersListViewWidget(),

        /// Floating button that resides on the bottom right to create
        /// a new message.
        floatingActionButton: FloatingActionButtonKit(
          onClick: () {},
          floatingIcon: const Icon(Icons.message_sharp),
        ),
      ),
    );
  }
}
