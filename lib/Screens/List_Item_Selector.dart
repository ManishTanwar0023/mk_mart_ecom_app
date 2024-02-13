import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../Model/product_category.dart';


class ListItemSelector extends StatelessWidget {
  ListItemSelector({
    Key? key,
    required this.categories,
    required this.onItemPressed,
  }) : super(key: key);

  final List<ProductCategory> categories;
  final Function(int) onItemPressed;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      child: Obx(
            () => ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: categories.length,
          itemBuilder: (_, index) => _buildItem(categories[index], index),
        ),
      ),
    );
  }

  Widget _buildItem(ProductCategory item, int index) {
    return Tooltip(
      message: item.type.name.capitalizeFirst,
      child: AnimatedContainer(
        margin: const EdgeInsets.only(left: 5),
        duration: const Duration(milliseconds: 500),
        width: 50,
        height: 100,
        decoration: BoxDecoration(
          color: item.isSelected == false
              ? const Color(0xFFE5E6E8)
              : const Color(0xFFf16b26),
          borderRadius: BorderRadius.circular(10),
        ),
        child: IconButton(
          splashRadius: 0.1,
          icon: FaIcon(
            item.icon,
            color: item.isSelected == false
                ? const Color(0xFFA6A3A0)
                : Colors.white,
          ),
          onPressed: () {
            onItemPressed(index);
            for (var element in categories) {
              element.isSelected = false;
            }

            item.isSelected = true;
          },
        ),
      ),
    );
  }
}
