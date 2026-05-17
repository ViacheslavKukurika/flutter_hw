import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class RateAppScreen extends StatefulWidget {
  const RateAppScreen({super.key});

  @override
  State<RateAppScreen> createState() => _RateAppScreenState();
}

class _RateAppScreenState extends State<RateAppScreen> {
  int _visitRating = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFA5E0FF),
      appBar: AppBar(
        backgroundColor: Color(0xFF1B3D70),
        foregroundColor: Colors.white,
        automaticallyImplyLeading: false,
        centerTitle: true,
        leading: IconButton(
          onPressed: () => context.pop(),
          icon: const Icon(Icons.arrow_back_ios_new),
        ),
        title: Text(
          'Flutter lab',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
      body: Align(
        alignment: Alignment.topCenter,
        child: RatingWidget(
          rating: _visitRating,
          onRatingChanged: (rating) {
            setState(() {
              _visitRating = rating;
            });
          },
        ),
      ),
    );
  }
}

class RatingWidget extends StatelessWidget {
  const RatingWidget({
    required this.rating,
    required this.onRatingChanged,
    super.key,
  });

  final int rating;
  final void Function(int rating) onRatingChanged;

  static const String _circularArrowPath =
      'assets/icons/lesson_19/circular_arrow.png';

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.only(top: 48),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 32),
      decoration: BoxDecoration(
        color: Color(0xFF72C1FA),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            'How would you rate the app?',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight(600),
              color: Color(0xFF1B3D70),
            ),
          ),
          SizedBox(height: 24),
          RatingStarsWidget(
            rating: rating,
            onRatingChanged: onRatingChanged,
          ),
          SizedBox(height: 24),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFF1B3D70),
                    foregroundColor: Colors.white,
                    elevation: 4,
                    shadowColor: Colors.black.withValues(alpha: 0.25),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    padding: EdgeInsets.symmetric(
                      horizontal: 30,
                      vertical: 13,
                    ),
                  ),
                  child: Text(
                    'Submit rating',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
              SizedBox(width: 10),
              Expanded(
                child: ElevatedButton.icon(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFF41A6F4),
                    foregroundColor: Colors.white,
                    elevation: 4,
                    shadowColor: Colors.black.withValues(alpha: 0.25),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    padding: EdgeInsets.symmetric(
                      horizontal: 22,
                      vertical: 13,
                    ),
                  ),
                  icon: Image.asset(
                    _circularArrowPath,
                     width: 16,
                     height: 16,
                    ),
                  label: Text(
                    'Reset rating',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

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
      children: List.generate(5, (index) {
        final starNumber = index + 1;
        final isFull = starNumber <= rating;
        return GestureDetector(
          onTap: () {
            onRatingChanged(starNumber);
          },
          child: Padding(
            padding: EdgeInsets.only(
              right: index == 4 ? 0 : 20,
            ),
            child: Image.asset(
              isFull ? _starFullPath : _starEmptyPath,
              height: 32,
              width: 34,
            ),
          ),
        );
      }),
    );
  }
}

/* ---------------------- class RatingStars ----------------------

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

padding: EdgeInsets.only(
right: index == 4 ? 0 : 20 - створення відступу лише між зірочками, тобто ми
вказуємо, що не треба робити відступу від крайньої 5-ї зірки до правого краю

---------------------------------------------------------------------*/
