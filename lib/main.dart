import 'package:flutter/material.dart';
import 'package:remotely_store/core/routing/router.dart';

import 'core/theme/app_theme.dart';

void main() async {
  runApp(const RemotelyStoreApp());
}

class RemotelyStoreApp extends StatelessWidget {
  const RemotelyStoreApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Remotely Store',
      routerConfig: router,
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
    );
  }
}
