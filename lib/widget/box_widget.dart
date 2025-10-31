import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class box_widget extends StatelessWidget {
  box_widget({super.key, required this.text, required this.icon});
  final String text;
  final Icon icon;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),

      child: Container(
        padding: EdgeInsets.all(8),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: const Color.fromARGB(255, 46, 91, 113),
        ),
        child: Row(
          children: [
            Spacer(flex: 2),

            icon,
            Spacer(flex: 1),

            Text(
              text,
              style: GoogleFonts.acme(fontSize: 20, color: Colors.white),
            ),
            Spacer(flex: 2),
          ],
        ),
      ),
    );
  }
}
