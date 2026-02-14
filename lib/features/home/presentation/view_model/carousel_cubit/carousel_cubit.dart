import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

part 'carousel_state.dart';

class CarouselCubit extends Cubit<CarouselState> {
  CarouselCubit() : super(CarouselState(currentPage: 0, images: []));

  final PageController controller = PageController();
  Timer? _timer;
  void setImages(List<String> newImages) {
    emit(CarouselState(images: newImages, currentPage: 0));
    _startAutoSlide();
  }

  void _startAutoSlide() {
    _timer?.cancel();

    if (state.images.isEmpty) return;

    _timer = Timer.periodic(const Duration(seconds: 2), (_) {
      int nextPage;
      if (state.currentPage < state.images.length - 1) {
        nextPage = state.currentPage + 1;
      } else {
        nextPage = 0;
      }
      controller.animateToPage(
        nextPage,
        duration: const Duration(milliseconds: 400),
        curve: Curves.easeInOut,
      );

      emit(state.copyWith(currentPage: nextPage));
    });
  }

  void onPageChanged(int index) {
    emit(state.copyWith(currentPage: index));
  }

  @override
  Future<void> close() {
    _timer?.cancel();
    controller.dispose();
    return super.close();
  }
}
