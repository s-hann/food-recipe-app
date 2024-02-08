import 'package:flutter/material.dart';

import 'package:msig_assignment_test/features/food_detail/domain/entities/food_detail_entity.dart';

class FoodCard extends StatelessWidget {
  const FoodCard({
    Key? key,
    required this.food,
  }) : super(key: key);

  final FoodDetailEntity food;

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.horizontal(
              left: Radius.circular(8),
            ),
            child: Image.network(
              food.strMealThumb,
              width: 100,
            ),
          ),
          const SizedBox(width: 12),
          Expanded(child: Text(food.strMeal)),
        ],
      ),
    );
  }
}
