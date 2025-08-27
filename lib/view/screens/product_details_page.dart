import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trendify/business_logic/product_details_logic/product_details_cubit.dart';
import 'package:trendify/constants/app_colors.dart';
import 'package:trendify/view/widgets/counter_widget.dart';

class ProductDetailsPage extends StatelessWidget {
  final int productId;

  const ProductDetailsPage({super.key, required this.productId});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: Text("Product Details"),
        backgroundColor: AppColors.grey.withOpacity(.2),
        centerTitle: true,
        elevation: 0.0,
        actions: [
          IconButton(onPressed: () {}, icon: Icon(CupertinoIcons.heart)),
        ],
      ),

      body: SafeArea(
        child: BlocBuilder<ProductDetailsCubit, ProductDetailsState>(
          bloc: BlocProvider.of<ProductDetailsCubit>(context),
          buildWhen: (previous,current)=>current is! ProductQuantityLoaded,
          builder: (context, state) {
            if (state is ProductLoading) {
              return Center(
                child: CircularProgressIndicator.adaptive(
                  backgroundColor: Colors.blue,
                ),
              );
            } else if (state is ProductSuccess) {
              return Stack(
                children: [
                  Positioned(
                    top: 0,
                    right: 0,
                    left: 0,
                    child: Container(
                      width: double.infinity,
                      height: size.height * .4,
                      decoration: BoxDecoration(
                        color: AppColors.grey.withOpacity(.2),
                      ),
                      child: CachedNetworkImage(
                        imageUrl: state.productItemModel.imgUrl,
                        fit: BoxFit.cover,
                        width: size.width * .6,
                      ),
                    ),
                  ),
                  Positioned(
                    top: size.height * .37,
                    child: Container(
                      width: size.width,
                      height: size.height * .6,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(30),
                          topRight: Radius.circular(30),
                        ),
                        color: AppColors.white,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      state.productItemModel.name,
                                      style: Theme.of(
                                        context,
                                      ).textTheme.titleMedium,
                                    ),
                                    Row(
                                      children: [
                                        Text(
                                          state.productItemModel.review,
                                          style: Theme.of(
                                            context,
                                          ).textTheme.titleSmall,
                                        ),
                                        Icon(
                                          Icons.star,
                                          color: AppColors.yellow,
                                          size: 25,
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                                BlocBuilder<ProductDetailsCubit,ProductDetailsState >(
                                  bloc: BlocProvider.of<ProductDetailsCubit>(context),
                                  buildWhen: (previous,current)=>current is ProductQuantityLoaded || current is ProductSuccess ,
                                  builder: (context, state) {
                                     if(state is ProductQuantityLoaded){
                                    return CounterWidget(value:state.counterValue,cubit: BlocProvider.of<ProductDetailsCubit>(context),productId: productId,);
                                    }
                                    else if(state is ProductSuccess){
                                      return CounterWidget(value:state.productItemModel.quantity , cubit: BlocProvider.of<ProductDetailsCubit>(context),productId: productId);
                                    }
                                    else{
                                      return SizedBox.shrink();
                                    }

                                  },
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              );
            } else if (state is ProductError) {
              return Center(child: Text(state.errorMsg));
            } else {
              return Container(color: Colors.red);
            }
          },
        ),
      ),
    );
  }
}
