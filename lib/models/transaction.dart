
import 'expense_category.dart';

enum TransactionType {
  expense,
  income,
}

class Transaction {
  final String id;
  final String title;
  final double amount;
  final DateTime date;
  final TransactionType type;
  final ExpenseCategory category;

  Transaction({
    String? id,
    required this.title,
    required this.amount,
    DateTime? date,
    required this.type,
    required this.category,
  }) : id = id ?? DateTime.now().millisecondsSinceEpoch.toString(),
       date = date ?? DateTime.now();
}
