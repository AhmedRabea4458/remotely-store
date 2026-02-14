import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:remotely_store/core/theme/app_colors.dart';
import 'package:remotely_store/features/home/presentation/view_model/carousel_cubit/carousel_cubit.dart';
import 'package:remotely_store/features/home/presentation/views/widgets/carousel_images_small_buttons.dart';
import 'package:remotely_store/features/home/presentation/views/widgets/carousel_indicator.dart';

class AutoImageSlider extends StatefulWidget {
  const AutoImageSlider({super.key});

  @override
  State<AutoImageSlider> createState() => _AutoImageSliderState();
}

class _AutoImageSliderState extends State<AutoImageSlider> {
  late final CarouselCubit cubit;

  @override
  void initState() {
    super.initState();
    cubit = context.read<CarouselCubit>();
    cubit.setImages([
      'assets/images/chair1.png',
      'assets/images/chair2.png',
      'assets/images/chair3.png',
    ]);
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CarouselCubit, CarouselState>(
      builder: (context, state) {
        final cubit = context.read<CarouselCubit>();
        if (state.images.isEmpty) {
          return const SizedBox();
        }
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Stack(
              children: [
                SizedBox(
                  height: MediaQuery.heightOf(context) * 0.3,
                  child: PageView.builder(
                    controller: cubit.controller,
                    itemCount: state.images.length,
                    onPageChanged: cubit.onPageChanged,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.only(right: 36),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(16),
                          child: Image.asset(
                            state.images[index],
                            fit: BoxFit.contain,
                          ),
                        ),
                      );
                    },
                  ),
                ),
                Positioned(
                  right: 24,
                  child: CarouselImagesSmallButtons(
                    currentPage: state.currentPage,
                    images: state.images,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),

            CarouselIndicator(
              images: state.images,
              currentPage: state.currentPage,
            ),
          ],
        );
      },
    );
  }
}
