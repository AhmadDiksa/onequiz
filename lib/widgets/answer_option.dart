import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AnswerOption extends StatelessWidget {
  final String answer;
  final int index;
  final int? selectedAnswerIndex;
  final ValueChanged<int?> onChanged;

  const AnswerOption({
    Key? key,
    required this.answer,
    required this.index,
    required this.selectedAnswerIndex,
    required this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2, // Tambahkan elevasi
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
        side: selectedAnswerIndex == index
            ? const BorderSide(color: Colors.blue, width: 2.0)
            : BorderSide.none,
      ),
      child: InkWell(
        onTap: () {
          onChanged(index);
        },
        borderRadius: BorderRadius.circular(10.0), // Tambahkan border radius ke InkWell
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            children: [
              Radio<int>(
                value: index,
                groupValue: selectedAnswerIndex,
                onChanged: onChanged,
              ),
              Text(
                answer,
                style: GoogleFonts.poppins(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}