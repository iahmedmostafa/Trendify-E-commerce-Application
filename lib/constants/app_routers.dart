import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trendify/business_logic/product_details_logic/product_details_cubit.dart';
import 'package:trendify/constants/app_routes.dart';
import 'package:trendify/view/screens/cart_screen.dart';
import 'package:trendify/view/screens/custom_bottom_nav_bar.dart';
import 'package:trendify/view/screens/product_details_page.dart';

class AppRouters {
  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case AppRoutes.home:
        {
          return MaterialPageRoute(builder: (_) => CustomBottomNavBar());
        }
      case AppRoutes.productDetailsScreen:
        {
          final int productId = settings.arguments as int;
          return MaterialPageRoute(
            builder: (_) => BlocProvider(
              create: (context) {
                final cubit=ProductDetailsCubit();
                cubit.getProductDetails(productId);
                return cubit;
              },
              child: ProductDetailsPage(productId: productId),
            ),
          );
        }
      // case AppRoutes.cartScreen:
      //   {
      //    final int productId = settings.arguments as int;
      //     return MaterialPageRoute(
      //       builder: (_) => CartScreen(productId: productId,),
      //     );
      //   }
      default:
        {
          return MaterialPageRoute(
            builder: (_) => Scaffold(body: Center(child: Text("No page"))),
          );
        }
    }
  }
}
