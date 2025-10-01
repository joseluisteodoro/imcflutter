import 'package:flutter/material.dart';

class TextTable extends StatelessWidget {
  final String texto;
  const TextTable({super.key, required this.texto});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 0, vertical: 0),
      child: Text(
        texto,
        textAlign: TextAlign.center,
        style: TextStyle(
          color: Colors.white,
        )),
      );
      
  }
}
