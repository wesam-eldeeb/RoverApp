class QuestionModel {
  final String question;
  bool isLoved;
  List<String> answers;

  QuestionModel({
    required this.question,
    required this.isLoved,
    required this.answers,
  });
}
