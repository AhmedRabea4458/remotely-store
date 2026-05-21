import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:remotely_store/core/constants/app_assets.dart';
import 'package:remotely_store/core/theme/app_colors.dart';
import 'package:remotely_store/core/theme/app_text_style.dart';
import 'package:remotely_store/features/workspaces/data/models/product.dart';
import 'package:remotely_store/features/workspaces/presentation/widgets/featured_workspace_card.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../view_model/workspace_cubit.dart';
import '../widgets/based_on_your_bowers_section.dart';
import '../widgets/categories_section.dart';
import '../widgets/popular_section.dart';
import '../widgets/search_field_widget.dart';

class WorkspacesPage extends StatelessWidget {
  const WorkspacesPage({super.key});

  @override
  Widget build(BuildContext context) {

    return BlocBuilder<WorkspaceCubit, WorkspaceState>(
      builder: (context, state) {
        if (state is WorkspaceError) {
          return Scaffold(
            body: Center(child: Text(state.message)),
          );
        }
        final isLoading = state is WorkspaceLoading;

        final categories = state is WorkspaceLoaded
            ? state.categories
            : List.generate(4, (index) => "Loading");

        final youtubeProducts = state is WorkspaceLoaded
            ? state.youtubeProducts
            : List.generate(4, (_) => Product.empty());

        final browsingProducts = state is WorkspaceLoaded
            ? state.browsingProducts
            : List.generate(4, (_) => Product.empty());

        return Skeletonizer(
          enabled: isLoading,
          child: Scaffold(
            body: CustomScrollView(
              slivers: [
                SliverAppBar(
                  pinned: true,
                  elevation: 0,
                  backgroundColor: Colors.white,
                  centerTitle: true,
                  title: Text("Explores Workspace"),
                ),

                SliverPadding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  sliver: SliverList(
                    delegate: SliverChildListDelegate([
                      const Gap(20),
                      const SearchFieldWidget(),
                      const Gap(24),
                      const FeaturedWorkspaceCard(),
                      const Gap(24),

                      CategoriesSection(
                        categories: categories,
                        selectedCategory:
                        state is WorkspaceLoaded ? state.selectedCategory : '',
                        onCategorySelected: (category) {
                  context.read<WorkspaceCubit>()
                      .changeCategory(category);
                  },
                        onSeeMore: () {},
                      ),

                      const Gap(32),

                      HorizontalProductsSection(
                        title: "What YouTubers search for",
                        highlightedWord: "YouTubers",
                        products: youtubeProducts,
                        onSeeMore: () {},
                      ),

                      const Gap(32),

                      BasedOnYourBowersSection(
                        products: browsingProducts,
                      ),

                      const Gap(40),
                    ]),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );

  }
}
