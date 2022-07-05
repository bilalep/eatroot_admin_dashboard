import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tech_test/presentation/screens/login/login_screen.dart';
import 'package:tech_test/presentation/screens/order_details/order_details_screen.dart';
import 'package:tech_test/presentation/screens/order_list/order_list_screen.dart';
import 'package:tech_test/presentation/screens/splash_screen.dart';
import 'package:tech_test/providers/auth_provider.dart';
import 'package:tech_test/providers/live_order_provider.dart';
import 'package:tech_test/providers/order_detail_provider.dart';

void main() async {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  //TODO check currency with user locale

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<AuthProvider>(
          create: (_) => AuthProvider(),
        ),
        ChangeNotifierProvider<LiveOrderProvider>(
          create: (_) => LiveOrderProvider(),
        ),
        ChangeNotifierProvider(
          create: (_) => OrderDetailsProvider(),
        ),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
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
}
