import 'package:flutter/material.dart';
import 'package:hr_project/services/categories.dart';
import 'package:hr_project/templates/templates_items.dart';

const avalibleCategories = [
  Categories(id: "1", title: "Dark", colors: Colors.purple),
  Categories(id: "2", title: "Light", colors: Colors.green),
  Categories(id: "3", title: "Medium", colors: Colors.grey),
  Categories(id: "4", title: "Chill", colors: Colors.blue),
  Categories(id: "5", title: "Food", colors: Colors.pink),
  Categories(id: "6", title: "Perks", colors: Colors.red),
  Categories(id: "7", title: "Cool", colors: Colors.deepPurple),
  Categories(id: "8", title: "Breeze", colors: Colors.deepOrange),
];

const dummyMeals = [
  TemplatesItems(
      id: "11",
      imageURL:
          "https://www.imagesjunction.com/images/img/aesthetic_pictures.jpg",
      categories: ["1"],
      durations: 20,
      title: "Free Templates",
      isFreetemplates: true,
      isPaidTemplates: false),
  TemplatesItems(
      id: "21",
      imageURL:
          "https://www.imagesjunction.com/images/img/aesthetic_pictures.jpg",
      categories: ["2"],
      durations: 20,
      title: "Free Templates",
      isFreetemplates: true,
      isPaidTemplates: false),
  TemplatesItems(
      id: "31",
      imageURL:
          "https://www.imagesjunction.com/images/img/aesthetic_pictures.jpg",
      categories: ["3"],
      durations: 20,
      title: "Free Templates",
      isFreetemplates: true,
      isPaidTemplates: false),
  TemplatesItems(
      id: "41",
      imageURL:
          "https://www.imagesjunction.com/images/img/aesthetic_pictures.jpg",
      categories: ["4"],
      durations: 20,
      title: "Paid Templates",
      isFreetemplates: false,
      isPaidTemplates: true),
  TemplatesItems(
      id: "51",
      imageURL:
          "https://www.imagesjunction.com/images/img/aesthetic_pictures.jpg",
      categories: ["5"],
      durations: 20,
      title: "Paid Templates",
      isFreetemplates: false,
      isPaidTemplates: true),
  TemplatesItems(
      id: "61",
      imageURL:
          "https://www.imagesjunction.com/images/img/aesthetic_pictures.jpg",
      categories: ["6"],
      durations: 20,
      title: "Paid Templates",
      isFreetemplates: false,
      isPaidTemplates: true),
];
