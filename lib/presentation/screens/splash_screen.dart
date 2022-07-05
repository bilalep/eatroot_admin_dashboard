import 'dart:async';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tech_test/presentation/screens/login/login_screen.dart';
import 'package:tech_test/presentation/screens/order_list/order_list_screen.dart';
import 'package:tech_test/providers/live_order_provider.dart';
import 'package:tech_test/services/local_storage_service.dart';
import 'package:tech_test/utils/constants.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  static const routeName = 'splash';

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  Future<void> _isLoggedIn() async {
    final navigator = Navigator.of(context);
    final liveOrderProvider = Provider.of<LiveOrderProvider>(context);
    if (await LocalStorageService.isLoggedIn()) {
      kBearerToken = await LocalStorageService.getToken() ?? '';
      unawaited(liveOrderProvider.getLiveOrderListFromService());
      await navigator.pushReplacementNamed(LiveOrderListScreen.routeName);
    } else {
      await navigator.pushReplacementNamed(LoginScreen.routeName);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: _isLoggedIn(),
        builder: (context, snapshot) {
          return const SizedBox();
        },
      ),
    );
  }
}
