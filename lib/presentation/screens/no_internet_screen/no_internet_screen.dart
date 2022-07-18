import 'package:flutter/material.dart';
import 'package:tech_test/presentation/core/widgets/empty_states_column.dart';
import 'package:tech_test/presentation/screens/no_internet_screen/widgets/no_internet_icon_painter.dart';

class NoInternetScreen extends StatelessWidget {
  const NoInternetScreen({super.key});

  static const routeName = 'no_internet_screen';
  static const double _iconWidth = 200;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          EmptyStatesColumn(
            title: 'Oops!, No Internet Connection',
            icon: CustomPaint(
              size: Size(
                _iconWidth,
                (_iconWidth * 0.8202614379084967).toDouble(),
              ),
              painter: NoInternetIconPainter(),
            ),
            subTitle: 'Please check your internet connection \nand try again.',
            iconWidth: _iconWidth,
          ),
          // Column(
          //   mainAxisAlignment: MainAxisAlignment.center,
          //   children: [
          //     CustomPaint(
          //       size: Size(
          //         _iconWidth,
          //         (_iconWidth * 0.8202614379084967).toDouble(),
          //       ),
          //       painter: ,
          //     ),
          //     const SizedBox(height: 32),
          //     Text(
          //       'Oops!, No Internet Connection',
          //       style: AppTextStyles.boldLarge(),
          //     ),
          //     const SizedBox(height: 8),
          //     Text(
          //
          //       style: AppTextStyles.mediumBody(
          //         color: kColorBlack.withOpacity(0.7),
          //       ),
          //       textAlign: TextAlign.center,
          //     ),
          //   ],
          // ),
        ],
      ),
    );
  }
}
