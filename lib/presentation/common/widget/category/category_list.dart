import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/constant/colors.dart';
import '../../controller/categories.dart';

class CategoryList extends ConsumerStatefulWidget {
  const CategoryList({super.key});

  @override
  ConsumerState<CategoryList> createState() => _CategoryListState();
}

class _CategoryListState extends ConsumerState<CategoryList> {
  @override
  Widget build(BuildContext context) {
    List<bool> _selected = ref.watch(categorySelectedListProvider);

    return SizedBox(
      width: 320.w,
      height: 40.h,
      child: ListView.separated(
        cacheExtent: Categories.lenght.toDouble() * 2,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          final Categories category = Categories.listIndex(index);
          return ChoiceChip(
            backgroundColor: Colors.grey.shade300,
            selectedColor: CustomColor.thirdColor,
            side: const BorderSide(style: BorderStyle.none),
            label: Text(category.name),
            selected: _selected[index],
            onSelected: (selected) {
              _selected[index] = selected;
              setState(() {});
            },
          );
        },
        separatorBuilder: (_, __) => const SizedBox(
          width: 10,
        ),
        itemCount: Categories.lenght,
      ),
    );
  }
}
