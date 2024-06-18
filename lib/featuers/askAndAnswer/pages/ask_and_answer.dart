// import 'package:Rover/featuers/askAndAnswer/widgets/ask_question.dart';
// import 'package:flutter/material.dart';
//
// class AskAndAnswerPage extends StatelessWidget {
//   static const String routeName = 'askAndanswer_screen';
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text(
//           'Ask & Answer',
//           style: TextStyle(color: Colors.black), // Change text color to black
//         ),
//         centerTitle: true,
//         leading: IconButton(
//           icon: const Icon(
//             Icons.arrow_back,
//             color: Colors.red, // Change arrow color to red
//           ),
//           onPressed: () {
//             // Handle back button press
//           },
//         ),
//         backgroundColor: Colors.white, // Change app bar color to white
//       ),
//       backgroundColor: const Color.fromARGB(255, 225, 224, 224),
//       // Reduce scaffold background color brightness
//       body: AskQuestion(),
//     );
//   }
// }

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AskAndAnswer extends StatefulWidget {
  @override
  _AskAndAnswerState createState() => _AskAndAnswerState();
}

class _AskAndAnswerState extends State<AskAndAnswer> {
  final TextEditingController _questionController = TextEditingController();
  final TextEditingController _replyController = TextEditingController();
  final user = FirebaseAuth.instance.currentUser;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text('Ask & Answer'), backgroundColor: Color(0xFFE60024)),
      body: Column(
        children: [
          Expanded(
            child: StreamBuilder(
              stream: FirebaseFirestore.instance
                  .collection('questions')
                  .orderBy('timestamp', descending: true)
                  .snapshots(),
              builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
                if (!snapshot.hasData) {
                  return Center(child: CircularProgressIndicator());
                }
                return ListView(
                  children: snapshot.data!.docs.map((doc) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15.0),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              ListTile(
                                leading: CircleAvatar(
                                  backgroundImage:
                                      NetworkImage(doc['userImage']),
                                ),
                                title: Text(doc['userName']),
                                subtitle: Text(doc['question']),
                              ),
                              SizedBox(height: 8.0),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  IconButton(
                                    icon: Icon(Icons.favorite,
                                        color: doc['likes'] > 0
                                            ? Color(0xFFE60024)
                                            : Colors.grey),
                                    onPressed: () {
                                      FirebaseFirestore.instance
                                          .runTransaction((transaction) async {
                                        DocumentSnapshot freshSnap =
                                            await transaction
                                                .get(doc.reference);
                                        transaction.update(freshSnap.reference,
                                            {'likes': freshSnap['likes'] + 1});
                                      });
                                    },
                                  ),
                                  Text('${doc['likes']}',
                                      style:
                                          TextStyle(color: Color(0xFFE60024))),
                                  TextButton(
                                    onPressed: () {},
                                    child: Text('Reply',
                                        style: TextStyle(
                                            color: Color(0xFFE60024))),
                                  ),
                                ],
                              ),
                              StreamBuilder(
                                stream: FirebaseFirestore.instance
                                    .collection('questions')
                                    .doc(doc.id)
                                    .collection('replies')
                                    .orderBy('timestamp', descending: true)
                                    .snapshots(),
                                builder: (context,
                                    AsyncSnapshot<QuerySnapshot>
                                        replySnapshot) {
                                  if (!replySnapshot.hasData) {
                                    return SizedBox.shrink();
                                  }
                                  return Column(
                                    children: replySnapshot.data!.docs
                                        .map((replyDoc) {
                                      return ListTile(
                                        leading: CircleAvatar(
                                          backgroundImage: NetworkImage(
                                              replyDoc['userImage']),
                                        ),
                                        title: Text(replyDoc['reply']),
                                        subtitle: Text(
                                            'Replied by: ${replyDoc['userName']}'),
                                      );
                                    }).toList(),
                                  );
                                },
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: TextField(
                                  controller: _replyController,
                                  decoration: InputDecoration(
                                    hintText: 'Write your reply here',
                                    border: OutlineInputBorder(),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(
                                    bottom: 8.0, left: 8.0, right: 8.0),
                                child: Row(
                                  children: [
                                    Expanded(
                                      child: SizedBox.shrink(),
                                    ),
                                    TextButton(
                                      onPressed: () {
                                        if (_replyController.text.isNotEmpty) {
                                          FirebaseFirestore.instance
                                              .collection('questions')
                                              .doc(doc.id)
                                              .collection('replies')
                                              .add({
                                            'reply': _replyController.text,
                                            'userId': user!.uid,
                                            'userName': user!.displayName,
                                            'userImage': user!.photoURL,
                                            'timestamp': Timestamp.now(),
                                          });
                                          _replyController.clear();
                                        }
                                      },
                                      child: Text('Post Reply',
                                          style: TextStyle(
                                              color: Color(0xFFE60024))),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  }).toList(),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _questionController,
                    decoration: InputDecoration(
                      hintText: 'Write your question here',
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                IconButton(
                  icon: Icon(Icons.send, color: Color(0xFFE60024)),
                  onPressed: () {
                    if (_questionController.text.isNotEmpty) {
                      FirebaseFirestore.instance.collection('questions').add({
                        'question': _questionController.text,
                        'likes': 0,
                        'userId': user!.uid,
                        'userName': user!.displayName,
                        'userImage': user!.photoURL,
                        'timestamp': Timestamp.now(),
                      });
                      _questionController.clear();
                    }
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
