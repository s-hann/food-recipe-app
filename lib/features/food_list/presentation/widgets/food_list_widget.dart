import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:msig_assignment_test/features/food_detail/presentation/bloc/food_detail/food_detail_bloc.dart';
import 'package:msig_assignment_test/features/food_detail/presentation/pages/food_detail_page.dart';
import 'package:msig_assignment_test/features/food_list/presentation/bloc/food_list/food_list_bloc.dart';
import 'package:msig_assignment_test/features/food_list/presentation/widgets/food_card.dart';

class FoodListWidget extends StatelessWidget {
  const FoodListWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FoodListBloc, FoodListState>(
      builder: (context, state) {
        return ListView.separated(
          padding: const EdgeInsets.all(16),
          itemCount: state.foodList.length,
          itemBuilder: (_, index) {
            final food = state.foodList[index];
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
                );
              },
              child: FoodCard(food: food),
            );
          },
          separatorBuilder: (_, __) => const SizedBox(height: 12),
        );
      },
    );
  }
}
