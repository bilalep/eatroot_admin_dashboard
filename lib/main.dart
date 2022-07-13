import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tech_test/presentation/screens/splash_screen.dart';
import 'package:tech_test/providers/auth_provider.dart';
import 'package:tech_test/providers/live_order_provider.dart';
import 'package:tech_test/providers/order_detail_provider.dart';
import 'package:tech_test/routes.dart';

void main() async {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // TODO check currency with user locale

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
      child: const MaterialApp(
        title: 'Eatroot Restaurant Partner',
        initialRoute: SplashScreen.routeName,
        onGenerateRoute: CustomRoute.allRoutes,
      ),
    );
  }
}
