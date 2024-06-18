import 'package:Rover/featuers/askAndAnswer/widgets/question_model.dart';
import 'package:Rover/featuers/askAndAnswer/widgets/question_title.dart';
import 'package:flutter/material.dart';

class AskQuestion extends StatefulWidget {
  @override
  _AskQuestionState createState() => _AskQuestionState();
}

class _AskQuestionState extends State<AskQuestion> {
  final TextEditingController _textController = TextEditingController();
  final TextEditingController _replyController = TextEditingController();
  List<QuestionModel> _questions = [];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const SizedBox(height: 20.0),
          Expanded(
            child: ListView.builder(
              itemCount: _questions.length,
              itemBuilder: (context, index) {
                return QuestionTile(
                  question: _questions[index],
                  onLovePressed: () {
                    setState(() {
                      _questions[index].isLoved = !_questions[index].isLoved;
                    });
                  },
                  onReplyPressed: () {
                    _replyController.clear(); // Clear previous reply
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: const Text('Reply to Question'),
                          content: TextField(
                            controller: _replyController,
                            decoration: const InputDecoration(
                              hintText: 'Type your reply here...',
                              border: OutlineInputBorder(),
                            ),
                          ),
                          actions: <Widget>[
                            TextButton(
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                              child: const Text('Cancel'),
                            ),
                            ElevatedButton(
                              onPressed: () {
                                // Add functionality to submit the reply
                                // For demonstration, here we just print the reply
                                print('Reply: ${_replyController.text}');
                                _questions[index]
                                    .answers
                                    .add(_replyController.text);
                                Navigator.of(context).pop();
                                setState(() {}); // Update the UI
                              },
                              child: const Text('submit'),
                            ),
                          ],
                        );
                      },
                    );
                  },
                );
              },
            ),
          ),
          const SizedBox(height: 20.0),
          // Add spacing between list and text field
          Row(
            children: [
              Expanded(
                child: TextField(
                  controller: _textController,
                  maxLines: 2,
                  decoration: InputDecoration(
                    hintText: 'Type your question here...',
                    fillColor: Colors.white,
                    // Set background color to white
                    filled: true,
                    // Enable filling the background color
                    border: OutlineInputBorder(
                      borderSide: const BorderSide(color: Colors.red),
                      // Set border color to red
                      borderRadius:
                          BorderRadius.circular(10.0), // Add border radius
                    ),
                    suffixIcon: IconButton(
                      icon: const Icon(Icons.send),
                      onPressed: () {
                        // Add functionality to submit the question
                        if (_textController.text.isNotEmpty) {
                          setState(() {
                            _questions.add(QuestionModel(
                              question: _textController.text,
                              isLoved: false,
                              answers: [],
                            ));
                            _textController.clear();
                          });
                        }
                      },
                      color: Colors.red,
                      iconSize: 36.0,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _textController.dispose();
    _replyController.dispose(); // Dispose reply controller
    super.dispose();
  }
}
