import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:remotely_store/shared/widgets/custom_button.dart';

import 'features/auth/presention/view_model/auth_cubit.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          alignment: Alignment.center,
          child:  PrimaryButton(
           text:  "Sign out",
            onPressed:() {
              context.read<AuthCubit>().logout();
              context.go('/welcome');
            }
              ,
          ),
        ),
      ),
    );
  }
}
