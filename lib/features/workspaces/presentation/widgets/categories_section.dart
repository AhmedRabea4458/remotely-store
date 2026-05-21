import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:remotely_store/core/theme/app_colors.dart';
import 'package:remotely_store/features/workspaces/presentation/widgets/header.dart';

import '../../../../core/theme/app_text_style.dart';
import 'category_chip.dart';

class CategoriesSection extends StatelessWidget {
  final List<String> categories;
  final String selectedCategory;
  final ValueChanged<String> onCategorySelected;
  final VoidCallback onSeeMore;

  const CategoriesSection({
    super.key,
    required this.categories,
    required this.selectedCategory,
    required this.onCategorySelected,
    required this.onSeeMore,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Header(
          title: 'Categories',
          onTap: onSeeMore,
        ),

        const Gap(16),

        SizedBox(
          height: 40,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            itemCount: categories.length,
            separatorBuilder: (_, __) =>
            const SizedBox(width: 12),
            itemBuilder: (context, index) {
              final category = categories[index];

              return CategoryChip(
                title: category,
                isSelected: category == selectedCategory,
                onTap: () => onCategorySelected(category),
              );
            },
          ),
        ),
      ],
    );
  }
}
