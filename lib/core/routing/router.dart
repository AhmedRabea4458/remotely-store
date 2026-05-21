import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:remotely_store/features/auth/presention/screens/signup/signup_screen.dart';
import 'package:remotely_store/features/workspaces/presentation/screens/workspaces_page.dart';
import '../../features/auth/presention/screens/login/login_page.dart';
import '../../features/auth/presention/screens/welcome/welcome_page.dart';
import '../../features/auth/presention/view_model/auth_cubit.dart';
import '../../features/home/presentation/views/home_view.dart';

final GoRouter router = GoRouter(
  initialLocation: '/',
  routes: [

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
    GoRoute(
      path: '/',
      builder: (context, state) =>  HomeView(),
    ),
    GoRoute(
      path: '/workspace',
      builder: (context, state) =>  WorkspacesPage(),
    ),

  ],
    redirect: (context, state) {
      final authState = context.read<AuthCubit>().state;
    
      final isLoggedIn = authState is Authenticated;
      final isGuest = authState is Guest;
    
      final location = state.matchedLocation;
    
      final publicRoutes = ['/welcome', '/login', '/signup'];
    
      final isPublicRoute = publicRoutes.contains(location);
    
      // لو Guest → نعامله زي المستخدم المسجل
      if (isGuest) {
        if (isPublicRoute) return '/';
        return null;
      }
    
      if (!isLoggedIn) {
        if (isPublicRoute) return null;
        return '/welcome';
      }
    
      if (isLoggedIn && isPublicRoute) {
        return '/';
      }
    
      return null;
    }



);
