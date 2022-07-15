import 'package:flutter/material.dart';
import 'package:tech_test/utils/colors.dart';
import 'package:tech_test/utils/constants.dart';
import 'package:tech_test/utils/text_styles.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  static const routeName = 'settings_screen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kColorWhite,
      appBar: AppBar(
        foregroundColor: kColorBlack,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back_ios,
          ),
        ),
        centerTitle: true,
        title: Text(
          'Profile',
          style: AppTextStyles.semiBoldExtraLarge(),
        ),
        elevation: 0,
        backgroundColor: kColorWhite,
      ),
      body: Column(
        children: [
          const SizedBox(
            height: 16,
          ),
          const Icon(
            Icons.account_circle,
            size: 100,
            color: kColorBlack,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                kUserName,
                style: AppTextStyles.boldHuge(),
              ),
            ],
          ),
          const SizedBox(
            height: 16,
          ),
          // const ProfileDetails(),
          const SizedBox(
            height: 16,
          ),
          // const ProfileActions(),
        ],
      ),
    );
  }
}
