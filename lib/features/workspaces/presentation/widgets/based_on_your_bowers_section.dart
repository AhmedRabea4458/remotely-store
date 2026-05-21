import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:remotely_store/features/workspaces/presentation/widgets/header.dart';

import '../../../home/presentation/views/widgets/c_header.dart';
import '../../../workspaces/presentation/widgets/vertical_product_card.dart';
import '../../data/models/product.dart';

class BasedOnYourBowersSection extends StatelessWidget {
  const BasedOnYourBowersSection({
    super.key,
    required this.products,
  });

  final List<Product> products;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Header(
          title: "Based on your browsing history",
          onTap: () {},
          inDetailsView: true,
        ),

        const SizedBox(height: 16),

        ...List.generate(
          4,
              (i) => Padding(
            padding: const EdgeInsets.only(bottom: 12),
            child: VerticalProductCard(
              product: products[i],
            ),
          ),
        ),
      ],
    );
  }
}
