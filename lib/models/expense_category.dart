import 'package:flutter/material.dart';

enum ExpenseCategory {
  food(
    label: 'Food',
    icon: Icons.fastfood,
  ),
  work(
    label: 'Work',
    icon: Icons.work,
  ),
  transport(
    label: 'Transport',
    icon: Icons.directions_bus,
  ),
  education(
    label: 'Education',
    icon: Icons.school,
  ),
  shopping(
    label: 'Shopping',
    icon: Icons.shopping_bag,
  ),
  entertainment(
    label: 'Entertainment',
    icon: Icons.movie,
  ),
  health(
    label: 'Health',
    icon: Icons.local_hospital,
  ),
  bills(
    label: 'Bills',
    icon: Icons.receipt_long,
  ),
  other(
    label: 'Other',
    icon: Icons.category,
  );

  final String label;
  final IconData icon;

  const ExpenseCategory({
    required this.label,
    required this.icon,
  });
}
