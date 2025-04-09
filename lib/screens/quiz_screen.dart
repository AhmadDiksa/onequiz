import 'package:flutter/material.dart';
import 'package:onequiz/core/utils/constants.dart';
import 'package:onequiz/data/quiz_data_source.dart';
import 'package:onequiz/data/local_quiz_data_source.dart';
import 'package:onequiz/models/question_model.dart';
import 'package:onequiz/widgets/answer_option.dart';
import 'package:onequiz/widgets/base_quiz_widget.dart';
import 'package:onequiz/widgets/question_media.dart';

class QuizScreen extends StatefulWidget {
  const QuizScreen({Key? key}) : super(key: key);

  @override
  State<QuizScreen> createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  int _currentQuestionIndex = 0;
  int? _selectedAnswerIndex;
  int _correctAnswers = 0;
  bool _quizFinished = false;
  QuizDataSource _quizDataSource = LocalQuizDataSource();
  late Future<List<QuestionModel>> _questionsFuture;

  @override
  void initState() {
    super.initState();
    _questionsFuture = _quizDataSource.getQuestions();
  }

  @override
  Widget build(BuildContext context) {
    return BaseQuizWidget(
      title: 'Quiz',
      child: FutureBuilder<List<QuestionModel>>(
        future: _questionsFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else {
            List<QuestionModel> questions = snapshot.data!;
            return _buildQuizBody(questions);
          }
        },
      ),
    );
  }

  Widget _buildQuizBody(List<QuestionModel> questions) {
    if (_quizFinished) {
      return _buildResultScreen(questions);
    } else {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            'Question ${_currentQuestionIndex + 1}/${questions.length}',
            style: const TextStyle(
              fontSize: 16,
              color: AppConstants.primaryColor,
            ),
          ),
          const SizedBox(height: 10),
          QuestionMedia(
            code: questions[_currentQuestionIndex].code,
            imageUrl: questions[_currentQuestionIndex].imageUrl,
            question:
                questions[_currentQuestionIndex]
                    .question, // Tambahkan properti question
          ),
          const SizedBox(height: 20),
          ..._buildAnswerOptions(questions),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ElevatedButton(
                onPressed: _currentQuestionIndex > 0 ? _previousQuestion : null,
                child: const Text("Previous"),
              ),
              ElevatedButton(
                onPressed:
                    _selectedAnswerIndex != null
                        ? () => _nextQuestion(questions)
                        : null,
                child: const Text("Next"),
              ),
            ],
          ),
        ],
      );
    }
  }

  List<Widget> _buildAnswerOptions(List<QuestionModel> questions) {
    List<Widget> options = [];
    for (int i = 0; i < questions[_currentQuestionIndex].answers.length; i++) {
      options.add(
        AnswerOption(
          answer: questions[_currentQuestionIndex].answers[i],
          index: i,
          selectedAnswerIndex: _selectedAnswerIndex,
          onChanged: (int? value) {
            setState(() {
              _selectedAnswerIndex = value;
            });
          },
        ),
      );
    }
    return options;
  }

  void _nextQuestion(List<QuestionModel> questions) {
    if (_selectedAnswerIndex ==
        questions[_currentQuestionIndex].correctAnswerIndex) {
      _correctAnswers++;
    }

    setState(() {
      if (_currentQuestionIndex < questions.length - 1) {
        _currentQuestionIndex++;
        _selectedAnswerIndex = null;
      } else {
        _quizFinished = true;
      }
    });
  }

  void _previousQuestion() {
    setState(() {
      if (_currentQuestionIndex > 0) {
        _currentQuestionIndex--;
        _selectedAnswerIndex = null;
      }
    });
  }

  Widget _buildResultScreen(List<QuestionModel> questions) {
    double score = (_correctAnswers / questions.length) * 100;

    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            "Quiz Completed!",
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 20),
          const Text("Your Score:", style: TextStyle(fontSize: 20)),
          Text(
            "${score.toStringAsFixed(1)}%",
            style: const TextStyle(
              fontSize: 48,
              fontWeight: FontWeight.bold,
              color: AppConstants.primaryColor,
            ),
          ),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              setState(() {
                _currentQuestionIndex = 0;
                _selectedAnswerIndex = null;
                _correctAnswers = 0;
                _quizFinished = false;
              });
            },
            child: const Text("Retry Quiz"),
          ),
        ],
      ),
    );
  }
}
