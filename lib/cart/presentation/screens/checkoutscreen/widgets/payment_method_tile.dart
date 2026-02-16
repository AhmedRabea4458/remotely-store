import 'package:flutter/material.dart';
import 'package:remotely_store/cart/presentation/screens/checkoutscreen/widgets/card_dot.dart';
import 'package:remotely_store/core/theme/app_colors.dart';
import 'package:remotely_store/core/theme/app_text_style.dart';

class PaymentMethodTile extends StatelessWidget {
  const PaymentMethodTile({
    super.key,
    required this.nameImage,
    required this.bankName,
    required this.lastDigits,
    required this.isSelected,
    required this.onTap,
  });
  final String pathImagesFolder = "assets/images/";
  final String nameImage;
  final String bankName;
  final String lastDigits;

  final bool isSelected;
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 65,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          border: Border.all(
            color: (isSelected) ? AppColors.primary : AppColors.grayDeeper,
            width: (isSelected) ? 3 : 1.5,
          ),
        ),
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 0, 15, 0),
              child: SizedBox(
                height: 20,
                width: 50,
                child: Image.asset("$pathImagesFolder$nameImage"),
              ),
            ),
            Text(
              bankName,
              style: AppTextStyles.headline.copyWith(fontSize: 17),
            ),
            SizedBox(width: 12),
            CardDot(radius: 3, backgroundColor: AppColors.grayDeeper),
            CardDot(radius: 3, backgroundColor: AppColors.grayDeeper),

            CardDot(radius: 3, backgroundColor: AppColors.grayDeeper),

            CardDot(radius: 3, backgroundColor: AppColors.grayDeeper),

            SizedBox(width: 15),
            Text(lastDigits, style: AppTextStyles.body),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 7.0),
                    child: CardDot(
                      radius: 10,
                      backgroundColor:
                          (isSelected)
                              ? AppColors.primary
                              : AppColors.background,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
