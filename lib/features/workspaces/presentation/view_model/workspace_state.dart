part of 'workspace_cubit.dart';

@immutable

abstract class WorkspaceState {}

class WorkspaceInitial extends WorkspaceState {}

class WorkspaceLoading extends WorkspaceState {}

class WorkspaceLoaded extends WorkspaceState {
  final List<String> categories;
  final String selectedCategory;

  final List<Product> youtubeProducts;
  final List<Product> browsingProducts;

  final bool isCategoryLoading;
  final bool isYoutubeLoading;
  final bool isBrowsingLoading;

    WorkspaceLoaded({
    required this.categories,
    required this.selectedCategory,
    required this.youtubeProducts,
    required this.browsingProducts,
    this.isCategoryLoading = false,
    this.isYoutubeLoading = false,
    this.isBrowsingLoading = false,
  });

  WorkspaceLoaded copyWith({
    List<String>? categories,
    String? selectedCategory,
    List<Product>? youtubeProducts,
    List<Product>? browsingProducts,
    bool? isCategoryLoading,
    bool? isYoutubeLoading,
    bool? isBrowsingLoading,
  }) {
    return WorkspaceLoaded(
      categories: categories ?? this.categories,
      selectedCategory: selectedCategory ?? this.selectedCategory,
      youtubeProducts: youtubeProducts ?? this.youtubeProducts,
      browsingProducts: browsingProducts ?? this.browsingProducts,
      isCategoryLoading:
      isCategoryLoading ?? this.isCategoryLoading,
      isYoutubeLoading:
      isYoutubeLoading ?? this.isYoutubeLoading,
      isBrowsingLoading:
      isBrowsingLoading ?? this.isBrowsingLoading,
    );
  }
}

class WorkspaceError extends WorkspaceState {
  final String message;

  WorkspaceError(this.message);
}
