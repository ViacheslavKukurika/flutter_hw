import 'package:flutter/material.dart';

/* Віджет SnackBar, який спочатку задумувався для сповіщення
про помилку */

class RatingErrorSnackBarContent extends StatelessWidget {
  const RatingErrorSnackBarContent({super.key});

  static const String _sadDogPath = 'assets/icons/lesson_19/sadDog.webp';

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.sizeOf(context);
    final snackBarHeight = screenSize.height * 0.25;
    final dogSize = screenSize.width * 0.25;

    return SizedBox(
      width: double.infinity,
      height: snackBarHeight,
      child: Container(
        decoration: const BoxDecoration(
          color:  Color(0xFFA5E0FF),
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(24),
          ),
        ),
        padding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 20,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Ну і от, 0 з 5...',
              textAlign: TextAlign.center,
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
