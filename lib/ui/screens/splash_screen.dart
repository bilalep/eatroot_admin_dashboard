import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tech_test/services/local_storage_service.dart';
import 'package:tech_test/ui/screens/live_order_list/live_order_list_screen.dart';
import 'package:tech_test/ui/screens/login_screen/login_screen.dart';
import 'package:tech_test/utils/constants.dart';

import '../../providers/live_order_provider.dart';

class SplashScreen extends StatefulWidget {
  static const routeName = 'splash';
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
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

  Future<void> _isLoggedIn() async {
    final navigator = Navigator.of(context);
    final liveOrderProvider = Provider.of<LiveOrderProvider>(context);
    if (await LocalStorageService.isLoggedIn()) {
      kBearerToken = await LocalStorageService.getToken() as String;
      await liveOrderProvider.getLiveOrderListFromService();
      navigator.pushReplacementNamed(LiveOrderListScreen.routeName);
    } else {
      navigator.pushReplacementNamed(LoginScreen.routeName);
    }
  }
}
