import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:msig_assignment_test/features/food_detail/presentation/bloc/food_detail/food_detail_bloc.dart';
import 'package:msig_assignment_test/features/food_detail/presentation/widgets/error_load_widget.dart';
import 'package:msig_assignment_test/features/food_detail/presentation/widgets/show_food_detail_view.dart';

class FoodDetailPage extends StatelessWidget {
  const FoodDetailPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FoodDetailBloc, FoodDetailState>(
      builder: (_, state) {
        if (state.status == FoodDetailStatus.loading) {
          return const Center(child: CircularProgressIndicator());
        }
        if (state.status == FoodDetailStatus.success) {
          final food = state.food;
          return ShowFoodDetailView(food: food);
        }
        return const ErrorLoadWidget();
      },
    );
  }
}
