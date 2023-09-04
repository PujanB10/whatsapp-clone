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
      resizeToAvoidBottomInset: true,
      backgroundColor: Colors.blueGrey.shade100,
      appBar: AppBar(
        title: Row(
          children: <Widget>[
            CircleAvatar(backgroundImage: AssetImage(widget.imgUrl)),
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
              padding: const EdgeInsets.fromLTRB(20, 10, 10, 10),
              child: Container(
                padding: const EdgeInsets.all(10),
                height: 40,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.white,
                ),
                child: Text(
                  widget.message,
                  style: const TextStyle(fontSize: 17),
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: SizedBox(
        height: 50,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(7, 0, 4, 8),
                child: TextField(
                  onTap: () {},
                  decoration: InputDecoration(
                    hintText: "Message",
                    // hintStyle:
                    //     const TextStyle(fontSize: 16, color: Colors.black),
                    fillColor: Colors.white,
                    filled: true,
                    enabledBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: Colors.white),
                        borderRadius: BorderRadius.circular(20)),
                    prefixIcon: const Icon(Icons.emoji_emotions),
                    suffixIcon: const Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Padding(
                          padding: EdgeInsets.fromLTRB(0, 8, 0, 8),
                          child: Icon(Icons.attachment),
                        ),
                        Padding(
                          padding: EdgeInsets.fromLTRB(12, 8, 8, 8),
                          child: Icon(Icons.camera_alt),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(1, 0, 4, 5),
              child: FloatingActionButton(
                backgroundColor: const Color(0xFF128c7e),
                onPressed: () {},
                child: const Icon(Icons.mic),
              ),
            )
          ],
        ),
      ),
    );
  }
}
