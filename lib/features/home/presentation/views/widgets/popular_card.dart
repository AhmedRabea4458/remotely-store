import 'package:flutter/material.dart';
import 'package:remotely_store/core/constants/app_assets.dart';
import 'package:remotely_store/core/theme/app_colors.dart';
import 'package:remotely_store/features/home/presentation/views/product_details_view.dart';
import 'package:remotely_store/features/home/presentation/views/widgets/c_icon_button.dart';
import 'package:remotely_store/features/home/presentation/views/widgets/rate_widget.dart';
import 'package:remotely_store/shared/widgets/custom_button.dart';

class PopularCard extends StatelessWidget {
  const PopularCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.topLeft,
      width: double.infinity,
      padding: EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: AppColors.componentBGColor,
        borderRadius: BorderRadius.circular(32),
      ),
      child: SizedBox(
        width: 180,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Adjustable Office Chair',
              style: TextStyle(
                color: AppColors.whiteShade,
                fontSize: 21,
                fontWeight: FontWeight.w900,
              ),
            ),
            SizedBox(height: 8),
            Row(
              children: [
                Text(
                  'Hughlan Workspaces',
                  style: TextStyle(
                    color: AppColors.deepGrey,
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                SizedBox(width: 16),
                RateWidget(),
              ],
            ),
            SizedBox(height: 20),
            Row(
              children: [
                PrimaryButton(
                  text: 'View Item',
                  height: 40,
                  width: 111,
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ProductDetailsView(),
                      ),
                    );
                  },
                ),
                SizedBox(width: 12),
                CIconButton(
                  imageIconPath: AppAssets.bagIcon,
                  bgColor: AppColors.deepGrey.withAlpha(80),
                  onTap: () {},
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
