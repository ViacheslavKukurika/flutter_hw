import 'package:flutter/material.dart';

enum VoteType {
  like,
  dislike,
}

class Homework12Screen extends StatefulWidget {
  const Homework12Screen({super.key});

  @override
  State<Homework12Screen> createState() => _Homework12ScreenState();
}

class _Homework12ScreenState extends State<Homework12Screen> {
  int _visitRating = 0;
  VoteType? _bakeryServiceVote;
  VoteType? _bakeryAssortmentVote;
  VoteType? _traditionServiceVote;
  VoteType? _traditionAssortmentVote;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFEEF2FC), //true
      appBar: AppBar(
        backgroundColor: Color(0xFFFFFFFF),
        titleSpacing: 0,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back_ios_new,
            size: 22,
            color: Color(0xFF5E5F61),
          ),
        ),
        title: const Text(
          'Оцінка візиту до магазину',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w600,
            color: Color(0xFF202124),
          ),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  _buildHeader(),
                  const SizedBox(height: 32),
                  const Text(
                    'Яку оціночку поставите відділам?',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      color: Color(0xFF13131E), // true
                    ),
                  ),
                  const SizedBox(height: 16),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16),
                    child: ReviewDepartmentCard(
                      title: 'Випічка',
                      serviceVote: _bakeryServiceVote,
                      assortmentVote: _bakeryAssortmentVote,
                      onServiceVoteChanged: (vote) {
                        setState(() {
                          _bakeryServiceVote = vote;
                        });
                      },
                      onAssortmentVoteChanged: (vote) {
                        setState(() {
                          _bakeryAssortmentVote = vote;
                        });
                      },
                    ),
                  ),
                  const SizedBox(height: 16),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: ReviewDepartmentCard(
                      title: 'Лавка традицій',
                      serviceVote: _traditionServiceVote,
                      assortmentVote: _traditionAssortmentVote,
                      onServiceVoteChanged: (vote) {
                        setState(() {
                          _traditionServiceVote = vote;
                        });
                      },
                      onAssortmentVoteChanged: (vote) {
                        setState(() {
                          _traditionAssortmentVote = vote;
                        });
                      },
                    ),
                  ),
                  const SizedBox(height: 22),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Є що додати?',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                            color: Color(0xFF13131E),
                          ),
                        ),
                        SizedBox(height: 12),
                        ReviewTextField(
                          hintText: 'Поділіться загальними враженнями',
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 24),
                ],
              ),
            ),
          ),
          SafeArea(
            top: false,
            child: Padding(
              padding: const EdgeInsets.fromLTRB(16, 12, 16, 16),
              child: SizedBox(
                width: double.infinity,
                height: 48,
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF1135BA),
                    foregroundColor: Colors.white,
                    elevation: 0,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 24,
                      vertical: 10,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(24),
                    ),
                  ),
                  child: const Text(
                    'Надіслати',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  /* Те, що нижче, я б виніс в окремі папки, якби це був би реальний проект,
  але для зручності перевірки (мабуть, я так думаю, буде легше) залишу все 
  тут, в одному файлі.
  */

  Widget _buildHeader() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.only(
        top: 16,
        bottom: 16,
      ),
      decoration: const BoxDecoration(
        color: Color(0xFFFFFFFF), // true
        borderRadius: BorderRadius.vertical(
          bottom: Radius.circular(24), // true
        ),
      ),
      child: RatingStars(
        rating: _visitRating,
        onRatingChanged: (rating) {
          setState(() {
            _visitRating = rating;
          });
        },
      ),
    );
  }
}

/* Кастомний віджет, який не зберігає стан, а 
лише відповідає за відмальовування UI */

class RatingStars extends StatelessWidget {
  const RatingStars({
    required this.rating,
    required this.onRatingChanged,
    super.key,
  });

  final int rating;
  final ValueChanged<int> onRatingChanged;

  static const String _starEmptyPath = 'assets/icons/lesson_12/star_empty.png';

  static const String _starFilledPath =
      'assets/icons/lesson_12/star_filled.png';

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(5, (index) {
        final starNumber = index + 1;
        final isFilled = starNumber <= rating;

        return GestureDetector(
          onTap: () {
            onRatingChanged(starNumber);
          },
          child: Padding(
            padding: EdgeInsets.only(
              right: index == 4 ? 0 : 8,
            ),
            child: Transform.scale(
              scale: isFilled ? 1.25 : 1,
              child: Image.asset(
                isFilled ? _starFilledPath : _starEmptyPath,
                width: 48,
                height: 48,
              ),
            ),
          ),
        );
      }),
    );
  }
}

