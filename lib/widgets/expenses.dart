import 'package:expenses_app/models/expense.dart';
import 'package:expenses_app/widgets/expenses_list/expenses_list.dart';
import 'package:expenses_app/widgets/new_expense.dart';
import 'package:flutter/material.dart';

class Expenses extends StatefulWidget {
  const Expenses({super.key});

  @override
  State<Expenses> createState() => _ExpensesState();
}

class _ExpensesState extends State<Expenses> {
  final List<Expense> _regesteredExpenses = [
    Expense(
        category: Category.work,
        title: 'Fultter Course',
        amount: 90.9,
        date: DateTime.now()),
    Expense(
        category: Category.food,
        title: 'Breakfast',
        amount: 15.7,
        date: DateTime.now()),
    Expense(
        category: Category.leisure,
        title: 'Cenima',
        amount: 30,
        date: DateTime.now()),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Expenses"),
        centerTitle: true,
        actions: [
          IconButton(
              onPressed: () {
                showModalBottomSheet(
                    context: context,
                    builder: (ctx) {
                      return const NewExpense();
                    });
              },
              icon: const Icon(Icons.add))
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text("..."),
            Expanded(
              child: ExpensesList(expenses: _regesteredExpenses),
            ),
          ],
        ),
      ),
    );
  }
}
