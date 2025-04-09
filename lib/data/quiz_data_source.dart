import '../models/question_model.dart';

abstract class QuizDataSource {
  Future<List<QuestionModel>> getQuestions();
}