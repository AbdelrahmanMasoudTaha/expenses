import 'package:expenses_app/models/expense.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class NewExpense extends StatefulWidget {
  const NewExpense({super.key, required this.onAddExpense});
  final void Function(Expense expense) onAddExpense;
  @override
  State<NewExpense> createState() => _NewExpenseState();
}

class _NewExpenseState extends State<NewExpense> {
  final _titleController = TextEditingController();
  final _amountController = TextEditingController();
  Category _selectedCategory = Category.work;
  DateTime? _selectedDate;
  final formatter = DateFormat.yMd();

  @override
  void dispose() {
    super.dispose();
    _titleController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Column(
        children: [
          TextField(
            maxLength: 40,
            controller: _titleController,
            decoration: const InputDecoration(label: Text('Title')),
          ),
          const SizedBox(
            height: 20,
          ),
          Row(
            children: [
              Expanded(
                child: TextField(
                  keyboardType: TextInputType.number,
                  controller: _amountController,
                  decoration: const InputDecoration(
                    label: Text('Amount'),
                    prefixText: '\$',
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      (_selectedDate == null)
                          ? 'no selected date'
                          : formatter.format(_selectedDate!),
                      style: TextStyle(
                        color: (_selectedDate == null)
                            ? const Color.fromARGB(209, 241, 70, 57)
                            : const Color.fromARGB(211, 31, 161, 35),
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    IconButton(
                      onPressed: () async {
                        final now = DateTime.now();
                        final DateTime? pickedDate = await showDatePicker(
                            context: context,
                            firstDate:
                                DateTime(now.year, now.month - 1, now.day),
                            initialDate: now,
                            lastDate:
                                DateTime(now.year, now.month, now.day + 5));
                        setState(() {
                          _selectedDate = pickedDate;
                        });
                      },
                      icon: const Icon(Icons.calendar_month),
                    )
                  ],
                ),
              )
            ],
          ),
          const SizedBox(
            height: 30,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Category',
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                width: 20,
              ),
              DropdownButton(
                  value: _selectedCategory,
                  items: Category.values
                      .map(
                        (e) => DropdownMenuItem(
                          value: e,
                          child: Text(e.name.toUpperCase()),
                        ),
                      )
                      .toList(),
                  onChanged: (newCat) {
                    if (newCat == null) return;
                    setState(() {
                      _selectedCategory = newCat;
                    });
                  }),
            ],
          ),
          const SizedBox(
            height: 50,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: const Text(
                  'Cansel',
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(255, 204, 49, 38),
                  ),
                ),
              ),
              const SizedBox(
                width: 20,
              ),
              ElevatedButton(
                onPressed: () {
                  final enteredAmount = double.tryParse(_amountController.text);
                  final isInvalideAmount =
                      enteredAmount == null || enteredAmount <= 0;
                  if (isInvalideAmount ||
                      _titleController.text.trim().isEmpty ||
                      _selectedDate == null) {
                    showDialog(
                        context: context,
                        builder: (ctx) => AlertDialog(
                              title: const Text('Invalid input!!'),
                              content: const Text(
                                  'please make sure that title, amount and date was entered correctly.'),
                              actions: [
                                TextButton(
                                  onPressed: () => Navigator.pop(context),
                                  child: const Text('okey'),
                                ),
                              ],
                            ));
                  } else {
                    widget.onAddExpense(
                      Expense(
                          title: _titleController.text,
                          amount: enteredAmount,
                          date: _selectedDate!,
                          category: _selectedCategory),
                    );
                    Navigator.pop(context);
                  }
                },
                child: const Text('Save Expense'),
              )
            ],
          )
        ],
      ),
    );
  }
}
