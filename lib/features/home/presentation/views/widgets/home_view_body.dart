import 'package:flutter/material.dart';
import 'package:remotely_store/core/theme/app_colors.dart';
import 'package:remotely_store/core/theme/app_text_style.dart';
import 'package:remotely_store/features/home/presentation/views/widgets/horizontal_product_card.dart';
import 'package:remotely_store/features/home/presentation/views/widgets/new_arrivals_section.dart';
import 'package:remotely_store/features/home/presentation/views/widgets/c_app_bar.dart';
import 'package:remotely_store/features/home/presentation/views/widgets/popular_section.dart';
import 'package:remotely_store/features/home/presentation/views/widgets/horizontal_category_card.dart';
import 'package:remotely_store/features/home/presentation/views/widgets/horizontal_section.dart';
import 'package:remotely_store/features/home/presentation/views/widgets/rate_widget.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        SizedBox(height: 16),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: CAppBar(),
        ),
        SizedBox(height: 30),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: PopularSection(),
        ),
        SizedBox(height: 17),
        HorizontalSection(
          sectionName: "Workspaces",
          products: [
            HorizontalCategoryCard(
              imagePath: "assets/images/test.png",
              title: "Developer",
              desc: "21 suggested items",
            ),
          ],
          onTap: () {},
          height: 178,
        ),
        SizedBox(height: 32),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: NewArrivalsSection(),
        ),
        SizedBox(height: 17),
        HorizontalSection(
          sectionName: "Laptops",
          products: [
            HorizontalProductCard(
              imagePath: "assets/images/test.png",
              title: "Developer",
              desc: "21 suggested items",
            ),
          ],
          onTap: () {},
          height: 210,
        ),
      ],
    );
  }
}
