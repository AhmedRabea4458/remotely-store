import 'package:go_router/go_router.dart';
import 'package:remotely_store/features/auth/presention/screens/signup/signup_screen.dart';

import '../../features/auth/presention/screens/login/login_page.dart';
import '../../features/auth/presention/screens/welcome/welcome_page.dart';
import 'package:remotely_store/cart/presentation/screens/alldonescreen/all_done_screen.dart';
import 'package:remotely_store/cart/presentation/screens/cartscreen/cart_screen.dart';
import 'package:remotely_store/cart/presentation/screens/checkoutscreen/checkout_screen.dart';

final GoRouter router = GoRouter(
  initialLocation: '/cart',

  routes: [
    GoRoute(path: '/', builder: (context, state) => const WelcomePage()),
    GoRoute(path: '/cart', builder: (context, state) => const CartScreen()),
    GoRoute(
      path: '/checkout',
      builder: (context, state) => const CheckoutScreen(),
    ),
    GoRoute(
      path: '/alldone',
      builder: (context, state) => const AllDoneScreen(),
    ),
    GoRoute(path: '/welcome', builder: (context, state) => const WelcomePage()),

    GoRoute(path: '/login', builder: (context, state) => LoginPage()),
    GoRoute(path: '/signup', builder: (context, state) => SignupPage()),
  ],
  // redirect: (context, state) {
  //   final authState = context.read<AuthCubit>().state;

  //   final isLoggedIn = authState is Authenticated;
  //   final isGuest = authState is Guest;

  //   final location = state.matchedLocation;

  //   final publicRoutes = ['/welcome', '/login', '/signup'];

  //   final isPublicRoute = publicRoutes.contains(location);

  //   // لو Guest → نعامله زي المستخدم المسجل
  //   if (isGuest) {
  //     if (isPublicRoute) return '/';
  //     return null;
  //   }

  //   if (!isLoggedIn) {
  //     if (isPublicRoute) return null;
  //     return '/welcome';
  //   }

  //   if (isLoggedIn && isPublicRoute) {
  //     return '/';
  //   }

  //   return null;
  // },
);
