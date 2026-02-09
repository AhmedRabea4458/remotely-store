import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:remotely_store/features/auth/presention/screens/signup/signup_screen.dart';
import 'package:remotely_store/home.dart';
import '../../features/auth/presention/screens/login/login_page.dart';
import '../../features/auth/presention/screens/welcome/welcome_page.dart';
import '../../features/auth/presention/view_model/auth_cubit.dart';

final GoRouter router = GoRouter(
  initialLocation: '/welcome',
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const Home(),
    ),
    GoRoute(
      path: '/welcome',
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
    redirect: (context, state) {
      final authState = context.read<AuthCubit>().state;
      final loggedIn = authState is Authenticated;

      final location = state.matchedLocation;

      // الصفحات المفتوحة بدون تسجيل
      final publicRoutes = ['/welcome', '/login', '/signup'];

      final isPublicRoute = publicRoutes.contains(location);

      // لو مش مسجل
      if (!loggedIn) {
        // يسمح فقط بالتنقل داخل الصفحات العامة
        if (isPublicRoute) return null;

        // أي محاولة لفتح صفحة خاصة → يرجع welcome
        return '/welcome';
      }

      // لو مسجل دخول
      if (loggedIn) {
        // لو رايح أي صفحة من صفحات التسجيل → رجّعه للـ home
        if (isPublicRoute) return '/';

        // غير كدا خليه يكمل عادي
        return null;
      }

      return null;
    }


);
