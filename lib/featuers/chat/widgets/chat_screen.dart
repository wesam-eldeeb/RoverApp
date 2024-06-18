import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../config/constants/colors/my_colors.dart';

class ChatScreen extends StatefulWidget {
  static const String routeName = 'chat_screen';

  final User user;

  ChatScreen({required this.user});

  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final TextEditingController _controller = TextEditingController();
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  @override
  void initState() {
    super.initState();
    _initializeChatCollection();
  }

  // وظيفة للتحقق من وجود المجموعة وإنشائها إذا لم تكن موجودة
  Future<void> _initializeChatCollection() async {
    final chatCollection = _firestore.collection('chats');

    // تحقق مما إذا كانت المجموعة تحتوي على أي وثائق
    final snapshot = await chatCollection.limit(1).get();
    if (snapshot.size == 0) {
      // إذا لم يكن هناك وثائق، قم بإنشاء وثيقة تجريبية
      await chatCollection.add({
        'text': 'Welcome to the chat!',
        'sender': 'system',
        'timestamp': FieldValue.serverTimestamp(),
      });
    }
  }

  // وظيفة لإرسال الرسالة إلى Firestore
  Future<void> _sendMessage() async {
    if (_controller.text.isNotEmpty) {
      await _firestore.collection('chats').add({
        'text': _controller.text,
        'sender': widget.user.email,
        'timestamp': FieldValue.serverTimestamp(),
      });
      _controller.clear();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Chat with driver',
          style: TextStyle(
            color: Color(0xff030F09),
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: MyColors.red,
          ),
          onPressed: () => Navigator.pop(context),
        ),
        backgroundColor: Colors.white,
        actions: [
          IconButton(
            icon: Icon(Icons.videocam, color: Colors.red),
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(Icons.call, color: Colors.red),
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(Icons.more_vert, color: Colors.red),
            onPressed: () {},
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: StreamBuilder<QuerySnapshot>(
              stream: _firestore
                  .collection('chats')
                  .orderBy('timestamp')
                  .snapshots(),
              builder: (context, snapshot) {
                if (!snapshot.hasData) {
                  return Center(child: CircularProgressIndicator());
                }
                final messages = snapshot.data!.docs;
                List<Widget> messageWidgets = messages.map((message) {
                  final text = message['text'];
                  final sender = message['sender'];
                  bool isMe = sender == widget.user.email;

                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: isMe
                          ? MainAxisAlignment.end
                          : MainAxisAlignment.start,
                      children: [
                        Container(
                          padding: EdgeInsets.symmetric(
                              vertical: 10.0, horizontal: 15.0),
                          decoration: BoxDecoration(
                            color: isMe ? Colors.red[100] : Colors.grey[300],
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          child: Column(
                            crossAxisAlignment: isMe
                                ? CrossAxisAlignment.end
                                : CrossAxisAlignment.start,
                            children: [
                              Text(
                                sender,
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: isMe ? Colors.red : Colors.black,
                                ),
                              ),
                              SizedBox(height: 5.0),
                              Text(text),
                            ],
                          ),
                        ),
                      ],
                    ),
                  );
                }).toList();
                return ListView(children: messageWidgets);
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _controller,
                    decoration: InputDecoration(hintText: 'Type a message...'),
                  ),
                ),
                IconButton(
                  icon: Icon(Icons.send, color: Colors.red),
                  onPressed: _sendMessage,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
