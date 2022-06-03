import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tech_test/providers/auth_provider.dart';
import 'package:tech_test/providers/live_order_provider.dart';
import 'package:tech_test/providers/order_detail_provider.dart';
import 'package:tech_test/ui/screens/live_order_list/live_order_list_screen.dart';
import 'package:tech_test/ui/screens/order_details/order_details_screen.dart';

import 'ui/screens/login_screen/login_screen.dart';
import 'ui/screens/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<AuthProvider>(create: (_) => AuthProvider()),
        ChangeNotifierProvider<LiveOrderProvider>(
            create: (BuildContext ctx) => LiveOrderProvider()),
        ChangeNotifierProvider(
            create: (BuildContext ctx) => OrderDetailsProvider()),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: _buildThemeData(),
        initialRoute: 'splash',
        routes: {
          SplashScreen.routeName: (BuildContext context) =>
              const SplashScreen(),
          LoginScreen.routeName: (BuildContext context) => const LoginScreen(),
          LiveOrderListScreen.routeName: (BuildContext context) =>
              const LiveOrderListScreen(),
          OrderDetailsScreen.routeName: (BuildContext context) =>
              const OrderDetailsScreen(),
        },
      ),
    );
  }

  ThemeData _buildThemeData() {
    return ThemeData(
      primarySwatch: Colors.blue,
      textTheme: const TextTheme(
        headline1: TextStyle(
          fontSize: 36.0,
          fontWeight: FontWeight.bold,
          color: Colors.black,
        ),
        headline2: TextStyle(
          fontSize: 20.0,
          fontWeight: FontWeight.bold,
          color: Colors.black,
        ),
        bodyText1: TextStyle(
          fontSize: 18.0,
          fontWeight: FontWeight.w400,
          color: Colors.black,
        ),
      ),
    );
  }
}
