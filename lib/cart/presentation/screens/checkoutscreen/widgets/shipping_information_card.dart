import 'package:flutter/material.dart';
import 'package:remotely_store/core/theme/app_colors.dart';

class ShippingInformationCard extends StatelessWidget {
  const ShippingInformationCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),

      decoration: BoxDecoration(
        color: AppColors.background,
        borderRadius: BorderRadius.circular(16),

        boxShadow: [
          BoxShadow(color: AppColors.black.withOpacity(0.05), blurRadius: 10),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'SHIPPING INFORMATION',
            style: TextStyle(
              fontSize: 12,
              color: AppColors.grayDeeper,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 12),

          Container(
            height: 140,
            decoration: BoxDecoration(
              color: Colors.grey.shade200,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Center(
              child: Icon(Icons.location_on, color: AppColors.black, size: 32),
            ),
          ),

          const SizedBox(height: 12),

          Text(
            '6391 Elgin St. Celina, Delaware 10299',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 6),
          Text('(480) 555-0103', style: TextStyle(color: AppColors.grayDeeper)),
        ],
      ),
    );
  }
}
