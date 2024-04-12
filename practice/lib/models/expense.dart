import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';
import 'package:intl/intl.dart';

// ignore: non_constant_identifier_names
final Formatter = DateFormat.yMd();

const uuid = Uuid();

enum Category { food, travel, leasiur, work }

// ignore: constant_identifier_names
const CategoryItem = {
  Category.food: Icons.lunch_dining,
  Category.travel: Icons.flight_takeoff,
  Category.leasiur: Icons.movie,
  Category.work: Icons.work,
};

class Expense {
  Expense({
    required this.date,
    required this.title,
    required this.ammount,
    required this.category,
  }) : id = uuid.v4();

  final String id;
  final String title;
  final double? ammount;
  final DateTime date;
  final Category category;

  // ignore: non_constant_identifier_names
  String get FormattedDate {
    return Formatter.format(date);
  }
}
