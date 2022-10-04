// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors

import 'package:chat/models/message_model.dart';
import 'package:chat/screens/chat_screen.dart';
import 'package:flutter/material.dart';

class RecentChats extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(20.0),
        topRight: Radius.circular(20.0),
      ),
      child: ListView.builder(
        itemCount: chats.length,
        itemBuilder: (context, index) {
          Message chat = chats[index];
          return Container(
            decoration: BoxDecoration(
              color: chat.unread
                  ? Theme.of(context).primaryColorLight
                  : Colors.white,
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(20.0),
                bottomRight: Radius.circular(20.0),
              ),
            ),
            margin: EdgeInsets.only(
              right: 10.0,
              top: 12.0,
              bottom: 4.0,
            ),
            padding: EdgeInsets.all(10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CircleAvatar(
                  backgroundImage: AssetImage(chat.sender.imageUrl),
                  radius: 28.0,
                ),
                GestureDetector(
                  onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => ChatScreen(chat.sender),
                    ),
                  ),
                  child: Container(
                    width: MediaQuery.of(context).size.width * 0.55,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          chat.sender.name,
                          style: TextStyle(
                            color: Colors.blueGrey,
                            fontSize: 16.0,
                            fontWeight: FontWeight.bold,
                            letterSpacing: 1.2,
                          ),
                        ),
                        SizedBox(height: 5.0),
                        Text(
                          chat.text,
                          style: TextStyle(
                            color: Colors.blueGrey,
                            fontSize: 14.0,
                            fontWeight: FontWeight.w600,
                            letterSpacing: 1.2,
                          ),
                          overflow: TextOverflow.ellipsis,
                          //maxLines: 2,
                        ),
                      ],
                    ),
                  ),
                ),
                Column(
                  children: [
                    Text(
                      chat.time,
                      style: TextStyle(
                        color: Colors.blueGrey,
                        fontSize: 14.0,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    SizedBox(height: 5.0),
                    chat.unread
                        ? Container(
                            padding: EdgeInsets.all(4.0),
                            decoration: BoxDecoration(
                              color: Theme.of(context).primaryColor,
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            child: Text(
                              'NEW',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 12.0,
                                fontWeight: FontWeight.bold,
                                letterSpacing: 1.2,
                              ),
                            ),
                          )
                        : Text(''),
                  ],
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
