import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:remotely_store/features/auth/data/datasources/firebase_auth_datasource.dart';
import 'package:remotely_store/features/auth/data/repositories/auth_repository.dart';
import 'package:remotely_store/features/auth/presention/view_model/auth_cubit.dart';
import 'core/routing/router.dart';
import 'core/theme/app_theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp();

  runApp(const RemotelyStoreApp());
}

class RemotelyStoreApp extends StatelessWidget {
  const RemotelyStoreApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create:
          (_) => AuthCubit(
            AuthRepository(
              FirebaseAuthDataSource(
                auth: FirebaseAuth.instance,
                firestore: FirebaseFirestore.instance,
              ),
            ),
          ),

      child: MaterialApp.router(
        title: 'Remotely Store',
        routerConfig: router,
        debugShowCheckedModeBanner: false,
        theme: AppTheme.lightTheme,
      ),
    );
  }
}
