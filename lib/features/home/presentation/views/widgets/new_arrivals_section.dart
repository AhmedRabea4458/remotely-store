import 'package:flutter/material.dart';
import 'package:remotely_store/features/home/presentation/views/widgets/c_header.dart';
import 'package:remotely_store/features/home/presentation/views/widgets/vertical_product_card.dart';

class NewArrivalsSection extends StatelessWidget {
  const NewArrivalsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CHeader(title: "New arrivals", onTap: () {}),
        SizedBox(height: 14),
        ListView.separated(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemBuilder: (context, i) => VerticalProductCard(),
          separatorBuilder: (context, i) => SizedBox(height: 12),
          itemCount: 4,
        ),
      ],
    );
  }
}
