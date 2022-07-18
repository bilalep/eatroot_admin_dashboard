import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tech_test/providers/auth_provider.dart';
import 'package:tech_test/utils/colors.dart';
import 'package:tech_test/utils/text_styles.dart';

class LoginButton extends StatelessWidget {
  const LoginButton({
    super.key,
    required this.onPressed,
  });

  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    // AuthProvider authProvider = Provider.of(context);
    return Consumer<AuthProvider>(
      builder: (BuildContext context, authProvider, _) {
        return ElevatedButton(
          style: ElevatedButton.styleFrom(
            primary: kColorPrimaryPink,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          onPressed: onPressed,
          child: SizedBox(
            width: double.infinity,
            height: 40,
            child: Center(
              child: authProvider.loading
                  ? const SizedBox(
                      height: 20,
                      width: 20,
                      child: CircularProgressIndicator(
                        backgroundColor: Colors.transparent,
                        color: kColorWhite,
                        strokeWidth: 3,
                      ),
                    )
                  : Text(
                      'LOG IN',
                      style: AppTextStyles.boldMedium(
                        color: kColorWhite,
                      ),
                    ),
            ),
          ),
        );
      },
    );
  }
}
