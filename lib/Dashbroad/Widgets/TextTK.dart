import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TextTK extends StatelessWidget {
  const TextTK({
    Key? key,
    required this.text,
    this.size = 18,
    this.fontWeight = FontWeight.normal,
    this.color = Colors.black,
    this.overflow = TextOverflow.visible,
    this.maxLines = 1,
    this.textAlign = TextAlign.left,
  }) : super(key: key);
  final String text;
  final double size;
  final FontWeight fontWeight;
  final Color color;
  final TextOverflow overflow;
  final int maxLines;
  final TextAlign textAlign;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: GoogleFonts.getFont('PT Sans',
          fontSize: size, fontWeight: fontWeight, color: color),
      overflow: overflow,
      maxLines: maxLines,
      textAlign: textAlign,
    );
  }
}
