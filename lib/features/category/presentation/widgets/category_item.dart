import 'package:flutter/material.dart';
import 'package:ibaza_mock_data/assets/constants/colors.dart';
import 'package:ibaza_mock_data/features/category/data/model/category.dart';

class CategoryItem extends StatelessWidget {
  final CategoryModel category;
  const CategoryItem({
    super.key,
    required this.category,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: Container(
        width: 106,
        height: 110,
        padding: const EdgeInsets.only(top: 5, left: 5),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          color: greyish,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              category.type,
              style: const TextStyle(color: Colors.black, fontSize: 12),
            ),
            const Spacer(),
            Row(mainAxisAlignment: MainAxisAlignment.end, children: [
              ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Image.asset(
                    category.img,
                    width: 60,
                    height: 60,
                  ))
            ]),
          ],
        ),
      ),
    );
  }
}
