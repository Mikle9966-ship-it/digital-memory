import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Digital Memory',
      home: Scaffold(
        appBar: AppBar(title: const Text('Digital Memory')),
        body: const Center(child: Text('Welcome to Digital Memory!')),
      ),
    );
  }
}