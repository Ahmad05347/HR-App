import 'package:flutter/material.dart';

class Categories {
  const Categories(
      {required this.id, required this.title, this.colors = Colors.orange});

  final String id;
  final String title;
  final Color colors;
}
