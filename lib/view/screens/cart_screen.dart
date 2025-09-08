import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dash/flutter_dash.dart';
import 'package:trendify/business_logic/cart/cart_cubit.dart';
import 'package:trendify/constants/app_colors.dart';
import 'package:trendify/view/widgets/cart_item_widget.dart';

class CartScreen extends StatelessWidget {
   CartScreen({super.key});

  double shippingValue=10.0;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) {
        final cubit = CartCubit();
        cubit.getCartItems();
        return cubit;
      },
      child: BlocBuilder<CartCubit, CartState>(
        // bloc: BlocProvider.of<CartCubit>(context),
        buildWhen: (previous, current) =>
            current is CartLoaded ||
            current is CartLoading ||
            current is CartError,
        builder: (context, state) {
          if (state is CartLoading) {
            return const Center(child: CircularProgressIndicator.adaptive());
          } else if (state is CartLoaded) {
            final cartItems = state.cartItems;
            if (cartItems.isEmpty) {
              return const Center(child: Text('No items in your cart!'));
            }
            return SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(
                    height: MediaQuery.of(context).size.height * .61,
                    child: ListView.separated(
                      shrinkWrap: true,
                      // physics: const NeverScrollableScrollPhysics(),
                      itemCount: cartItems.length,
                      itemBuilder: (context, index) {
                        final cartItem = cartItems[index];
                        return CartItemWidget(cartItem: cartItem);
                      },
                      separatorBuilder: (context, index) {
                        return Divider(color: AppColors.grey2);
                      },
                    ),
                  ),
                  Container(
                    height: MediaQuery.of(context).size.height * .34,
                    padding: EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(color:  AppColors.grey.withOpacity(.2),width: .5),
                      color: AppColors.white,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.shade300,
                          blurRadius: 10,
                          spreadRadius: 2,
                        )
                      ]
                    ),
                    child: Column(
                      children: [
                        totalAndSubTotalWidget(title: "SubTotal", amount: state.subTotal),
                        SizedBox(height: 10,),
                        totalAndSubTotalWidget(title: "Shipping", amount: shippingValue),
                        SizedBox(height: 10,),
                       //TODO add dash here , reduce size of photo => done
                        Dash(
                          length: 300,
                          dashColor: AppColors.grey.withOpacity(.6),
                          dashThickness: 1.5,
                        ),
                        SizedBox(height: 10,),
                        totalAndSubTotalWidget(title: "Total Price", amount: state.subTotal+shippingValue),
                        SizedBox(height: 45,),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 15),
                          child: SizedBox(
                            width: double.infinity,
                            height: 48,
                            child: ElevatedButton(onPressed: (){}, style: ElevatedButton.styleFrom(
                              backgroundColor: AppColors.primaryColor,
                              foregroundColor: AppColors.white
                            ),child: Text("Checkout")),
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            );
          } else if (state is CartError) {
            return Center(child: Text(state.errorMsg));
          } else {
            return const Center(child: Text('Something went wrong!'));
          }
        },
      ),
    );
  }

  Widget totalAndSubTotalWidget({
    required String title,
    required double amount,
  }) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(title, style: TextStyle(color: AppColors.black, fontSize: 20)),
        Text(
          "\$${amount.toStringAsFixed(2)}",
          style: TextStyle(color: AppColors.black, fontSize: 20,fontWeight: FontWeight.normal),
        ),
      ],
    );
  }
}
