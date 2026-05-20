import 'package:flutter/material.dart';

/* ---------------------- class RatingStarsWidget ----------------------

  class RatingStarsWidget - це клас (віджет), який відповідає за фіксування
натиснення (GestureDetector)та відмальовування зірочок. 

Основа цього класу - Row, точніше, його діти, які будуть розташовані в ряд.
Метод List.generate(5, (index) - створює по черзі кожну із 5-ти зірочок. Зірочка
створюється завдяки "return GestureDetector" (викликається 5 разів), який реагує
на натискання.

final starNumber = index + 1 - щоб перша зірочка відповідала 1, а не 0;

final isFull = starNumber <= rating - логіка вибору стану зірки (заповнювання
зірочок): якщо натиснуто на 4-ту позицію (зірочку), то будуть зафарбовані
зірочки, які відповідаться умові : <= 4.
---------------------------------------------------------------------*/

class RatingStarsWidget extends StatelessWidget {
  const RatingStarsWidget({
    required this.rating,
    required this.onRatingChanged,
    super.key,
  });

  final int rating;
  final void Function(int rating) onRatingChanged;

  static const String _starEmptyPath = 'assets/icons/lesson_19/empy_star.png';
  static const String _starFullPath = 'assets/icons/lesson_19/full_star.png';

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      spacing: 20,
      children: List.generate(5, (index) {
        final starNumber = index + 1;
        final isFull = starNumber <= rating;
        return GestureDetector(
          onTap: () {
            onRatingChanged(starNumber);
          },
          child: Image.asset(
            isFull ? _starFullPath : _starEmptyPath,
            height: 32,
            width: 34,
          ),
        );
      }),
    );
  }
}
