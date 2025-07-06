import 'package:bill_split_app/classes/Expense.dart';
import 'package:bill_split_app/classes/Group.dart';
import 'package:flutter/material.dart';

class ExpensesDisplay extends StatefulWidget {
  final List<Expense> expenses;

  const ExpensesDisplay({super.key, required this.expenses});

  @override
  State<ExpensesDisplay> createState() => _ExpenseDisplayState();
}

class _ExpenseDisplayState extends State<ExpensesDisplay> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: widget.expenses.length,
      itemBuilder: (context, index) {
        final expense = widget.expenses[index];

        return Card(
          margin: EdgeInsets.symmetric(horizontal: 10, vertical: 6),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          color: Colors.grey.shade900,
          child: ListTile(
            contentPadding: EdgeInsets.symmetric(horizontal: 12, vertical: 10),
            title: Text(
              '${expense.expense}',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.lightGreen,
              ),
            ),
            subtitle: Text('${expense.name}'),
            subtitleTextStyle: TextStyle(color: Colors.lightGreen, fontSize: 15),
          ),
        );
      },
    );
  }
}
