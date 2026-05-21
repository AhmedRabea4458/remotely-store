
import 'package:flutter/cupertino.dart';
import 'package:gap/gap.dart';

import '../../../../core/theme/app_text_style.dart';

class Header extends StatelessWidget {
  const Header({
    super.key,
    required this.title,
    required this.onTap,
    this.inDetailsView = false,
  });

  final String title;
  final VoidCallback onTap;
  final bool inDetailsView;

  @override
  Widget build(BuildContext context) {
    final size= MediaQuery.sizeOf(context);
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: AppTextStyles.headline,
        ),
        if (!inDetailsView)Gap(size.width*.4),
          if (!inDetailsView)
          GestureDetector(
            onTap: onTap,
            child: const Text("See more"),
          ),
      ],
    );
  }
}
