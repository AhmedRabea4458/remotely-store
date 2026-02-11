import 'package:flutter/material.dart';
import 'package:remotely_store/features/home/presentation/views/widgets/carousel_small_button.dart';

class CarouselImagesSmallButtons extends StatelessWidget {
  const CarouselImagesSmallButtons({
    super.key,
    required this.currentPage,
    required this.images,
  });

  final int currentPage;
  final List<String> images;

  @override
  Widget build(BuildContext context) {
    return images.length == 3
        ? Column(
          children: [
            CarouselSmallButton(
              currentPage: currentPage,
              index: 0,
              imagePath: images[0],
            ),
            SizedBox(height: 6),
            CarouselSmallButton(
              currentPage: currentPage,
              index: 1,
              imagePath: images[1],
            ),
            SizedBox(height: 6),
            CarouselSmallButton(
              currentPage: currentPage,
              index: 2,
              imagePath: images[2],
            ),
          ],
        )
        : SizedBox();
  }
}
