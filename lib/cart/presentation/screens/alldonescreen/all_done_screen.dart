import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:remotely_store/cart/presentation/screens/cartscreen/widgets/custom_icon_button_back.dart';
import 'package:remotely_store/cart/presentation/widgets/header_row.dart';
import 'package:remotely_store/shared/widgets/custom_button.dart';

class AllDoneScreen extends StatelessWidget {
  const AllDoneScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Container(
        padding: EdgeInsets.fromLTRB(20, 0, 20, 40),
        child: PrimaryButton(text: "Go to Orders", onPressed: () {}),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          children: [
            CustomIconButtonBack(),
            HeaderRow(
              text: "All Done",
              mainAxisAlignment: MainAxisAlignment.center,
            ),
          ],
        ),
      ),
    );
  }
}
