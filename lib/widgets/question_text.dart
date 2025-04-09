import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

/// Widget untuk menampilkan teks pertanyaan dalam kuis
/// Menggunakan StatelessWidget karena tidak ada perubahan status yang diperlukan
class QuestionText extends StatelessWidget {
  final String question;

  const QuestionText({super.key, required this.question});

  @override
  Widget build(BuildContext context) {
    return Text(
      question,
      style: GoogleFonts.poppins(fontSize: 18),
    );
  }
}