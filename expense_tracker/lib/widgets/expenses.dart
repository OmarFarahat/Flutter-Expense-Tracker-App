import 'package:expense_tracker/widgets/chart/chart.dart';
import 'package:expense_tracker/widgets/new_expense.dart';
import 'package:flutter/material.dart';
import 'package:expense_tracker/models/expense.dart';
import 'package:expense_tracker/widgets/expenses_list/expenseslist.dart';
import 'package:expense_tracker/widgets/new_expense.dart';
import 'package:flutter/widgets.dart';
import 'package:expense_tracker/widgets/chart/chart.dart';

class Expenses extends StatefulWidget {
  Expenses({super.key});
  @override
  State<Expenses> createState() {
    return _ExpensesState();
  }
}

class _ExpensesState extends State<Expenses> {
   final List<Expense> _registeredExpenses = [
    Expense(
        title: 'Flutter Course',
        amount: 19.99,
        date: DateTime.now(),
        category: Category.work),
    Expense(
        title: 'Cinema',
        amount: 15.69,
        date: DateTime.now(),
        category: Category.leisure),
  ];

  void _openAddExpense(){
    showModalBottomSheet(
      isScrollControlled: true,
      context: context, builder: (ctx) =>
       NewExpense(onAddExpense: _addExpense),
    );
  }
  void _addExpense(Expense registeredExpense){
    setState(() {
          _registeredExpenses.add(registeredExpense);

    });

  }
  
    void _removeExpense(Expense expense){
      final expenseindex = _registeredExpenses.indexOf(expense);
      
      setState(() {
        _registeredExpenses.remove(expense);
      });
      ScaffoldMessenger.of(context).clearSnackBars();
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(duration: const Duration(seconds: 3),
        content: Text('Expense deleted'),
        action: SnackBarAction(label: 'Undo', onPressed: (){setState(() {
          _registeredExpenses.insert(expenseindex, expense);
        
          });}),
        ));
    }


  @override
  Widget build(BuildContext context) {
    Widget mainContent = Column(
      
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(height:200),
        const Center(child: 
        Text("Your List is empty", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 21),),),
      ],
    );

  if(_registeredExpenses.isNotEmpty){{
    mainContent=          Expanded(child: ExpensesList(expenses: _registeredExpenses, onremoveexpense: _removeExpense));

  }}

    return Scaffold(
      appBar: AppBar(
        title: Text('Expense Tracker'),
        actions: [
          IconButton(onPressed: _openAddExpense ,
           icon: const Icon(Icons.add))
        ],
      ),
      body: Column(
        children: [
          Chart(expenses: _registeredExpenses),
          mainContent
        ],
      ),
    );
  }
}
