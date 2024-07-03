import 'package:flutter/material.dart';
import 'package:hr_project/services/categories.dart';

class CategoriesData extends StatelessWidget {
  final Categories category;

  final void Function() onSelectedCategory;
  const CategoriesData(
      {super.key, required this.category, required this.onSelectedCategory});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onSelectedCategory,
      splashColor: Theme.of(context).primaryColor,
      borderRadius: BorderRadius.circular(16),
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          gradient: LinearGradient(colors: [
            category.colors.withOpacity(0.55),
            category.colors.withOpacity(0.9),
          ], begin: Alignment.topLeft, end: Alignment.bottomRight),
        ),
        child: Text(
          category.title,
          style: Theme.of(context)
              .textTheme
              .titleLarge!
              .copyWith(color: Theme.of(context).colorScheme.onBackground),
        ),
      ),
    );
  }
}
