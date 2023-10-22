import 'package:flutter/material.dart';

class TextWidget extends StatelessWidget {
  const TextWidget({
    super.key,
    required this.text,
    this.size = 30,
    this.isBold = false,
    this.color = Colors.black,
    this.overflow = TextOverflow.ellipsis,
    this.lineThrough = false,
  });
  final String text;
  final double size;
  final bool isBold;
  final Color color;
  final TextOverflow overflow;
  final bool lineThrough;
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      overflow: overflow,
      style: TextStyle(
        fontSize: size,
        fontWeight: isBold ? FontWeight.bold : FontWeight.normal,
        color: color,
        decoration: lineThrough ? TextDecoration.lineThrough : null,
      ),
    );
  }
}
