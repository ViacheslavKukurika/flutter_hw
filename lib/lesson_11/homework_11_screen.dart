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
          style: TextStyle(
            fontSize: 19,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              Expanded(
                child: InteractiveCard(
                  width: 300,
                  normalColor: const Color(0xFF096EEA),
                  pressedColor: const Color(0xFF0652AF),
                  alignment: Alignment.topLeft,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: const InteractiveCard(
                  width: 300,
                  height: 150,
                  normalColor: Color(0xFF08E900),
                  pressedColor: Color(0xFF05A800),
                  alignment: Alignment.center,
                ),
              ),
              const InteractiveCard(
                width: 300,
                height: 150,
                normalColor: Color(0xFFEA090C),
                pressedColor: Color(0xFFB00709),
                alignment: Alignment.bottomRight,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class InteractiveCard extends StatefulWidget {
  const InteractiveCard({
    required this.width,
    required this.normalColor,
    required this.pressedColor,
    required this.alignment,
    this.height,
    super.key,
  });

  final double width;
  final double? height;
  final Color normalColor;
  final Color pressedColor;
  final Alignment alignment;

  @override
  State<InteractiveCard> createState() => _InteractiveCardState();
}

class _InteractiveCardState extends State<InteractiveCard> {
  bool isSelected = false;

  void _toggleCard() {
    setState(() {
      isSelected = !isSelected;
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _toggleCard,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        width: widget.width,
        height: widget.height,
        decoration: BoxDecoration(
          color: isSelected ? widget.pressedColor : widget.normalColor,
          borderRadius: BorderRadius.circular(16),
          boxShadow: isSelected
              ? [
                  const BoxShadow(
                    color: Colors.black26,
                    blurRadius: 8,
                    offset: Offset(0, 4),
                  ),
                ]
              : null,
        ),
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Align(
            alignment: widget.alignment,
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(
                  isSelected ? Icons.star : Icons.star_border,
                  color: const Color(0xFFFFFD71),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  child: const Text(
                    'Привіт, Flutter!',
                    style: TextStyle(
                      color: Color(0xFFFFFFFF),
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Icon(
                  isSelected ? Icons.star : Icons.star_border,
                  color: const Color(0xFFFFFD71),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
