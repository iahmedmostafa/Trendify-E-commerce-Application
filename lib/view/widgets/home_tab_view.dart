import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trendify/business_logic/home/home_cubit.dart';
import 'package:trendify/constants/app_routes.dart';
import 'package:trendify/view/widgets/custom_carousel_slider.dart';
import 'package:trendify/view/widgets/product_item.dart';

class HomeTabView extends StatelessWidget {
  const HomeTabView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      bloc: BlocProvider.of<HomeCubit>(context),
  builder: (context, state) {
    if (state is HomeLoading) {
      return Center(child: CircularProgressIndicator.adaptive());
    }
    else if (state is HomeLoaded) {
      return Column(
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
      Expanded(
        child: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 20,
              childAspectRatio: .80
          ),
          itemCount:state.products.length,
          itemBuilder: (context, index) {
            return InkWell(
            onTap: (){
              Navigator.of(context,rootNavigator: true).pushNamed(AppRoutes.productDetailsScreen,arguments: state.products[index].id);
            }
            ,child: ProductItem(productItemModel: state.products[index]));
          },
        ),
      ),
        ],
      );
    }
    else if(state is HomeError){
      return Center(
        child: Text(state.errorMsg),
      );
    }
    else {
      return Container(
        color: Colors.red,
      );
    }
  },
);
  }
}
