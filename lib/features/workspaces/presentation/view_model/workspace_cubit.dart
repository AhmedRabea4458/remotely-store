import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../data/models/product.dart';
import '../../data/repositories/workspace_repository.dart';

part 'workspace_state.dart';

class WorkspaceCubit extends Cubit<WorkspaceState> {
  final WorkspaceRepository repository;

  WorkspaceCubit(this.repository) : super(WorkspaceInitial());

  Future<void> loadWorkspace() async {
    emit(WorkspaceLoading());

    try {
      final categories = await repository.getCategories();

      final youtube =
      await repository.getProductsByCategory(categories.first);

      final browsing =
      await repository.getProductsByCategory('laptops');

      emit(
        WorkspaceLoaded(
          categories: categories,
          selectedCategory: categories.first,
          youtubeProducts: youtube,
          browsingProducts: browsing,
        ),
      );
    } catch (e) {
      emit(WorkspaceError(e.toString()));
    }
  }


  Future<void> changeCategory(String category) async {
    if (state is! WorkspaceLoaded) return;

    final current = state as WorkspaceLoaded;

    emit(current.copyWith(
      selectedCategory: category,
      isCategoryLoading: true,
    ));

    try {
      final products =
      await repository.getProductsByCategory(category);

      emit(current.copyWith(
        youtubeProducts: products,
        selectedCategory: category,
        isCategoryLoading: false,
      ));
    } catch (e) {
      emit(current.copyWith(isCategoryLoading: false));
    }
  }
}
