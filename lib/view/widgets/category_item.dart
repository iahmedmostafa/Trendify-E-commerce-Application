import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:trendify/constants/app_colors.dart';
import 'package:trendify/data/model/category_item_model.dart';

class CategoryItem extends StatelessWidget {
  final CategoryItemModel categoryItemModel;
  const CategoryItem({super.key , required this.categoryItemModel});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: 150,
        width: 300,
        decoration: BoxDecoration(
          image: DecorationImage(image: CachedNetworkImageProvider( categoryItemModel.imgUrl,),fit: BoxFit.cover),
          borderRadius: BorderRadius.circular(16)
        ),
        child: Stack(
          children: [
            Positioned(
                top: 20,
                right:categoryItemModel.id%2!=0?5.0:200 ,
                left:categoryItemModel.id%2==0?5.0:200,
                child: Column(
                  children: [
                    Text(categoryItemModel.categoryName,style: Theme.of(context).textTheme.labelLarge!.copyWith(
                      fontWeight: FontWeight.bold
                    ),),
                    Text("${categoryItemModel.categoryItemsCount} Product",style: Theme.of(context).textTheme.labelLarge!.copyWith(
                        fontWeight: FontWeight.normal,
                      color: AppColors.black.withOpacity(.7),
                    ),),
                  ],
                )),

          ],
        ),
      ),
    );
  }
}
