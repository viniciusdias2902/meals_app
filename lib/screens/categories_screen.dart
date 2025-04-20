import 'package:flutter/material.dart';
import 'package:meals_app/data/dummy_data.dart';
import 'package:meals_app/models/category.dart';
import 'package:meals_app/models/meal.dart';
import 'package:meals_app/screens/meals_screen.dart';
import 'package:meals_app/widgets/category_grid_item.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({
    super.key,
    required this.onToggleFavorite,
    required this.avaliableMeals,
  });
  final void Function(Meal meal) onToggleFavorite;
  final List<Meal> avaliableMeals;
  void _selectCategory(BuildContext context, Category category) {
    final filteredMeals =
        avaliableMeals
            .where((meal) => meal.categories.contains(category.id))
            .toList();
    Navigator.push(
      context,
      MaterialPageRoute(
        builder:
            (ctx) => MealsScreen(
              title: category.title,
              meals: filteredMeals,
              onToggleFavorite: onToggleFavorite,
            ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GridView(
      padding: const EdgeInsets.all(24),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 3 / 2,
        crossAxisSpacing: 20,
        mainAxisSpacing: 20,
      ),
      children: [
        for (final category in availableCategories)
          CategoryGridItem(
            category: category,
            onSelectCategory: () {
              _selectCategory(context, category);
            },
          ),
      ],
    );
  }
}
