

import 'package:flutter/material.dart';
import 'package:nikeyboots/Resources/constants.dart';

class headings extends StatelessWidget {
  const headings({
    super.key,
    required this.title, required this.onPress,
  });
  final String title;
  final VoidCallback onPress;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        GestureDetector(
          onTap: onPress,
          child: const Text(
            'See all',
            style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.bold,
                color: KCONTANTBLUECOLOR),
          ),
        )
      ],
    );
  }
}
