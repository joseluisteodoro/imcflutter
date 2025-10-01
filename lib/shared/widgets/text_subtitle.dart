
import 'package:flutter/material.dart';

class TextSubtitle extends StatelessWidget {
  final String texto;
  const TextSubtitle({super.key, required this.texto});

  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.all(8.0),
      child: Text(
        texto,
        style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),
      ),
    );
  }
}