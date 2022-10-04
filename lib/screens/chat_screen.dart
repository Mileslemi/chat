// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors_in_immutables, prefer_const_constructors

import 'package:chat/models/message_model.dart';
import 'package:chat/models/user_model.dart';
import 'package:flutter/material.dart';

class ChatScreen extends StatefulWidget {
  final User user;

  ChatScreen(this.user);

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  _buildMessage(Message message, bool isMe) {
    final Container msg = Container(
      padding: EdgeInsets.all(10.0),
      margin: isMe
          ? EdgeInsets.only(top: 10.0, left: 60.0, bottom: 10.0)
          : EdgeInsets.only(top: 10.0, bottom: 10.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(10.0)),
        color: isMe ? Colors.amber.shade50 : Colors.red.shade50,
      ),
      width: MediaQuery.of(context).size.width * 0.75,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            message.time,
            style: TextStyle(
                color: Colors.blueGrey.shade100,
                fontWeight: FontWeight.w600,
                letterSpacing: 1.1),
          ),
          SizedBox(
            height: 5.0,
          ),
          Text(
            message.text,
            style: TextStyle(
                color: Colors.blueGrey,
                fontWeight: FontWeight.w600,
                letterSpacing: 1.1),
          ),
        ],
      ),
    );

    if (isMe) {
      return msg;
    }

    return Row(
      children: [
        msg,
        IconButton(
          onPressed: () {},
          iconSize: 30.0,
          icon: message.isLiked
              ? Icon(Icons.favorite)
              : Icon(Icons.favorite_border),
          color: message.isLiked
              ? Theme.of(context).primaryColor
              : Colors.blueGrey,
        )
      ],
    );
  }

  _buildMsgComposer() {
    return Container(
      height: 70.0,
      color: Colors.white,
      child: Row(
        children: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.photo),
            color: Theme.of(context).primaryColor,
          ),
          Expanded(
            child: TextField(
              textCapitalization:
                  TextCapitalization.sentences, //capitalizes first word.
              onChanged:
                  (value) {}, //maybe Set state by changing value of string variable
              style: TextStyle(
                color: Colors.blueGrey,
              ),
              decoration: InputDecoration.collapsed(
                //collapsed to remove bottom border
                hintText: 'Send a message...',
              ),
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.send),
            color: Theme.of(context).primaryColor,
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        title: Align(
          alignment: Alignment.center,
          child: Text(
            widget.user.name,
            style: TextStyle(
              fontSize: 24.0,
              fontWeight: FontWeight.bold,
              letterSpacing: 1.2,
            ),
          ),
        ),
        actions: [
          IconButton(
            icon: CircleAvatar(
              backgroundImage: AssetImage(widget.user.imageUrl),
            ),
            onPressed: () => {},
            iconSize: 30.0,
          ),
        ],
        elevation: 0.0,
      ),
      body: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: Column(
          children: [
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30.0),
                    topRight: Radius.circular(30.0),
                  ),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30.0),
                    topRight: Radius.circular(30.0),
                  ),
                  child: ListView.builder(
                    reverse: true,
                    padding: EdgeInsets.only(
                      top: 17.0,
                    ),
                    itemCount: messages.length,
                    itemBuilder: (context, index) {
                      final Message message = messages[index];
                      bool isMe = message.sender.id == currentUser.id;
                      return _buildMessage(message, isMe);
                    },
                  ),
                ),
              ),
            ),
            _buildMsgComposer(),
          ],
        ),
      ),
    );
  }
}
