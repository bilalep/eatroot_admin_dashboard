import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tech_test/providers/auth_provider.dart';

import 'package:tech_test/providers/live_order_provider.dart';
import 'package:tech_test/ui/screens/live_order_list/live_order_list_screen.dart';
import 'package:tech_test/ui/screens/login_screen/widgets/login_text_field.dart';

final TextEditingController _userNameController = TextEditingController();
final TextEditingController _passwordController = TextEditingController();

class LoginScreen extends StatelessWidget {
  static const routeName = 'login';
  const LoginScreen({super.key});

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
              const _LoginButton(),
            ],
          ),
        ),
      ),
    );
  }
}

class _LoginButton extends StatelessWidget {
  const _LoginButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    // AuthProvider authProvider = Provider.of(context);
    return Consumer<AuthProvider>(
      builder: (BuildContext context, authProvider, _) {
        final nav = Navigator.of(context);
        final liveOrderProvider = Provider.of<LiveOrderProvider>(context);
        return ElevatedButton(
          style: ElevatedButton.styleFrom(
            primary: Colors.black,
          ),
          onPressed: authProvider.loading
              ? null
              : () async {
                  await authProvider.signIn(
                    userName: _userNameController.text,
                    password: _passwordController.text,
                  );
                  if (authProvider.isAuthenticated) {
                    await liveOrderProvider.getLiveOrderListFromService();
                    await nav.pushReplacementNamed(
                      LiveOrderListScreen.routeName,
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
                },
          child: SizedBox(
            width: double.infinity,
            height: 40,
            child: Center(
              child: authProvider.loading
                  ? const SizedBox(
                      height: 20,
                      width: 20,
                      child: CircularProgressIndicator(
                        backgroundColor: Colors.black,
                        color: Colors.white,
                        strokeWidth: 3,
                      ),
                    )
                  : const Text(
                      'LOG IN',
                      style: TextStyle(
                        color: Colors.white,
                        // fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
            ),
          ),
        );
      },
    );
  }
}
