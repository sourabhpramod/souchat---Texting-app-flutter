// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:souchat/services/chat/chat_service.dart';

class ChatBubble extends StatelessWidget {
  final String message;
  final bool isCurrentUser;
  final String messageId;
  final String userId;

  const ChatBubble(
      {super.key,
      required this.message,
      required this.isCurrentUser,
      required this.messageId,
      required this.userId});

  void _showOptions(BuildContext context, String userId, String messageId) {
    showModalBottomSheet(
        backgroundColor: Colors.grey.shade900,
        context: context,
        builder: (context) {
          return SafeArea(
              child: Wrap(
            children: [
              ListTile(
                leading: Icon(
                  Icons.flag,
                  color: Colors.white,
                ),
                title: Text(
                  'Report',
                  style: TextStyle(color: Colors.white),
                ),
                onTap: () {
                  Navigator.pop(context);
                  _reportMessage(context, messageId, userId);
                },
              ),
              ListTile(
                leading: Icon(
                  Icons.block,
                  color: Colors.white,
                ),
                title: Text(
                  'Block',
                  style: TextStyle(color: Colors.white),
                ),
                onTap: () {
                  Navigator.pop(context);
                  _blockUser(context, userId);
                },
              ),
              ListTile(
                leading: Icon(
                  Icons.cancel,
                  color: Colors.white,
                ),
                title: Text(
                  'Cancel',
                  style: TextStyle(color: Colors.white),
                ),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
            ],
          ));
        });
  }

  void _reportMessage(BuildContext context, String messageId, String userId) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: Colors.grey.shade900,
        title: const Text(
          "Report Message",
          style: TextStyle(color: Colors.white),
        ),
        content: const Text(
          "Are you sure bro? That's pretty serious",
          style: TextStyle(color: Colors.white),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text(
              "Cancel",
              style: TextStyle(color: Colors.white),
            ),
          ),
          TextButton(
            onPressed: () {
              ChatService().reportUser(messageId, userId);
              Navigator.pop(context);
              ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                content: Text("Message Reported"),
              ));
            },
            child: const Text(
              "Report",
              style: TextStyle(color: Colors.white),
            ),
          )
        ],
      ),
    );
  }

  void _blockUser(BuildContext context, String userId) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: Colors.grey.shade900,
        title: const Text(
          "Block User",
          style: TextStyle(color: Colors.white),
        ),
        content: const Text(
          "Are you sure bro? That's pretty serious",
          style: TextStyle(color: Colors.white),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text(
              "Cancel",
              style: TextStyle(color: Colors.white),
            ),
          ),
          TextButton(
            onPressed: () {
              ChatService().blockUser(userId);
              Navigator.pop(context);
              Navigator.pop(context);

              ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                content: Text("User Blocked"),
              ));
            },
            child: const Text("Block"),
          )
        ],
      ),
    );
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onLongPress: () {
        if (!isCurrentUser) {
          _showOptions(context, userId, messageId);
        }
      },
      child: Container(
        decoration: BoxDecoration(
          color: isCurrentUser
              ? Color.fromARGB(255, 37, 37, 37)
              : const Color.fromARGB(255, 0, 0, 0),
          boxShadow: [BoxShadow(color: Colors.grey.withOpacity(0.5))],
          borderRadius: BorderRadius.circular(25),
        ),
        padding: const EdgeInsets.all(16),
        margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 25),
        child: Text(
          message,
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}
