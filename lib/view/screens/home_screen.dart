import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:trendify/constants/app_constants.dart';
import 'package:trendify/data/model/product_item_model.dart';
import 'package:trendify/view/widgets/product_item.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  Widget tobBarHome(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            CircleAvatar(
              radius: 30,
              backgroundImage: AssetImage(AppConstants.myPhoto),
            ),
            const SizedBox(width: 10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Ahmed Mostafa",
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                Text(
                  "Let's go shopping ",
                  style: Theme.of(
                    context,
                  ).textTheme.titleSmall!.copyWith(color: Colors.grey,fontSize: 12),
                ),
              ],
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            IconButton(onPressed: () {}, icon: Icon(CupertinoIcons.search,size: 20,)),
            IconButton(onPressed: () {}, icon: Icon(CupertinoIcons.bell,size: 20,)),
          ],
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                tobBarHome(context),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "New Arrivals🔥",
                      style: Theme.of(context).textTheme.labelLarge!.copyWith(
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Text(
                      "See All",
                      style: Theme.of(context).textTheme.labelLarge!.copyWith(
                        color: Theme.of(context).primaryColor,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 20,
                   // mainAxisSpacing: 40,
                    childAspectRatio: .80
                  ),
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount:dummyProducts.length,
                  itemBuilder: (context, index) {
                 return ProductItem(productItemModel: dummyProducts[index]);
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
