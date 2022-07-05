import 'package:flutter/material.dart';
import 'package:tech_test/utils/text_styles.dart';

class RoundedTextBoxSmall extends StatelessWidget {
  const RoundedTextBoxSmall({
    super.key,
    required this.color,
    required this.text,
  });

  final String text;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        color: color,
        borderRadius: const BorderRadius.all(
          Radius.circular(5),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 7,
          vertical: 5,
        ),
        child: Text(
          text,
          style: kTSOrderTileSubTitle2,
        ),
      ),
    );
  }
}
