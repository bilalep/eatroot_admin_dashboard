import 'package:flutter/material.dart';
import 'package:tech_test/utils/colors.dart';
import 'package:tech_test/utils/text_styles.dart';

class NoInternetScreen extends StatelessWidget {
  const NoInternetScreen({super.key});

  static const routeName = 'no_internet_screen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Icons.signal_wifi_off, size: 100, color: Colors.red),
              Text(
                'No internet connection',
                style: AppTextStyles.boldLarge(color: kColorPrimaryPink),
              )
            ],
          ),
        ],
      ),
    );
  }
}
