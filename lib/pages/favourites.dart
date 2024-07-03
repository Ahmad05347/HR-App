import 'package:flutter/material.dart';
import 'package:hr_project/services/categories_data.dart';
import 'package:hr_project/services/dummy_data.dart';

class Favourites extends StatelessWidget {
  const Favourites({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
              mainAxisSpacing: 20,
            ),
            children: [
              for (final category in avalibleCategories)
                CategoriesData(
                  category: category,
                  onSelectedCategory: () {
                    // Implement your onSelectedCategory logic here
                    print('Selected category: ${category.title}');
                  },
                )
            ],
          ),
        ),
      ),
    );
  }
}
