import 'package:expense_tracker/models/expense_category.dart';
import 'package:expense_tracker/models/transaction.dart';
import 'package:expense_tracker/screens/app.dart';
import 'package:expense_tracker/widgets/button.dart';
import 'package:flutter/material.dart';

class AddTransaction extends StatefulWidget {
  const AddTransaction({super.key});

  @override
  State<AddTransaction> createState() => _AddTransactionState();
}

class _AddTransactionState extends State<AddTransaction> {
  final _formKey = GlobalKey<FormState>();

  final _titleController = TextEditingController();
  final _amountController = TextEditingController();
  final _descriptionController = TextEditingController();

  ExpenseCategory _selectedCategory = ExpenseCategory.food;
  TransactionType type = TransactionType.expense;

  @override
  void dispose() {
    _titleController.dispose();
    _amountController.dispose();
    _descriptionController.dispose();
    super.dispose();
  }

  void _saveTransaction() {
    if (_formKey.currentState!.validate()) {
      final newTransaction = Transaction(
        title: _titleController.text,
        amount: double.parse(_amountController.text),
        type: type,
        category: _selectedCategory,
      );

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Transaction added successfully"),
          backgroundColor: Colors.green,
          duration: Duration(seconds: 2),
        ),
      );

      Future.delayed(const Duration(seconds: 2), () {
        Navigator.of(
          context,
        ).pushReplacement(MaterialPageRoute(builder: (_) => const App()));
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.all(20),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Add Transaction",
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  TextButton(
                    onPressed: () => Navigator.pop(context),
                    child: Text(
                      "Cancel",
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 50),
              Row(
                children: [
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {
                        setState(() => type = TransactionType.expense);
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: type == TransactionType.expense
                            ? Theme.of(context).colorScheme.primary
                            : Colors.white,
                        foregroundColor: type == TransactionType.expense
                            ? Colors.white
                            : Colors.black,
                      ),
                      child: const Text("Expense"),
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {
                        setState(() => type = TransactionType.income);
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: type == TransactionType.income
                            ? Theme.of(context).colorScheme.primary
                            : Colors.white,
                        foregroundColor: type == TransactionType.income
                            ? Colors.white
                            : Colors.black,
                      ),
                      child: const Text("Income"),
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 25),
              TextFormField(
                controller: _titleController,
                decoration: const InputDecoration(
                  labelText: "Title",
                  alignLabelWithHint: true,
                ),
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return "Title is required";
                  }
                  return null;
                },
              ),
              const SizedBox(height: 20),

              TextFormField(
                controller: _amountController,
                keyboardType: TextInputType.numberWithOptions(decimal: true),
                decoration: const InputDecoration(
                  labelText: "Amount",
                  prefixIcon: Icon(Icons.attach_money),
                ),
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return "Amount is required";
                  }
                  final number = double.tryParse(value);
                  if (number == null || number <= 0) {
                    return "Enter a positive number";
                  }
                  return null;
                },
              ),
              const SizedBox(height: 20),

              DropdownButtonFormField(
                initialValue: _selectedCategory,
                decoration: const InputDecoration(labelText: "Category"),
                items: ExpenseCategory.values.map((category) {
                  return DropdownMenuItem(
                    value: category,
                    child: Row(
                      children: [
                        Icon(category.icon, size: 18),
                        const SizedBox(width: 10),
                        Text(category.label),
                      ],
                    ),
                  );
                }).toList(),
                onChanged: (value) {
                  if (value != null) {
                    setState(() {
                      _selectedCategory = value;
                    });
                  }
                },
              ),
              const SizedBox(height: 20),
              TextFormField(
                controller: _descriptionController,
                maxLines: 3,
                decoration: const InputDecoration(
                  labelText: "Description (optional)",
                  alignLabelWithHint: true,
                ),
              ),
              const Spacer(),
              SizedBox(
                width: double.infinity,
                child: Button(
                  title: 'Save',
                  onPressed: _saveTransaction,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
