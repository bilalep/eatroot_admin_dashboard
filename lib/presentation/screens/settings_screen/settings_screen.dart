import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sentry_flutter/sentry_flutter.dart';
import 'package:tech_test/presentation/screens/login/login_screen.dart';
import 'package:tech_test/presentation/screens/settings_screen/user_feedback_dialogue.dart';
import 'package:tech_test/providers/auth_provider.dart';
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
          SizedBox(
            height: 40,
            child: TextButton.icon(
              style: TextButton.styleFrom(
                primary: kColorBlack,
              ),
              onPressed: () async {
                final id = await Sentry.captureMessage('UserFeedback');
                await showDialog<dynamic>(
                  context: context,
                  builder: (context) {
                    return UserFeedbackDialog(eventId: id);
                  },
                );
              },
              icon: const Icon(Icons.report),
              label: Text(
                'Report a problem',
                style: AppTextStyles.semiBoldMedium(),
              ),
            ),
          ),
          const SizedBox(
            height: 4,
          ),
          SizedBox(
            height: 40,
            child: TextButton.icon(
              style: TextButton.styleFrom(
                primary: kColorFlatRed,
              ),
              icon: const Icon(Icons.logout),
              label: Text(
                'Log Out',
                style: AppTextStyles.semiBoldMedium(color: kColorFlatRed),
              ),
              onPressed: () async {
                final nav = Navigator.of(context);
                print('hi');
                await Provider.of<AuthProvider>(context, listen: false)
                    .signOut();
                await nav.pushNamedAndRemoveUntil(
                  LoginScreen.routeName,
                  (Route<dynamic> route) => false,
                );
              },
            ),
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
