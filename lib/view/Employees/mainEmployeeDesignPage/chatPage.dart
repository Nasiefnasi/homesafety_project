import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter/material.dart';
import 'package:homesefty/controller/user/chatpage/chating.dart';
import 'package:homesefty/model/User/homepage/chat%20message/chatmodel.dart';

class ChatPage extends StatefulWidget {
  final String receiverUserEmail;
  final String receiverUserId;

  ChatPage(
      {super.key,
      required this.receiverUserEmail,
      required this.receiverUserId});

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  final TextEditingController messageController = TextEditingController();
  final Chating chatservises = Chating();
  final FirebaseAuth auth = FirebaseAuth.instance;
  void sendMessage() async {
    if (messageController.text.isNotEmpty) {
      await chatservises.sendMessage(
          auth.currentUser!.uid, messageController.text);
      messageController.clear();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          "Chating ",
        ),
      ),
      body: Column(children: [
        Expanded(
          child: bulidmessageList(),
        ),
        bulidmessageInput(),
      ]),
    );
  }

  Widget bulidmessageList() {
    return StreamBuilder(
      stream: chatservises.getMessages(
          widget.receiverUserId, auth.currentUser!.uid),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return Text("Error${snapshot.error}");
        }
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Text("Loading.....");
        }
        return ListView(
          children: snapshot.data!.docs
              .map((document) => bulidmessageItem(document))
              .toList(),
        );
      },
    );
  }

  Widget bulidmessageItem(DocumentSnapshot document) {
    Map<String, dynamic> data = document.data() as Map<String, dynamic>;
    var alignment = (data['senderId'] == auth.currentUser!.uid)
        ? Alignment.centerRight
        : Alignment.centerLeft;
    return Container(
      alignment: alignment,
      child: Column(
        crossAxisAlignment: (data['senderId'] == auth.currentUser!.uid)
            ? CrossAxisAlignment.end
            : CrossAxisAlignment.start,
        mainAxisAlignment: (data['senderId'] == auth.currentUser!.uid)
            ? MainAxisAlignment.end
            : MainAxisAlignment.start,
        children: [
          Text(
            data['senderEmail'],
            style: const TextStyle(fontSize: 10),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            child: ChatBubble(message: data['message']),
          )
        ],
      ),
    );
  }

  Widget bulidmessageInput() {
    return Card(
      shadowColor: Colors.amber,
      child: Row(
        children: [
          Expanded(
              child: TextFormField(
            controller: messageController,
            obscureText: false,
            decoration: const InputDecoration(
                hoverColor: Color.fromARGB(255, 255, 2, 2),
                fillColor: Colors.amberAccent,
                hintText: "Enter Message"),
          )),
          IconButton(
              onPressed: sendMessage,
              icon: const Icon(
                Icons.send,
                color: Colors.amber,
                size: 30,
              ))
        ],
      ),
    );
  }
}
