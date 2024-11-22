import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class AddProductTextField extends ConsumerStatefulWidget {
  const AddProductTextField({
    super.key,
    required this.controller,
    required this.hintText,
    this.isCalendar = false,
    this.textInputType = TextInputType.text,
    this.onDatePicked,
  });

  final String hintText;
  final TextEditingController controller;
  final bool isCalendar;
  final TextInputType textInputType;
  final Function(DateTime)? onDatePicked;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _PostTextFieldState();
}

class _PostTextFieldState extends ConsumerState<AddProductTextField> {
  @override
  Widget build(BuildContext context) {
    if (widget.isCalendar) return _calenderBuilder();
    return TextFormField(
      controller: widget.controller,
      style: const TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 20,
        color: Colors.white,
      ),
      keyboardType: widget.textInputType,
      decoration: InputDecoration(
        border: InputBorder.none,
        hintText: widget.hintText,
        hintStyle: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 20,
          color: Colors.white.withOpacity(0.5),
        ),
      ),
    );
  }

  Widget _calenderBuilder() {
    return GestureDetector(
      onTap: _selectDate,
      child: Row(
        children: [
          Expanded(
            child: Text(
              widget.controller.text.isEmpty
                  ? widget.hintText
                  : widget.controller.text,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
                color: widget.controller.text.isEmpty
                    ? Colors.white.withOpacity(0.5)
                    : Colors.white,
              ),
            ),
          ),
          IconButton(
            onPressed: _selectDate,
            icon: Icon(
              Icons.calendar_month,
              color: widget.controller.text.isEmpty
                  ? Colors.white.withOpacity(0.5)
                  : Colors.white,
            ),
          ),
        ],
      ),
    );
  }

  Future<void> _selectDate() async {
    FocusScope.of(context).unfocus();
    final today = DateTime.now();
    final selectedDate = await showDatePicker(
      context: context,
      initialDate: today,
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    );
    if (!mounted) return;
    if (selectedDate != null) {
      widget.onDatePicked?.call(selectedDate);
      setState(() {
        widget.controller.text =
            "${selectedDate.day}/${selectedDate.month}/${selectedDate.year}";
      });
    }
  }
}
