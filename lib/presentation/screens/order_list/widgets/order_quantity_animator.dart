import 'package:flutter/cupertino.dart';
import 'package:tech_test/utils/colors.dart';
import 'package:tech_test/utils/text_styles.dart';

const _orderQuantityAnimatorDuration = Duration(milliseconds: 600);

class OrderQuantityAnimator extends ImplicitlyAnimatedWidget {
  const OrderQuantityAnimator({
    super.key,
    required this.endValue,
    super.curve,
  }) : super(duration: _orderQuantityAnimatorDuration);

  final int endValue;

  @override
  ImplicitlyAnimatedWidgetState<ImplicitlyAnimatedWidget> createState() =>
      _OrderQuantityAnimatorState();
}

class _OrderQuantityAnimatorState
    extends AnimatedWidgetBaseState<OrderQuantityAnimator> {
  IntTween? _valueTween;

  @override
  Widget build(BuildContext context) {
    return Text(
      '${_valueTween?.evaluate(animation)}',
      style: AppTextStyles.boldExtraLarge(color: kColorYellow),
    );
  }

  @override
  void forEachTween(TweenVisitor<dynamic> visitor) {
    _valueTween = visitor(_valueTween, widget.endValue, (dynamic value) {
      return IntTween(begin: value as int);
    }) as IntTween?;
  }
}
