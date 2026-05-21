import 'package:flutter/cupertino.dart';
import 'package:gap/gap.dart';
import 'package:remotely_store/core/theme/app_colors.dart';
import 'package:remotely_store/core/theme/app_text_style.dart';
import 'package:remotely_store/features/workspaces/presentation/widgets/product_card.dart';

import '../../data/models/product.dart';

class HorizontalProductsSection extends StatelessWidget {
  final String title;
  final String? highlightedWord;
  final List<Product> products;
  final VoidCallback onSeeMore;

  const HorizontalProductsSection({
    super.key,
    required this.title,
    required this.products,
    required this.onSeeMore,
    this.highlightedWord,
  });

  Widget _buildTitle() {
    if (highlightedWord == null || !title.contains(highlightedWord!)) {
      return Text(
        title,
        style: AppTextStyles.headline
      );
    }

    final parts = title.split(highlightedWord!);

    return RichText(
      text: TextSpan(
        style:  AppTextStyles.headline,
        children: [
          TextSpan(text: parts.first),
          TextSpan(
            text: highlightedWord!,
            style: AppTextStyles.headline.copyWith(
              color: AppColors.primary,
            ),
          ),
          if (parts.length > 1)
            TextSpan(text: parts.last),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            _buildTitle(),
            const Spacer(),
            GestureDetector(
              onTap: onSeeMore,
              child: Row(
                children: [
                  const Text("See more"),
                  const Gap(4),
                  Icon(
                    CupertinoIcons.chevron_right,
                    size: 16,
                    color: AppColors.grayDeeper,
                  ),
                ],
              ),
            ),
          ],
        ),
        const Gap(12),
        SizedBox(
          height: 190,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: products.length,
            itemBuilder: (context, index) {
              return ProductCard(product: products[index]);
            },
          ),
        ),
      ],
    );
  }
}
