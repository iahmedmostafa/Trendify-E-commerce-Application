import 'package:flutter/material.dart';
import 'package:trendify/data/model/category_item_model.dart';
import 'package:trendify/view/widgets/category_item.dart';

class CategoryTabView extends StatelessWidget {
  const CategoryTabView({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: dummyCategories.length,
        itemBuilder: (context, index){
      return InkWell(onTap:(){} ,child: CategoryItem(categoryItemModel: dummyCategories[index]));

    });

  }
}
