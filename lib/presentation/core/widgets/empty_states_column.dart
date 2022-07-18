import 'package:flutter/material.dart';
import 'package:tech_test/utils/colors.dart';
import 'package:tech_test/utils/text_styles.dart';

class EmptyStatesColumn extends StatelessWidget {
  const EmptyStatesColumn({
    super.key,
    required this.title,
    required this.icon,
    required this.subTitle,
    required this.iconWidth,
  });

  final Widget icon;
  final String title;
  final String subTitle;
  final double iconWidth;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _EmptyStatesIconContainer(
          iconWidth: iconWidth,
          child: icon,
        ),
        const SizedBox(height: 32),
        Text(
          title,
          style: AppTextStyles.boldLarge(),
        ),
        const SizedBox(height: 8),
        Text(
          subTitle,
          style: AppTextStyles.mediumBody(
            color: kColorBlack.withOpacity(0.7),
          ),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}

class _EmptyStatesIconContainer extends StatelessWidget {
  const _EmptyStatesIconContainer({
    super.key,
    required this.iconWidth,
    required this.child,
  });

  final double iconWidth;
  double get iconContainerWidth => iconWidth + 32;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints(),
      width: iconContainerWidth,
      height: iconContainerWidth,
      decoration: BoxDecoration(
        color: kColorWhite,
        borderRadius: BorderRadius.circular(
          iconContainerWidth / 2,
        ),
        boxShadow: [
          BoxShadow(
            color: kColorBlue.withOpacity(0.1),
            blurRadius: 10,
            spreadRadius: 1,
            offset: const Offset(0, 5),
          )
        ],
      ),
      child: Center(child: child),
    );
  }
}
