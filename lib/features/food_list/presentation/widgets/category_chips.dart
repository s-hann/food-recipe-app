import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:msig_assignment_test/features/food_list/presentation/bloc/category/category_bloc.dart';
import 'package:msig_assignment_test/features/food_list/presentation/bloc/food_list/food_list_bloc.dart';

class CategoryChips extends StatelessWidget {
  const CategoryChips({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CategoryBloc, CategoryState>(
      builder: (_, state) {
        return ListView.separated(
          scrollDirection: Axis.horizontal,
          shrinkWrap: true,
          padding: const EdgeInsets.symmetric(horizontal: 16),
          itemCount: state.categories.length,
          itemBuilder: (_, index) {
            final category = state.categories[index];
            return ChoiceChip(
              label: Text(category),
              selected: category == state.selected,
              selectedColor: Colors.blue,
              onSelected: (_) {
                context
                    .read<CategoryBloc>()
                    .add(SelectCategory(category: category));
                context
                    .read<FoodListBloc>()
                    .add(FetchFoodList(category: category));
              },
            );
          },
          separatorBuilder: (_, __) => const SizedBox(width: 8),
        );
      },
    );
  }
}
