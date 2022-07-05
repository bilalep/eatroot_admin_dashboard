import 'package:flutter/material.dart';
import 'package:tech_test/utils/text_styles.dart';

class RoundedTextBoxMedium extends StatelessWidget {
  const RoundedTextBoxMedium({
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
          horizontal: 9,
          vertical: 7,
        ),
        child: Center(
          child: Text(
            text,
            style: kTSOrderTileSubTitle1,
          ),
        ),
      ),
    );
  }
}
