import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals_app/models/meal.dart';
import 'package:meals_app/providers/favorites_provider.dart';
import 'package:meals_app/widgets/meals_details_screen_list.dart';
import 'package:meals_app/widgets/meals_details_screen_title.dart';
import 'package:transparent_image/transparent_image.dart';

class MealsDetailsScreen extends ConsumerWidget {
  const MealsDetailsScreen({super.key, required this.meal});

  final Meal meal;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final favoriteMeals = ref.watch(favoriteMealsProvider);
    final isFavorite = favoriteMeals.contains(meal);
    return Scaffold(
      appBar: AppBar(
        title: Text(meal.title),
        actions: [
          IconButton(
            onPressed: () {
              final wasAdded = ref
                  .read(favoriteMealsProvider.notifier)
                  .toggleMealFavoriteStatus(meal);
              ScaffoldMessenger.of(context).clearSnackBars();
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(
                    wasAdded ? 'Meal added as a favorite' : 'Meal removed',
                  ),
                ),
              );
            },
            icon: isFavorite ? Icon(Icons.star) : Icon(Icons.star_border),
          ),
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              FadeInImage(
                placeholder: MemoryImage(kTransparentImage),
                image: NetworkImage(meal.imageUrl),
                fit: BoxFit.cover,
                height: 200,
                width: double.infinity,
              ),
              MealsDetailsScreenTitle(text: 'Ingrediants'),
              MealsDetailsScreenList(items: meal.ingredients),
              SizedBox(height: 10),
              MealsDetailsScreenTitle(text: 'Steps'),
              MealsDetailsScreenList(items: meal.steps),
            ],
          ),
        ),
      ),
    );
  }
}
