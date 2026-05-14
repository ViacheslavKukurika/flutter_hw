import 'package:flutter/material.dart';
import 'package:flutter_hw/router/app_routes.dart';
import 'package:go_router/go_router.dart';

class StateManagmentBaseScreen extends StatelessWidget {
  const StateManagmentBaseScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        foregroundColor: Colors.white,
        title: Text('BLoC/Cubit:'),
      ),
      body: Center(
        child: Column(
          children: [
            SizedBox(height: 200),
            ElevatedButton(
              onPressed: () {
                context.goNamed(AppRoutesNames.homework11Cubit);
              },
              child: 
              Text('Cubit Example'),
            ),
          ],
        ),
      ),
    );
  }
}
