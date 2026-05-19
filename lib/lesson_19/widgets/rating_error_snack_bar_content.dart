import 'package:flutter/material.dart';

class RatingErrorSnackBarContent extends StatelessWidget {
  const RatingErrorSnackBarContent({super.key});

  static const String _sadDogPath = 'assets/icons/lesson_19/sadDog.png';

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.sizeOf(context).width;
    final dogSize = screenWidth * 0.33;

    return Center(
      child: Container(
        decoration: BoxDecoration(
          color: const Color.fromARGB(255, 190, 190, 190),
          borderRadius: BorderRadius.circular(10),
        ),
        padding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 16,
        ),
        child: Column(
          children: [
            Text(
              'Ну і от, 0 з 5...',
              style: TextStyle(
                fontSize: 25,
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 15),
            Image.asset(
              _sadDogPath,
              width: dogSize,
              height: dogSize,
              fit: BoxFit.contain,
            ),
          ],
        ),
      ),
    );
  }
}

/* Віджет SnackBar, який спочатку задумувався для сповіщення
про помилку */
