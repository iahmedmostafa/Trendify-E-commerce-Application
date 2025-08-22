import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:trendify/data/model/product_item_model.dart';

class ProductItem extends StatelessWidget {
 final ProductItemModel productItemModel;
  const ProductItem({super.key,required this.productItemModel});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(
          children: [
            Container(
                height: 120,
                width: 200,
                decoration:  BoxDecoration(
                    color: Colors.grey.withOpacity(.2),
                    borderRadius: BorderRadius.circular(15)
                ),
                child:Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: CachedNetworkImage(
                    imageUrl: productItemModel.imgUrl,
                    placeholder: (context, url) => CircularProgressIndicator.adaptive(),
                    errorWidget: (context, url, error) => Icon(Icons.error),
                  ),
                ),),
            Positioned(
                top: 5.0,
                right: 2.0,
                child:DecoratedBox(decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.white.withOpacity(.4),
                ),child: IconButton(onPressed: (){}, icon: Icon(CupertinoIcons.heart,)))
            ),
          ],
        ),
        const SizedBox(height: 4,),
        Text(productItemModel.name,style: Theme.of(context).textTheme.titleMedium,),
        Text(productItemModel.category,style: Theme.of(context).textTheme.labelMedium!.copyWith(color:Colors.grey ),),
        Text("${productItemModel.price}\$",style: Theme.of(context).textTheme.titleSmall,),
      ],
    );
  }
}
