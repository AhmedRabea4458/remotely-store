import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:remotely_store/core/theme/app_colors.dart';
import 'package:remotely_store/features/home/presentation/view_model/carousel_cubit/carousel_cubit.dart';
import 'package:remotely_store/features/home/presentation/views/widgets/auto_image_slider.dart';

class ProductsImageCarouselSection extends StatelessWidget {
  const ProductsImageCarouselSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.whiteShade,
      height: MediaQuery.of(context).size.height
          * 0.45,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 30),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: GestureDetector(
              onTap: () => Navigator.pop(context),
              child: Icon(Icons.chevron_left, size: 36),
            ),
          ),
          BlocProvider<CarouselCubit>(
            create: (context) => CarouselCubit(),
            child: AutoImageSlider(),
          ),
        ],
      ),
    );
  }
}
