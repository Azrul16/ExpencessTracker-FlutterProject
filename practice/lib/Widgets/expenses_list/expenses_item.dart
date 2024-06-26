import 'package:flutter/material.dart';
import 'package:practice/models/expense.dart';

class ExpenseItem extends StatelessWidget {
  const ExpenseItem(
    this.expense, {
    super.key,
  });

  final Expense expense;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 16,
        ),
        child: Column(
          children: [
            Text(expense.title),
            const SizedBox(
              height: 4,
            ),
            Row(
              children: [
                Text('\$${expense.ammount?.toStringAsFixed(2)}'),
                const Spacer(),
                Row(
                  children: [
                    Icon(CategoryItem[expense.category]),
                    const SizedBox(
                      height: 4,
                    ),
                    Text(
                      expense.FormattedDate,
                    )
                  ],
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
