import 'package:expense_tracker/models/transaction.dart';
import 'package:expense_tracker/models/expense_category.dart';

final List<Transaction> mockTransactions = [
  Transaction(
    id: 't1',
    title: 'Lunch at Cafe',
    amount: 12.50,
    date: DateTime.now().subtract(const Duration(days: 1)),
    type: TransactionType.expense,
    category: ExpenseCategory.food,
  ),
  Transaction(
    id: 't2',
    title: 'Uber Ride',
    amount: 8.20,
    date: DateTime.now().subtract(const Duration(days: 2)),
    type: TransactionType.expense,
    category: ExpenseCategory.transport,
  ),
  Transaction(
    id: 't3',
    title: 'Freelance Project',
    amount: 150.00,
    date: DateTime.now().subtract(const Duration(days: 3)),
    type: TransactionType.income,
    category: ExpenseCategory.work,
  ),
  Transaction(
    id: 't4',
    title: 'Grocery Shopping',
    amount: 55.75,
    date: DateTime.now().subtract(const Duration(days: 4)),
    type: TransactionType.expense,
    category: ExpenseCategory.shopping,
  ),
  Transaction(
    id: 't5',
    title: 'Sold Old Bike',
    amount: 200.00,
    date: DateTime.now().subtract(const Duration(days: 5)),
    type: TransactionType.income,
    category: ExpenseCategory.other,
  ),
];
