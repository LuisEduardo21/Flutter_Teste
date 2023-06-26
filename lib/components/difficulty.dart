import 'package:flutter/material.dart';

class Difficulty extends StatelessWidget {
  final int dificultyLevl;
  const Difficulty({required this.dificultyLevl, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          Icons.star,
          size: 15,
          color: (dificultyLevl >= 1) ? Colors.blue : Colors.blue[100],
        ),
        Icon(
          Icons.star,
          size: 15,
          color: (dificultyLevl >= 2) ? Colors.blue : Colors.blue[100],
        ),
        Icon(
          Icons.star,
          size: 15,
          color: (dificultyLevl >= 3) ? Colors.blue : Colors.blue[100],
        ),
        Icon(
          Icons.star,
          size: 15,
          color: (dificultyLevl >= 4) ? Colors.blue : Colors.blue[100],
        ),
        Icon(
          Icons.star,
          size: 15,
          color: (dificultyLevl >= 5) ? Colors.blue : Colors.blue[100],
        ),
      ],
    );
  }
}
