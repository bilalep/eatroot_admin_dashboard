import 'package:feedback_sentry/feedback_sentry.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sentry_flutter/sentry_flutter.dart';
import 'package:tech_test/presentation/screens/splash_screen.dart';
import 'package:tech_test/providers/auth_provider.dart';
import 'package:tech_test/providers/live_order_provider.dart';
import 'package:tech_test/providers/order_detail_provider.dart';
import 'package:tech_test/routes.dart';

void main() async {
  await SentryFlutter.init(
    (options) {
      options.dsn =
          'https://b6dbe7a4ca504aa7a3d185046e974c75@o1321400.ingest.sentry.io/6578114';
      // Set tracesSampleRate to 1.0 to capture 100% of transactions
      //for performance monitoring.
      // We recommend adjusting this value in production.
      options.tracesSampleRate = 1.0;
    },
    appRunner: () => runApp(const BetterFeedback(child: MyApp())),
  );
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
      child: MaterialApp(
        title: 'Eatroot Restaurant Partner',
        initialRoute: SplashScreen.routeName,
        onGenerateRoute: CustomRoute.allRoutes,
        navigatorObservers: [
          SentryNavigatorObserver(),
        ],
      ),
    );
  }
}
