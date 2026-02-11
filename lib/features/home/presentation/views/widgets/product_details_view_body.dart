import 'package:flutter/material.dart';
import 'package:remotely_store/core/theme/app_text_style.dart';
import 'package:remotely_store/features/home/presentation/views/widgets/bottom_buttons.dart';
import 'package:remotely_store/features/home/presentation/views/widgets/horizontal_product_card.dart';
import 'package:remotely_store/features/home/presentation/views/widgets/horizontal_section.dart';
import 'package:remotely_store/features/home/presentation/views/widgets/product_details.dart';
import 'package:remotely_store/features/home/presentation/views/widgets/products_image_carousel_section.dart';

class ProductDetailsViewBody extends StatelessWidget {
  const ProductDetailsViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Expanded(
          child: ListView(
            children: [
              ProductsImageCarouselSection(),
              SizedBox(height: 24),
              ProductDetails(),
              SizedBox(height: 24),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24.0),
                child: Text(
                  'RELATED ITEM',
                  style: AppTextStyles.headline.apply(fontSizeDelta: -9),
                ),
              ),
              SizedBox(height: 16),
              HorizontalSection(
                sectionName: 'RELATED ITEM',
                products: [
                  HorizontalProductCard(
                    imagePath: "assets/images/test.png",
                    title: "Developer",
                    desc: "21 suggested items",
                  ),
                ],
                onTap: () {},
                height: 220,
              ),
            ],
          ),
        ),
        BottomButtons(),
      ],
    );
  }
}
