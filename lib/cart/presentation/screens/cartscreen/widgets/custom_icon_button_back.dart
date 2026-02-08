import 'package:flutter/material.dart';

class CustomIconButtonBack extends StatelessWidget {
  const CustomIconButtonBack({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        IconButton(
          onPressed: () {},
          icon: Icon(Icons.arrow_back_ios_rounded, size: 25),
        ),
      ],
    );
  }
}
