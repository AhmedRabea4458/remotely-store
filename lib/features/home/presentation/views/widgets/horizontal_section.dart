import 'package:flutter/material.dart';
import 'package:remotely_store/features/home/presentation/views/widgets/c_header.dart';
import 'package:remotely_store/features/home/presentation/views/widgets/horizontal_category_card.dart';

class HorizontalSection extends StatelessWidget {
  const HorizontalSection({
    super.key,
    required this.sectionName,
    required this.products,
    required this.onTap,
    required this.height,
    this.inDetailsView = false,
  });
  final String sectionName;
  final List products;
  final VoidCallback onTap;
  final double height;
  final bool inDetailsView;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: CHeader(
            inDetailsView: inDetailsView,
            title: sectionName,
            onTap: onTap,
          ),
        ),
        SizedBox(height: 16),
        SizedBox(
          height: height,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, i) {
              return products[0];
            },
            itemCount: 5,
          ),
        ),
      ],
    );
  }
}
