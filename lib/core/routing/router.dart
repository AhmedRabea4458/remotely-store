import 'package:go_router/go_router.dart';

import '../../features/auth/presention/screens/welcome_page.dart';

final GoRouter router = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const WelcomePage(),
    ),

  ],
);
