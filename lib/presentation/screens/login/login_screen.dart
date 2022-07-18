import 'dart:async';

import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'package:tech_test/presentation/screens/login/widgets/circle_reveal_clipper.dart';
import 'package:tech_test/presentation/screens/login/widgets/login_button.dart';
import 'package:tech_test/presentation/screens/login/widgets/login_text_field.dart';
import 'package:tech_test/presentation/screens/order_list/order_list_screen.dart';
import 'package:tech_test/providers/auth_provider.dart';
import 'package:tech_test/providers/live_order_provider.dart';
import 'package:tech_test/utils/colors.dart';
import 'package:tech_test/utils/text_styles.dart';

final TextEditingController _userNameController = TextEditingController();
final TextEditingController _passwordController = TextEditingController();

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});
  Offset? _tapPosition;

  static const routeName = 'login';

  Route _createRoute() {
    return PageRouteBuilder<dynamic>(
      transitionDuration: const Duration(milliseconds: 2000),
      reverseTransitionDuration: const Duration(milliseconds: 2000),
      opaque: false,
      pageBuilder: (context, animation, secondaryAnimation) =>
          const LoginSuccessScreen(),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        final screenSize = MediaQuery.of(context).size;
        final center = Offset(screenSize.width - 200, screenSize.height - 400);
        final center1 = _tapPosition;
        const beginRadius = 0;
        final endRadius = screenSize.height * 1.2;

        final tween = Tween(begin: beginRadius, end: endRadius);
        final radiusTweenAnimation = animation.drive(tween);

        return ClipPath(
          clipper: CircleRevealClipper(
            radius: radiusTweenAnimation.value.toDouble(),
            center: center1 ?? center,
          ),
          child: child,
        );
      },
    );
  }

  Future<void> onLoginBUttonPressed(
    BuildContext context, {
    Function()? onSuccess,
    Function()? onError,
  }) async {
    final nav = Navigator.of(context);
    final authProvider = Provider.of<AuthProvider>(context, listen: false);
    final userName = _userNameController.text;
    final password = _passwordController.text;

    if (userName.isEmpty || password.isEmpty) {
      return;
    }

    await authProvider.signIn(
      userName: _userNameController.text,
      password: _passwordController.text,
    );
    if (authProvider.isAuthenticated) {
      // await nav.pushReplacement<dynamic, dynamic>(
      //   _createRoute(),
      // );
      onSuccess!();
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
        backgroundColor: kColorOrderTileBG,
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(36),
            child: Container(
              decoration: BoxDecoration(
                color: kColorWhite,
                borderRadius: const BorderRadius.all(Radius.circular(30)),
                boxShadow: [
                  BoxShadow(
                    color: kColorBlack.withOpacity(0.1),
                    blurRadius: 10,
                    offset: const Offset(0, 5),
                  ),
                ],
              ),
              padding: const EdgeInsets.all(32),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Log In to Eatroot',
                    style: AppTextStyles.semiBoldExtraLarge(
                      color: kColorPrimaryPink,
                    ),
                  ),
                  const SizedBox(height: 20),
                  Text(
                    'Username',
                    style: AppTextStyles.semiBoldBody(
                      color: kColorBlack.withOpacity(0.7),
                    ),
                  ),
                  const SizedBox(height: 8),
                  LoginTextField(
                    labelText: 'admin@restaurant.com',
                    controller: _userNameController,
                    isObscure: false,
                  ),
                  const SizedBox(height: 20),
                  Text(
                    'Password',
                    style: AppTextStyles.semiBoldBody(
                      color: kColorBlack.withOpacity(0.7),
                    ),
                  ),
                  const SizedBox(height: 8),
                  LoginTextField(
                    labelText: 'yourpassword',
                    controller: _passwordController,
                    isObscure: true,
                  ),
                  const SizedBox(height: 20),
                  OpenContainer(
                    openColor: kColorPrimaryPink,
                    closedColor: kColorWhite,
                    middleColor: kColorPrimaryPink,
                    tappable: false,
                    closedElevation: 0,
                    transitionDuration: const Duration(milliseconds: 1500),
                    transitionType: ContainerTransitionType.fadeThrough,
                    closedBuilder: (context, openContainer) {
                      return LoginButton(
                        onPressed: () {
                          onLoginBUttonPressed(
                            context,
                            onSuccess: openContainer,
                          );
                        },
                      );
                    },
                    openBuilder: (context, closedContainer) {
                      return const LoginSuccessScreen();
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class LoginSuccessScreen extends StatefulWidget {
  const LoginSuccessScreen({super.key});

  static const routeName = 'login_success';

  @override
  State<LoginSuccessScreen> createState() => _LoginSuccessScreenState();
}

class _LoginSuccessScreenState extends State<LoginSuccessScreen>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        color: kColorPrimaryPink,
        child: Column(
          children: [
            // IconButton(
            //   icon: const Icon(
            //     Icons.check_circle,
            //     size: 150,
            //     color: kColorWhite,
            //   ),
            //   onPressed: () {
            //     Navigator.of(context)
            //         .pushReplacementNamed(OrderDetailsScreen.routeName);
            //   },
            // ),
            Expanded(
              child: Lottie.asset(
                'assets/lottie/success-animation.json',
                width: 230,
                // height: 220,
                controller: _controller,

                onLoaded: (composition) async {
                  // Configure the AnimationController with the duration of the
                  // Lottie file and start the animation.
                  final nav = Navigator.of(context);
                  final liveOrderProvider =
                      Provider.of<LiveOrderProvider>(context, listen: false);
                  _controller.duration = composition.duration;
                  await _controller.forward();
                  await Future<dynamic>.delayed(
                    const Duration(milliseconds: 500),
                  );
                  await liveOrderProvider.getLiveOrderListFromService();
                  await nav.pushNamedAndRemoveUntil(
                    OrderListScreen.routeName,
                    (route) => false,
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
