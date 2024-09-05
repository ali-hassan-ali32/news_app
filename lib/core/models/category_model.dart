import 'package:flutter/material.dart';

class CategoryModel {
  final String id;
  final String title;
  final String image;
  final Color color;

  CategoryModel(
      {required this.id,
      required this.title,
      required this.color,
      required this.image});

  static List<CategoryModel> categories = [
    CategoryModel(
        id: 'business',
        title: 'business',
        color: Colors.brown,
        image: 'bussines.png'),
    CategoryModel(
        id: 'sports',
        title: 'sports',
        color: Colors.red,
        image: 'sports.png'),
    CategoryModel(
        id: 'science',
        title: 'science',
        color: Colors.green,
        image: 'science.png'),
    CategoryModel(
        id: 'general',
        title: 'general',
        color: Colors.lightBlueAccent,
        image: 'Politics.png'),
    CategoryModel(
        id: 'health',
        title: 'health',
        color: Colors.pink,
        image: 'health.png'),
    CategoryModel(
        id: 'entertainment',
        title: 'entertainment',
        color: Colors.blueAccent,
        image: 'environment.png'),
  ];
}
