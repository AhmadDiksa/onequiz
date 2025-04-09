import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class BaseQuizWidget extends StatelessWidget {
  final Widget child;
  final String? title;

  const BaseQuizWidget({Key? key, required this.child, this.title})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: title != null
          ? AppBar(
              title: Text(
                title!,
                style: GoogleFonts.poppins(),
              ),
              leading: IconButton(
                icon: const Icon(Icons.arrow_back),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            )
          : null,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: child,
      ),
    );
  }
}