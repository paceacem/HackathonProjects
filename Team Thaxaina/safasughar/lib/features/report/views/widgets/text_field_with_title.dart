import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:safasughar/extensions/extension.dart';

class TextFieldWithTitle extends ConsumerWidget {
  final String title;
  final TextEditingController controller;
  const TextFieldWithTitle(
      {super.key, required this.title, required this.controller});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(
            fontSize: 20,
          ),
        ),
        TextFormField(
          decoration: InputDecoration(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(18),
            ),
            hintText: title == "Title"
                ? "Enter whether it is illegal dumping or about garbage collection"
                : "Enter short description ",
          ),
        ),
      ],
    ).onPadB(10);
  }
}
