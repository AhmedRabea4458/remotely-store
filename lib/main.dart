  import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dio/dio.dart';
  import 'package:firebase_auth/firebase_auth.dart';
  import 'package:flutter/material.dart';
  import 'package:remotely_store/core/services/firbase_service.dart';
  import 'core/routing/router.dart';
  import 'core/theme/app_theme.dart';
  import 'features/auth/data/datasources/firebase_auth_datasource.dart';
  import 'features/auth/data/repositories/auth_repository.dart';
  import 'features/auth/presention/view_model/auth_cubit.dart';
  import 'package:flutter_bloc/flutter_bloc.dart';

import 'features/workspaces/data/datasources/api_workspace_datasource.dart';
import 'features/workspaces/data/repositories/workspace_repository.dart';
import 'features/workspaces/presentation/view_model/workspace_cubit.dart';

  void main() async{
    WidgetsFlutterBinding.ensureInitialized();
    await FirebaseService.init();
    runApp(const RemotelyStoreApp());
  }

  class RemotelyStoreApp extends StatelessWidget {
    const RemotelyStoreApp({super.key});

    @override
    Widget build(BuildContext context) {
      return MultiBlocProvider(
          providers: [

            /// Auth Cubit
            BlocProvider(
              create: (_) => AuthCubit(
                AuthRepository(
                  FirebaseAuthDataSource(
                    auth: FirebaseAuth.instance,
                    firestore: FirebaseFirestore.instance,
                  ),
                ),
              ),
            ),

            /// Workspace Cubit
            BlocProvider(
              create: (_) => WorkspaceCubit(
                WorkspaceRepository(
                  WorkspaceRemoteDataSourceImpl(
                    Dio(BaseOptions(
                      baseUrl: 'https://dummyjson.com',
                    )),
                  ),
                ),
              )..loadWorkspace(),
            ),

          ],
          child:MaterialApp.router(
        title: 'Remotely Store',
        routerConfig: router,
        debugShowCheckedModeBanner: false,
        theme: AppTheme.lightTheme,
        )
      );
    }
  }

