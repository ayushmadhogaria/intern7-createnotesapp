import 'package:flutter/material.dart';
import 'package:intern7/providers/notes_provider.dart';
import 'package:provider/provider.dart';
import 'screens/home_screen.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const Notes());
}

class Notes extends StatelessWidget {
  const Notes({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => NotesProvider(),
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: HomeScreen(),
      ),
    );
  }
}

class NunitoText extends StatelessWidget {
  final String title;
  final double size;
  final FontWeight number;
  final Color textColor;
  const NunitoText({
    super.key,
    required this.title,
    required this.size,
    required this.number,
    required this.textColor,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: GoogleFonts.nunito(
          fontSize: size, fontWeight: number, color: textColor),
      textAlign: TextAlign.center,
    );
  }
}
