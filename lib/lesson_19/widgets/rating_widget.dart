import 'package:flutter/material.dart';
import 'package:flutter_hw/lesson_19/widgets/rating_stars_widget.dart';

class RatingWidget extends StatelessWidget {
  const RatingWidget({
    required this.rating,
    required this.isLoading,
    required this.onRatingChanged,
    required this.onResetRating,
    required this.onSubmitRating,
    super.key,
  });

  final int rating;
  final void Function(int rating) onRatingChanged;
  final bool isLoading;
  final VoidCallback onResetRating;
  final Future<void> Function() onSubmitRating;

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
                  onPressed: isLoading ? null : onSubmitRating,
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
                  child: isLoading
                      ? SizedBox(
                          width: 18,
                          height: 18,
                          child: CircularProgressIndicator(
                            strokeWidth: 2,
                            color: Colors.white,
                          ),
                        )
                      : Text(
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
                  onPressed: isLoading ? null : onResetRating,
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

// Основний UI-віджет, у який вкладений інший віджет - RatingStarsWidget
