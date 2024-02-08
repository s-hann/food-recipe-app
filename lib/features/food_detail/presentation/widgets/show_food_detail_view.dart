import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:msig_assignment_test/features/food_detail/domain/entities/food_detail_entity.dart';
import 'package:msig_assignment_test/features/food_detail/presentation/bloc/food_detail/food_detail_bloc.dart';
import 'package:msig_assignment_test/features/food_detail/presentation/bloc/set_favorite/set_favorite_bloc.dart';

class ShowFoodDetailView extends StatelessWidget {
  const ShowFoodDetailView({
    super.key,
    required this.food,
  });

  final FoodDetailEntity? food;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        forceMaterialTransparency: true,
        title: Text('${food?.strMeal}'),
        actions: [
          BlocConsumer<FoodDetailBloc, FoodDetailState>(
            listener: (ctx, state) {
              if (state.status == FoodDetailStatus.success) {
                ScaffoldMessenger.of(ctx).showSnackBar(
                  const SnackBar(
                    content: Text('Success'),
                  ),
                );
              } else if (state.status == FoodDetailStatus.failure) {
                ScaffoldMessenger.of(ctx).showSnackBar(
                  const SnackBar(
                    content: Text('Failed'),
                  ),
                );
              }
            },
            builder: (_, state) {
              final isFavoriteFood = state.isFavoriteFood;
              return IconButton(
                onPressed: () {
                  context.read<SetFavoriteBloc>().add(
                        SetFavorite(
                          food: food,
                          isFavoriteFood: isFavoriteFood,
                        ),
                      );
                  context.read<FoodDetailBloc>().add(UpdateIsFavoriteFood());
                },
                icon: Icon(
                  isFavoriteFood
                      ? Icons.star_rounded
                      : Icons.star_outline_rounded,
                ),
                tooltip:
                    '${isFavoriteFood ? 'Remove from' : 'Add to'} Favorite',
              );
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16).copyWith(top: 0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.network(food?.strMealThumb ?? ''),
              ),
              const SizedBox(height: 8),
              Row(
                children: [
                  Chip(
                    label: Text('${food?.strCategory}'),
                    padding: EdgeInsets.zero,
                  ),
                  const SizedBox(width: 12),
                  Chip(
                    label: Text('${food?.strArea}'),
                    padding: EdgeInsets.zero,
                  ),
                ],
              ),
              const SizedBox(height: 4),
              Text(
                'Ingredients:',
                style: Theme.of(context).textTheme.titleMedium,
              ),
              ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: food?.strIngredients.length,
                itemBuilder: (_, index) {
                  final ingredient = food?.strIngredients[index];
                  final measure = food?.strMeasures[index];
                  return Text('${index + 1}. $measure of $ingredient');
                },
              ),
              const SizedBox(height: 12),
              Text(
                'Instructions:',
                style: Theme.of(context).textTheme.titleMedium,
              ),
              Text('${food?.strInstructions}'),
            ],
          ),
        ),
      ),
    );
  }
}
