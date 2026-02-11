import 'package:flutter/material.dart';
import 'package:remotely_store/features/home/presentation/views/home_view.dart';
import 'package:remotely_store/shared/widgets/custom_button.dart';
import 'core/theme/app_theme.dart';

void main() {
  runApp(const RemotelyStoreApp());
}

class RemotelyStoreApp extends StatelessWidget {
  const RemotelyStoreApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Remotely Store',

      debugShowCheckedModeBanner: false,

      theme: AppTheme.lightTheme,

      home: HomeView(), //const TempHomeScreen(),
    );
  }
}

class TempHomeScreen extends StatelessWidget {
  const TempHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Remotely Store")),
      body: Center(
        child: PrimaryButton(
          text: "Click Me",
          isLoading: false,
          onPressed: () {},
        ),
      ),
    );
  }
}
