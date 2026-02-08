import 'package:go_router/go_router.dart';
import 'package:remotely_store/features/auth/presention/screens/signup_screen.dart';

import '../../features/auth/presention/screens/login_page.dart';
import '../../features/auth/presention/screens/welcome_page.dart';

final GoRouter router = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const WelcomePage(),
    ),
    GoRoute(
      path: '/login',
      builder: (context, state) =>  LoginPage(),
    ),
    GoRoute(
      path: '/signup',
      builder: (context, state) =>  SignupPage(),
    ),

  ],
);
