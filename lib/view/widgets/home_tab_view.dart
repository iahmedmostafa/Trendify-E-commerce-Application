import 'package:flutter/material.dart';
import 'package:trendify/data/model/product_item_model.dart';
import 'package:trendify/view/widgets/custom_carousel_slider.dart';
import 'package:trendify/view/widgets/product_item.dart';

class HomeTabView extends StatelessWidget {
  const HomeTabView({super.key});

  Widget buildGridViewItems(){
    
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 20,
          childAspectRatio: .80
      ),
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemCount:dummyProducts.length,
      itemBuilder: (context, index) {
        return ProductItem(productItemModel: dummyProducts[index]);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          CustomCarouselSlider(),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "New Arrivals🔥",
                style: Theme.of(context).textTheme.labelLarge!.copyWith(
                  fontWeight: FontWeight.w800,
                  fontSize: 18
                ),
              ),
              Text(
                "See All",
                style: Theme.of(context).textTheme.labelLarge!.copyWith(
                  color: Colors.blueAccent,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          buildGridViewItems(),
        ],
      ),
    );
  }
}
