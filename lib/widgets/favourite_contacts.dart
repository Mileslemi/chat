// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors

import 'package:chat/models/message_model.dart';
import 'package:chat/models/user_model.dart';
import 'package:chat/screens/chat_screen.dart';
import 'package:flutter/material.dart';

class FavouriteContacts extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 12.0,
            vertical: 8.0,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Favorite Contacts',
                style: TextStyle(
                  color: Colors.blueGrey,
                  fontSize: 16.0,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1.0,
                ),
              ),
              IconButton(
                onPressed: () {},
                icon: Icon(Icons.more_horiz),
                iconSize: 30.0,
                color: Colors.blueGrey,
              )
            ],
          ),
        ),
        Container(
          height: 120.0,
          //color: Colors.blue,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: favourites.length,
            itemBuilder: (context, index) {
              User favourite = favourites[index];
              return GestureDetector(
                onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => ChatScreen(favourite),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20.0,
                    vertical: 10.0,
                  ),
                  child: Column(
                    children: [
                      CircleAvatar(
                        backgroundImage: AssetImage(favourite.imageUrl),
                        radius: 30.0,
                      ),
                      SizedBox(
                        height: 5.0,
                      ),
                      Text(
                        favourite.name,
                        style: TextStyle(
                          color: Colors.blueGrey,
                          fontSize: 16.0,
                          fontWeight: FontWeight.w600,
                          letterSpacing: 1.2,
                        ),
                      )
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
