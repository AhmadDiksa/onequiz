class QuestionModel {
  final String question;
  final String? code;
  final String? imageUrl;
  final List<String> answers;
  final int correctAnswerIndex;

  const QuestionModel({
    required this.question,
    this.code,
    this.imageUrl,
    required this.answers,
    required this.correctAnswerIndex,
  });

  factory QuestionModel.fromJson(Map<String, dynamic> json) {
    return QuestionModel(
      question: json['question'] as String,
      code: json['code'] as String?,
      imageUrl: json['imageUrl'] as String?,
      answers: (json['answers'] as List).cast<String>(),
      correctAnswerIndex: json['correctAnswerIndex'] as int,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'question': question,
      'code': code,
      'imageUrl': imageUrl,
      'answers': answers,
      'correctAnswerIndex': correctAnswerIndex,
    };
  }
}
