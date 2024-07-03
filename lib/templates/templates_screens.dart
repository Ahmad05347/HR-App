import 'package:flutter/material.dart';
import 'package:hr_project/services/categories.dart';
import 'package:hr_project/services/categories_data.dart';
import 'package:hr_project/services/dummy_data.dart';
import 'package:hr_project/templates/templates2.dart';

class TemplatesScreens extends StatelessWidget {
  const TemplatesScreens({super.key});

  void _selectedCategories(BuildContext context, Categories category) {
    final filtered = dummyMeals
        .where(
          (templatesItems) => templatesItems.categories.contains(category.id),
        )
        .toList();

    Navigator.of(context).push(
      MaterialPageRoute(
          builder: (contex) =>
              TemplatesV2(templates: filtered, titles: category.title)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Scaffold(
        appBar: AppBar(
          leading: const BackButton(),
        ),
        body: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Center(
              child: GridView(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 20,
                childAspectRatio: 3 / 4,
                mainAxisSpacing: 20),
            children: [
              for (final category in avalibleCategories)
                CategoriesData(
                  category: category,
                  onSelectedCategory: () {
                    _selectedCategories(context, category);
                  },
                ),
            ],
          )),
        ),
      ),
    );
  }
}
