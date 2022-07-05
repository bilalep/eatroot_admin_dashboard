import 'package:flutter/material.dart';
import 'package:tech_test/utils/colors.dart';

class TopContainerPink extends StatelessWidget {
  const TopContainerPink({super.key, this.child, this.padding});

  final Widget? child;
  final EdgeInsets? padding;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(30),
          bottomRight: Radius.circular(30),
        ),
        color: kColorPrimaryPink,
      ),
      padding: padding,
      child: child,
    );
  }
}
