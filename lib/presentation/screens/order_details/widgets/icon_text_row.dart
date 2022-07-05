import 'package:flutter/material.dart';
import 'package:tech_test/utils/colors.dart';
import 'package:tech_test/utils/text_styles.dart';

class IconTextRow extends StatelessWidget {
  const IconTextRow({
    super.key,
    required this.text,
    required this.iconData,
  });

  final String text;
  final IconData iconData;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CircleAvatar(
          backgroundColor: kColorPrimaryPink,
          radius: 14,
          child: Icon(
            iconData,
            color: Colors.white,
            size: 20,
          ),
        ),
        const SizedBox(
          width: 5,
        ),
        Expanded(
          child: Tooltip(
            message: text,
            child: Padding(
              padding: const EdgeInsets.only(top: 2),
              child: Text(
                buildMultiLineText(text),
                style: kTSMedium15Black,
                maxLines: 5,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ),
        ),
      ],
    );
  }

  String buildMultiLineText(String text) {
    final lines = text.split(',');
    final multiLineList = <String>[];
    for (final element in lines) {
      multiLineList.add(element.trim());
    }
    return multiLineList.join(',\n');
  }
}
