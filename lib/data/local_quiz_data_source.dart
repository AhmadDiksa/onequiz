// file ini berisi fungsi untuk menampilkan pertanyaan dan pilihan jawaban
import 'package:onequiz/data/quiz_data_source.dart';
import 'package:onequiz/models/question_model.dart';

class LocalQuizDataSource implements QuizDataSource {
  @override   
  Future<List<QuestionModel>> getQuestions() async {
    // Dummy data
    return [
      QuestionModel(
        question: 'Apa output dari kode berikut?\n\nprint(2 + 3)',
        code: 'print(2 + 3)',
        answers: ['5', '6', '7', 'Error'],
        correctAnswerIndex: 0,
      ),
      QuestionModel(
        question: 'Apa yang dimaksuds dengan variabel dalam pemrograman?',
        answers: [
          'Tempat untuk menyimpan data sementara',
          'Fungsi untuk menghitung nilai',
          'Tipe data yang digunakan dalam pemrograman',
          'Struktur kontrol dalam pemrograman',
        ],
        correctAnswerIndex: 0,
      ),
      QuestionModel(
        question:
            'Apa output dari kode berikut?\n\nfor i in range(5):\n    print(i)',
        code: 'for i in range(5):\n    print(i)',
        answers: ['0 1 2 3 4', '1 2 3 4 5', '0 1 2 3 4 5', 'Error'],
        correctAnswerIndex: 0,
      ),
      QuestionModel(
        question: 'Siapakah penemu bahasa pemrograman C?',
        answers: [
          'Dennis Ritchie',
          'Bjarne Stroustrup',
          'James Gosling',
          'Guido van Rossum',
        ],
        correctAnswerIndex: 0,
      ),
      QuestionModel(
        question:
            'Sebutkan bahasa pemrograman yang bukan termasuk bahasa pemrograman berorientasi objek?',
        answers: ['Pascal', 'Java', 'C++', 'C#'],
        correctAnswerIndex: 0,
      ),
      QuestionModel(
        question: 'Apa yang dimaksud dengan algoritma dalam pemrograman?',
        answers: [
          'Langkah-langkah untuk menyelesaikan masalah',
          'Bahasa pemrograman yang digunakan',
          'Tipe data dalam pemrograman',
          'Fungsi dalam pemrograman',
        ],
        correctAnswerIndex: 0,
      ),
      QuestionModel(
        question: 'Apa output dari kode berikut?\n\nprint("Hello, World!")',
        code: 'print("Hello, World!")',
        answers: ['Hello', 'World', 'Hello, World!', 'Error'],
        correctAnswerIndex: 2,
      ),
      QuestionModel(question:'Apa yang dimaksud dengan debugging dalam pemrograman?',
          answers: [
            'Proses mencari dan memperbaiki kesalahan dalam kode',
            'Proses menulis kode baru',
            'Proses mengompilasi kode',
            'Proses menjalankan kode',
          ],
          correctAnswerIndex: 0),
      QuestionModel(question:
          'Apa yang dimaksud dengan loop dalam pemrograman?',
          answers: [
            'Proses mengulang suatu blok kode',
            'Proses menulis kode baru',
            'Proses mencari kesalahan dalam kode',
            'Proses mengompilasi kode',
          ],
          correctAnswerIndex: 0),
      QuestionModel(
        question: 'Apa output dari kode berikut?\n\nprint(5 * 2)',
        code: 'print(5 * 2)',
        answers: ['10', '7', '12', 'Error'],
        correctAnswerIndex: 0,
      ),
    ];
  }
}
