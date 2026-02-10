import 'package:go_router/go_router.dart';
import 'package:remotely_store/cart/presentation/screens/alldonescreen/all_done_screen.dart';
import 'package:remotely_store/cart/presentation/screens/cartscreen/cart_screen.dart';
import 'package:remotely_store/cart/presentation/screens/checkoutscreen/checkout_screen.dart';

import '../../features/auth/presention/screens/welcome_page.dart';

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
  ],
);
