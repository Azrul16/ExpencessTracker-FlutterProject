import 'package:flutter/material.dart';
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
        isScrollControlled: true,
        context: context,
        builder: (ctx) => NewExpense(onAddExpense: _addExpenses));
  }

  void _addExpenses(Expense expense) {
    setState(() {
      _registeredexpense.add(expense);
    });
  }

  void _removeExpense(Expense expence) {
    final expenseIndex = _registeredexpense.indexOf(expence);
    setState(() {
      _registeredexpense.remove(expence);
    });

    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        duration: const Duration(seconds: 3),
        content: const Text('Expense deleted'),
        action: SnackBarAction(
          label: 'Undo',
          onPressed: () {
            setState(() {
              _registeredexpense.insert(expenseIndex, expence);
            });
          },
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    Widget maincontent = const Center(
      child: Text('No expenses found. Start adding some'),
    );

    if (_registeredexpense.isNotEmpty) {
      maincontent = ExpensesList(
        expenses: _registeredexpense,
        onRemoveExpense: _removeExpense,
      );
    }
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
          Expanded(
            child: maincontent,
          )
        ],
      ),
    );
  }
}
