import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:msig_assignment_test/features/favorite_food/presentation/bloc/favorite_food_bloc.dart';
import 'package:msig_assignment_test/features/favorite_food/presentation/widgets/food_card.dart';
import 'package:msig_assignment_test/features/food_detail/presentation/bloc/food_detail/food_detail_bloc.dart';
import 'package:msig_assignment_test/features/food_detail/presentation/pages/food_detail_page.dart';
import 'package:msig_assignment_test/features/food_list/presentation/widgets/error_load_list.dart';

class FavoriteFoodPage extends StatelessWidget {
  const FavoriteFoodPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Favorite Food'),
      ),
      body: BlocBuilder<FavoriteFoodBloc, FavoriteFoodState>(
        builder: (_, state) {
          if (state.status == FavoriteFoodStatus.success) {
            if (state.foods.isNotEmpty) {
              return ListView.separated(
                padding: const EdgeInsets.all(16),
                itemCount: state.foods.length,
                itemBuilder: (_, index) {
                  final food = state.foods[index];
                  return InkWell(
                    onTap: () {
                      context
                          .read<FoodDetailBloc>()
                          .add(FetchFoodDetail(idMeal: food.idMeal));
                      Navigator.push(
                        context,
                        MaterialPageRoute<void>(
                          builder: (_) => const FoodDetailPage(),
                        ),
                      ).then((_) {
                        context
                            .read<FavoriteFoodBloc>()
                            .add(FetchFavoriteFood());
                      });
                    },
                    child: FoodCard(food: food),
                  );
                },
                separatorBuilder: (_, __) => const SizedBox(height: 12),
              );
            }
            return const Center(
              child: Text('No favorite food.'),
            );
          }
          if (state.status == FavoriteFoodStatus.failure) {
            return const ErrorLoadList();
          }
          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}
