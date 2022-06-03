import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tech_test/providers/auth_provider.dart';
import 'package:tech_test/providers/live_order_provider.dart';

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
        final nav = Navigator.of(context);
        final liveOrderProvider = Provider.of<LiveOrderProvider>(context);
        return ElevatedButton(
          style: ElevatedButton.styleFrom(
            primary: Colors.black,
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
