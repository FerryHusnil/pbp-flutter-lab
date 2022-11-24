import "dart:collection";
import "package:flutter/material.dart";

class Budget {
  final String title;
  final int nominal;
  final String type;
  final String date;

  Budget({required this.title, required this.nominal, required this.type, required this.date});
}

class BudgetModel extends ChangeNotifier {
  final List<Budget> _budgets = [];

  UnmodifiableListView<Budget> get budgets => UnmodifiableListView(_budgets);

  void addBudget(Budget budget) {
    _budgets.add(budget);
  }
}