/* class RatingStars - це клас, який відповідає за фіксування (GestureDetector)
та відмальовування зірочок. Він відрізняється від 2-х інших карток, тому далі
буде створений ще один окремий кастомний віджет для малювання карток "Випічка"
та "Лавка традицій". 

final starNumber = index + 1 - для того, щоб перша зірочка = 1, а не 0;
final isFilled = starNumber <= rating - логіка вибору стану зірки (заповнювання
зірочок): якщо натиснуто на 4-ту позицію (зірочку), то будуть зафарбовані
зірочки, які відповідаться умові : <= 4.

padding: EdgeInsets.only(
right: index == 4 ? 0 : 8 - створення відступу лише між зірочками, тобто ми
вказуємо, що не треба робити відступу від крайньої 5-ї зірки до правого краю */

class ReviewDepartmentCard extends StatelessWidget {
  const ReviewDepartmentCard({
    required this.title,
    required this.serviceVote,
    required this.assortmentVote,
    required this.onServiceVoteChanged,
    required this.onAssortmentVoteChanged,
    super.key,
  });

  final String title;
  final VoteType? serviceVote;
  final VoteType? assortmentVote;
  final ValueChanged<VoteType> onServiceVoteChanged;
  final ValueChanged<VoteType> onAssortmentVoteChanged;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFFFFFFFF),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
              color: Color(0xFF13131E),
            ),
          ),
          const SizedBox(height: 16),
          ReviewOptionRow(
            title: 'Обслуговування',
            selectedVote: serviceVote,
            onVoteChanged: onServiceVoteChanged,
          ),
          const SizedBox(height: 8),
          ReviewOptionRow(
            title: 'Асортимент',
            selectedVote: assortmentVote,
            onVoteChanged: onAssortmentVoteChanged,
          ),
          const SizedBox(height: 16),
          const ReviewTextField(
            hintText: 'Розкажіть докладніше',
          ),
        ],
      ),
    );
  }
}

class ReviewOptionRow extends StatelessWidget {
  const ReviewOptionRow({
    required this.title,
    required this.selectedVote,
    required this.onVoteChanged,
    super.key,
  });

  final String title;
  final VoteType? selectedVote;
  final ValueChanged<VoteType> onVoteChanged;

  static const String _likeEmptyPath = 'assets/icons/lesson_12/like_empty.png';

  static const String _likeFilledPath =
      'assets/icons/lesson_12/like_filled.png';

  static const String _dislikeEmptyPath =
      'assets/icons/lesson_12/dislike_empty.png';

  static const String _dislikeFilledPath =
      'assets/icons/lesson_12/dislike_filled.png';

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 48,
      padding: const EdgeInsets.only(left: 16, right: 8),
      decoration: BoxDecoration(
        color: Color(0xFFF6F8FD),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          Expanded(
            child: Text(
              title,
              style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w500,
                color: Color(0xFF13131E),
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              onVoteChanged(VoteType.dislike);
            },
            child: Image.asset(
              selectedVote == VoteType.dislike
                  ? _dislikeFilledPath
                  : _dislikeEmptyPath,
              width: 32,
              height: 32,
            ),
          ),
          const SizedBox(width: 8),
          GestureDetector(
            onTap: () {
              onVoteChanged(VoteType.like);
            },
            child: Image.asset(
              selectedVote == VoteType.like ? _likeFilledPath : _likeEmptyPath,
              width: 32,
              height: 32,
            ),
          ),
        ],
      ),
    );
  }
}

class ReviewTextField extends StatelessWidget {
  const ReviewTextField({
    required this.hintText,
    super.key,
  });

  final String hintText;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 48,
      child: TextField(
        decoration: InputDecoration(
          filled: true,
          fillColor: const Color(0xFFF6F8FD),
          hintText: hintText,
          hintStyle: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w400,
            color: Color(0xFF8E9199),
          ),
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 12,
            vertical: 12,
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: const BorderSide(
              color: Color(0xFF1135BA),
            ),
          ),
        ),
      ),
    );
  }
}
