import 'package:flutter/material.dart';

class IndividualChats extends StatefulWidget {
  final String usrName;
  final String imgUrl;
  final String message;
  IndividualChats(this.usrName, this.imgUrl, this.message);
  @override
  State<StatefulWidget> createState() => IndividualChatState();
}

class IndividualChatState extends State<IndividualChats> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.blueGrey.shade100,
        appBar: AppBar(
          title: Row(
            children: <Widget>[
              CircleAvatar(backgroundImage: NetworkImage(widget.imgUrl)),
              const Padding(
                padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
              ),
              Text(widget.usrName)
            ],
          ),
          backgroundColor: Color(0xFF128c7e),
          actions: <Widget>[
            IconButton(onPressed: () {}, icon: Icon(Icons.video_call_sharp)),
            IconButton(onPressed: () {}, icon: Icon(Icons.call)),
            IconButton(onPressed: () {}, icon: Icon(Icons.more_vert))
          ],
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.fromLTRB(20, 10, 10, 10),
                child: Container(
                  padding: EdgeInsets.all(10),
                  height: 40,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white,
                  ),
                  child: Text(
                    widget.message,
                    style: TextStyle(fontSize: 17),
                  ),
                ),
              ),
            ],
          ),
        ),
        bottomNavigationBar: Container(
          height: 50,
          color: Colors.white,
          child: Row(
            children: [
              Icon(Icons.emoji_emotions),
              Expanded(
                  child: TextField(
                decoration: InputDecoration(
                  hintText: "Message",
                  suffixIcon: Icon(Icons.attachment),
                ),
              ))
            ],
          ),
        ));
  }
}
