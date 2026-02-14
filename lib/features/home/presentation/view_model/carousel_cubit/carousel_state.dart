part of 'carousel_cubit.dart';

class CarouselState {
  final int currentPage;
  final List<String> images;
  CarouselState({required this.currentPage, required this.images});

  CarouselState copyWith({List<String>? images, int? currentPage}) {
    return CarouselState(
      images: images ?? this.images,
      currentPage: currentPage ?? this.currentPage,
    );
  }
}
