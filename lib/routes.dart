import 'package:flutter/material.dart';
import 'package:flutter_offline/flutter_offline.dart';
import 'package:tech_test/presentation/screens/login/login_screen.dart';
import 'package:tech_test/presentation/screens/no_internet_screen/no_internet_screen.dart';
import 'package:tech_test/presentation/screens/order_details/order_details_screen.dart';
import 'package:tech_test/presentation/screens/order_list/order_list_screen.dart';
import 'package:tech_test/presentation/screens/settings_screen/settings_screen.dart';
import 'package:tech_test/presentation/screens/splash_screen.dart';

class CustomRoute {
  static Route<dynamic> allRoutes(RouteSettings settings) {
    return MaterialPageRoute<dynamic>(
      builder: (context) {
        return OfflineBuilder(
          connectivityBuilder: (context, connectivity, _) {
            final connected = connectivity != ConnectivityResult.none;
            if (!connected) {
              return const NoInternetScreen();
            } else {
              switch (settings.name) {
                case SplashScreen.routeName:
                  return const SplashScreen();
                case LoginScreen.routeName:
                  return const LoginScreen();
                case OrderListScreen.routeName:
                  return const OrderListScreen();
                case OrderDetailsScreen.routeName:
                  return const OrderDetailsScreen();
                case NoInternetScreen.routeName:
                  return const NoInternetScreen();
                case SettingsScreen.routeName:
                  return const SettingsScreen();
                default:
                  return const SplashScreen();
              }
            }
          },
          child: const SplashScreen(),
        );
      },
    );
  }
}
