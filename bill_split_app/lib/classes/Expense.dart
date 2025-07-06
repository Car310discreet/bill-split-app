class Expense {
  final expense;
  final name;

  Expense({required this.expense, required this.name});

  factory Expense.fromJson(json){
    return Expense(expense: json['expense'], name: json['user']['name']);
  }
}