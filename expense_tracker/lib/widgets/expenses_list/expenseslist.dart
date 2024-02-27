import 'package:flutter/material.dart';
import 'package:expense_tracker/widgets/expenses.dart';
import 'package:expense_tracker/models/expense.dart';
import 'package:expense_tracker/widgets/expenses_list/expenseitem.dart';

class ExpensesList extends StatelessWidget {
  const ExpensesList({required this.expenses,required this.onremoveexpense, super.key});
  final List<Expense> expenses;
  final void Function(Expense expense) onremoveexpense;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: expenses.length,
      itemBuilder: (ctx, index) => Dismissible(
        onDismissed: (direction){onremoveexpense(expenses[index]);},
        background: Container(
          color: Theme.of(context).colorScheme.secondaryContainer,
          margin: EdgeInsets.symmetric(horizontal: 16),

        ),
        key: ValueKey(expenses[index]),
        child: ExpenseItem(expense: expenses[index]),
      ),
    ); // law item count b 10 item builder hay get called 10 marat
  }
}
