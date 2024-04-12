import 'package:auda/core/constant/colors.dart';
import 'package:auda/presentation/common/controller/categories.dart';
import 'package:flutter/material.dart';

class CategoryChip extends StatefulWidget {
  const CategoryChip({super.key, required this.category});

  final Categories category;

  @override
  State<CategoryChip> createState() => _CategoryChipState();
}

class _CategoryChipState extends State<CategoryChip> {
  bool _seleted = false;

  @override
  Widget build(BuildContext context) {
    return ChoiceChip(
      backgroundColor: Colors.grey.shade300,
      selectedColor: CustomColor.thirdColor,
      side: const BorderSide(style: BorderStyle.none),
      label: Text(widget.category.name),
      selected: _seleted,
      onSelected: (selected) {
        _seleted = selected;
        setState(() {});
      },
    );
  }
}
