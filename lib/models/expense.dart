import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:uuid/uuid.dart';

class Expense {
  static const uuid = Uuid();
  final dateFormat = DateFormat.yMd();

  String get formattedDate {
    return dateFormat.format(date);
  }

  static const categoryIcons = {
    Category.food: Icons.lunch_dining,
    Category.leisure: Icons.movie,
    Category.travel: Icons.directions_car_sharp,
    Category.work: Icons.work,
  };
  Expense(
      {required this.title,
      required this.amount,
      required this.date,
      required this.category})
      : id = uuid.v4();
  final String id;
  final String title;
  final double amount;
  final DateTime date;
  final Category category;
}

enum Category { food, travel, leisure, work }
