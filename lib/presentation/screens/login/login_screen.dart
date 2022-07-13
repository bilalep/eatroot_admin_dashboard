import 'dart:async';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tech_test/presentation/screens/login/widgets/login_button.dart';
import 'package:tech_test/presentation/screens/login/widgets/login_text_field.dart';
import 'package:tech_test/presentation/screens/order_list/order_list_screen.dart';
import 'package:tech_test/providers/auth_provider.dart';
import 'package:tech_test/providers/live_order_provider.dart';

final TextEditingController _userNameController = TextEditingController();
final TextEditingController _passwordController = TextEditingController();

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  static const routeName = 'login';

  Future<void> onLoginBUttonPressed(
    BuildContext context,
    AuthProvider authProvider,
    LiveOrderProvider liveOrderProvider,
  ) async {
    final nav = Navigator.of(context);

    await authProvider.signIn(
      userName: _userNameController.text,
      password: _passwordController.text,
    );
    if (authProvider.isAuthenticated) {
      unawaited(liveOrderProvider.getLiveOrderListFromService());
      await nav.pushReplacementNamed(
        OrderListScreen.routeName,
      );
    } else {
      await showDialog<AlertDialog>(
        context: context,
        builder: (context) => AlertDialog(
          title: const Text('Login Failed'),
          content: const Text('Please check your credentials'),
          actions: [
            MaterialButton(
              child: const Text('OK'),
              onPressed: () => Navigator.of(context).pop(),
            ),
          ],
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 30),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Login',
                style: Theme.of(context).textTheme.headline1,
              ),
              const SizedBox(height: 20),
              LoginTextField(
                labelText: 'Username',
                controller: _userNameController,
                isObscure: false,
              ),
              const SizedBox(height: 20),
              LoginTextField(
                labelText: 'Password',
                controller: _passwordController,
                isObscure: true,
              ),
              const SizedBox(height: 20),
              LoginButton(
                onPressed: () {
                  onLoginBUttonPressed(
                    context,
                    Provider.of<AuthProvider>(context, listen: false),
                    Provider.of<LiveOrderProvider>(context, listen: false),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
