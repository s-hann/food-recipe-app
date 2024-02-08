import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:msig_assignment_test/features/favorite_food/presentation/bloc/favorite_food_bloc.dart';
import 'package:msig_assignment_test/features/favorite_food/presentation/pages/favorite_food_page.dart';
import 'package:msig_assignment_test/features/food_list/presentation/bloc/food_list/food_list_bloc.dart';
import 'package:msig_assignment_test/features/food_list/presentation/widgets/category_chips.dart';
import 'package:msig_assignment_test/features/food_list/presentation/widgets/error_load_list.dart';
import 'package:msig_assignment_test/features/food_list/presentation/widgets/food_list_widget.dart';

class FoodListPage extends StatelessWidget {
  const FoodListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Food Recipe App'),
        actions: [
          InkWell(
            onTap: () {
              context.read<FavoriteFoodBloc>().add(FetchFavoriteFood());
              Navigator.push(
                context,
                MaterialPageRoute<void>(
                  builder: (_) => const FavoriteFoodPage(),
                ),
              );
            },
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 2, horizontal: 4),
              margin: const EdgeInsets.only(right: 16),
              decoration: BoxDecoration(
                border: Border.all(),
                borderRadius: BorderRadius.circular(8),
              ),
              child: const Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(Icons.star_rounded),
                  SizedBox(width: 8),
                  Text('Favorite Menu'),
                ],
              ),
            ),
          ),
        ],
        forceMaterialTransparency: true,
      ),
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(
              width: double.infinity,
              height: 48,
              child: CategoryChips(),
            ),
            Expanded(
              child: BlocBuilder<FoodListBloc, FoodListState>(
                builder: (_, state) {
                  switch (state.status) {
                    case FoodListStatus.initial:
                      return Center(
                        child: Text(
                          'Choose a category',
                          style: Theme.of(context).textTheme.titleLarge,
                        ),
                      );
                    case FoodListStatus.loading:
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    case FoodListStatus.success:
                      return const FoodListWidget();
                    case FoodListStatus.failure:
                      return const ErrorLoadList();
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
