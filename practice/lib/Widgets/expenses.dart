import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:practice/Widgets/expenses_list/expenses_list.dart';
import 'package:practice/Widgets/new_expense.dart';
import 'package:practice/models/expense.dart';

class Expences extends StatefulWidget {
  const Expences({super.key});

  @override
  State<StatefulWidget> createState() {
    return _ExpencesState();
  }
}

class _ExpencesState extends State<Expences> {
  final List<Expense> _registeredexpense = [
    Expense(
      date: DateTime.now(),
      title: 'Udemy Course',
      ammount: 19.99,
      category: Category.work,
    ),
    Expense(
      date: DateTime.now(),
      title: 'Coffee',
      ammount: 6.99,
      category: Category.food,
    )
  ];

  void _openExpensesOverlay() {
    showModalBottomSheet(
      context: context,
      builder: (ctx) {
        return const NewExpense();
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Expense Tracker'),
        backgroundColor: Colors.amber,
        actions: [
          IconButton(
            onPressed: _openExpensesOverlay,
            icon: const Icon(Icons.add),
          ),
        ],
      ),
      body: Column(
        children: [
          const Text('Constant'),
          Expanded(child: ExpensesList(expenses: _registeredexpense))
        ],
      ),
    );
  }
}
