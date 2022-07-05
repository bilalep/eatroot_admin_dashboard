import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tech_test/presentation/screens/login/login_screen.dart';
import 'package:tech_test/providers/auth_provider.dart';
import 'package:tech_test/utils/colors.dart';
import 'package:tech_test/utils/text_styles.dart';

class OrderListTitleRow extends StatelessWidget {
  const OrderListTitleRow({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          'Order List',
          style: kTSOrderScreenTitle,
        ),
        IconButton(
          icon: const Icon(Icons.account_circle),
          color: kColorYellow,
          iconSize: 45,
          // ignore: flutter_style_todos
          onPressed: () {
            // TODO: Implement profile and logout
            Provider.of<AuthProvider>(context, listen: false).signOut();
            Navigator.of(context).pushReplacementNamed(LoginScreen.routeName);
          },
        ),
      ],
    );
  }
}