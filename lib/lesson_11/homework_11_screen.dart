import 'package:flutter/material.dart';

class Homework11Screen extends StatelessWidget {
  const Homework11Screen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        foregroundColor: Colors.white,
        title: const Text(
          'Лекція 11 (ДЗ №7)',
          style: TextStyle(fontSize: 19, fontWeight: FontWeight.bold),
        ),
      ),
      body: Center(
        child: Container(
          width: 300,
          height: 150,
          decoration: BoxDecoration(
            color: Colors.blue,
            borderRadius: BorderRadius.circular(16),
          ),
        ),
      ),
    );
  }
}
