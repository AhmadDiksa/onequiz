import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class QuestionMedia extends StatelessWidget {
  final String question;
  final String? code;
  final String? imageUrl;

  const QuestionMedia({
    Key? key,
    required this.question,
    this.code,
    this.imageUrl,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget mediaWidget;

    if (imageUrl != null && imageUrl?.isNotEmpty == true) {
      mediaWidget = Image.network(
        imageUrl!,
        fit: BoxFit.contain,
        loadingBuilder: (
          BuildContext context,
          Widget child,
          ImageChunkEvent? loadingProgress,
        ) {
          if (loadingProgress == null) return child;
          return Center(
            child: CircularProgressIndicator(
              value:
                  loadingProgress.expectedTotalBytes != null
                      ? loadingProgress.cumulativeBytesLoaded /
                          loadingProgress.expectedTotalBytes!
                      : null,
            ),
          );
        },
        errorBuilder: (
          BuildContext context,
          Object exception,
          StackTrace? stackTrace,
        ) {
          return const Text('Failed to load image');
        },
      );
    } else if (code != null && code?.isNotEmpty == true) {
      // Perbaikan di sini
      mediaWidget = Container(
        padding: const EdgeInsets.all(8.0),
        decoration: BoxDecoration(
          color: Colors.grey[800],
          borderRadius: BorderRadius.circular(10),
        ),
        child: SelectableText(
          //Selectable
          code!,
          style: const TextStyle(
            fontFamily: 'Courier New',
            color: Colors.white,
          ),
        ),
      );
    } else {
      mediaWidget =
          const SizedBox.shrink(); // Tidak menampilkan apa-apa jika tidak ada code atau imageUrl
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start, // Teks rata kiri
      children: [
        Text(
          // Selalu Tampilkan Teks Pertanyaan
          question,
          style: GoogleFonts.poppins(fontSize: 18),
        ),
        const SizedBox(height: 8),
        mediaWidget, // Menampilkan media (gambar atau kode)
      ],
    );
  }
}
