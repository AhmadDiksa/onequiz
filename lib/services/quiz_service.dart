// // import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:quizku/models/question_model.dart';

// class QuizService {
//   // Fungsi untuk memuat pertanyaan dari Firestore
//   Future<List<QuestionModel>> loadQuestions() async {
//     QuerySnapshot<Map<String, dynamic>> querySnapshot =
//         await FirebaseFirestore.instance.collection('questions').get();

//     // Konversi data Firestore ke format QuestionModel
//     List<QuestionModel> questions =
//         querySnapshot.docs
//             .map((doc) => QuestionModel.fromJson(doc.data()))
//             .toList();

//     return questions;
//   }

//   // Fungsi untuk memeriksa apakah jawaban benar
//   bool isCorrectAnswer(QuestionModel question, int selectedAnswerIndex) {
//     return selectedAnswerIndex == question.correctAnswerIndex;
//   }
// }
