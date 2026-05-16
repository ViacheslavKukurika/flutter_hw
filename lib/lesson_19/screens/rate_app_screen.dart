import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class RateAppScreen extends StatelessWidget {
  const RateAppScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF1B3D70),
        foregroundColor: Colors.white,
        automaticallyImplyLeading: false,
        centerTitle: true,
        leading: IconButton(
          onPressed: () => context.pop(),
           icon: const Icon(Icons.arrow_back_ios_new)),
        title: Text(
          'Flutter lab',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight(500),
          ),
        ),
      ),
    );
  }
}
