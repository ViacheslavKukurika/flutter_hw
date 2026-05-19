import 'package:flutter/material.dart';

class RatingSuccessSnackBarContent extends StatelessWidget {
  const RatingSuccessSnackBarContent({super.key});

  static const String _starPath = 'assets/icons/lesson_19/star.png';

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        decoration: BoxDecoration(
          color: Color(0xFF41A6F4),
          borderRadius: BorderRadius.circular(10),
        ),
        padding: EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 20,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              _starPath,
              width: 21,
              height: 20,
            ),
            SizedBox(width: 10),
            Expanded(
              child: Text(
                'Rating submitted successfully',
                textAlign: TextAlign.center,
                maxLines: 1,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                ),
              ),
            ),
            SizedBox(width: 10),
            Image.asset(
              _starPath,
              width: 21,
              height: 20,
            ),
          ],
        ),
      ),
    );
  }
}

// Віджет SnackBar, який сповіщає про усіпішну псевдовідправку на бек, мабуть)
