//import 'dart:js_util';
import 'package:flutter/material.dart';
import 'package:infinity_scroll/ramdomWord.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Gerador de Nomes',
      home: RandomWords(),
    );
  }
}
