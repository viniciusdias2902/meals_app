# Meals App

A Flutter application for browsing and managing food recipes organized by categories.

## Features

- Browse meal recipes by categories
- View detailed recipe information including ingredients and cooking steps
- Mark favorite meals
- Filter meals based on dietary preferences (gluten-free, lactose-free, vegetarian, vegan)
- Image loading with placeholder support

## Project Structure

```
lib/
├── data/
│   └── dummy_data.dart      # Sample meal and category data
├── models/
│   ├── category.dart        # Category model
│   └── meal.dart            # Meal model
├── screens/
│   ├── categories_screen.dart    # Screen showing meal categories
│   ├── filter_screen.dart        # Screen for dietary filters
│   ├── meals_details_screen.dart # Detailed view of a meal
│   ├── meals_screen.dart         # Screen showing meals list
│   └── tabs_screen.dart          # Main tabbed interface
├── widgets/
│   ├── category_grid_item.dart         # Grid item for categories
│   ├── main_drawer.dart                # App drawer
│   ├── meal_item.dart                  # List item for meals
│   ├── meal_item_trait.dart            # Meal property widget
│   ├── meals_details_screen_list.dart  # List for meal details
│   └── meals_details_screen_title.dart # Title for meal details
└── main.dart                           # App entry point
```

## Getting Started

### Prerequisites

- Flutter
- Dart SDK
- Android Studio / VS Code

### Installation

1. Clone the repository
2. Navigate to the project directory
3. Run `flutter pub get` to install dependencies
4. Run `flutter run` to start the application

## Dependencies

- google_fonts: For custom text styling
- transparent_image: For image loading with placeholders
