import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent_bottom_nav_bar_v2.dart';
import 'package:trendify/business_logic/cart/cart_cubit.dart';
import 'package:trendify/business_logic/home/home_cubit.dart';
import 'package:trendify/constants/app_colors.dart';
import 'package:trendify/constants/app_constants.dart';
import 'package:trendify/view/screens/cart_screen.dart';
import 'package:trendify/view/screens/favourite_screen.dart';
import 'package:trendify/view/screens/home_screen.dart';
import 'package:trendify/view/screens/profile_screen.dart';

class CustomBottomNavBar extends StatefulWidget {
  const CustomBottomNavBar({super.key});

  @override
  State<CustomBottomNavBar> createState() => _CustomBottomNavBarState();
}

class _CustomBottomNavBarState extends State<CustomBottomNavBar> {
  PersistentTabController? controller;
  int currentIndex=0;

  @override
  void initState() {
    super.initState();
    controller = PersistentTabController();
  }
@override
  void dispose() {
    super.dispose();
    controller!.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.white,
        leading: Padding(
          padding: const EdgeInsets.only(left: 10),
          child: CircleAvatar(
            radius: 30,
            backgroundImage: AssetImage(AppConstants.myPhoto),
          ),
        ),
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Ahmed Mostafa",
              style: Theme.of(context).textTheme.titleMedium,
            ),
            Text(
              "Let's go shopping ",
              style: Theme.of(context).textTheme.titleSmall!.copyWith(
                color: Colors.grey,
                fontSize: 12,
              ),
            ),
          ],
        ),
        actions: [
          if(currentIndex==0)...[
            IconButton(
              onPressed: () {},
              icon: Icon(CupertinoIcons.search, size: 20),
            ),
            IconButton(
              onPressed: () {},
              icon: Icon(CupertinoIcons.bell, size: 20),
            ),
          ],
          if(currentIndex==1)
            IconButton(
              onPressed: () {},
              icon: Icon(CupertinoIcons.bag, size: 20),
            ),
          if(currentIndex==2)
            IconButton(
              onPressed: () {},
              icon: Icon(CupertinoIcons.heart, size: 20),
            ),
          if(currentIndex==3)
            IconButton(
              onPressed: () {},
              icon: Icon(CupertinoIcons.person_alt_circle, size: 20),
            ),

        ],
      ),
      extendBodyBehindAppBar:true,
      body: PersistentTabView(
        onTabChanged: (index){
          setState(() {
            currentIndex=index;
          });
        },
        controller: controller,
        tabs: [
          PersistentTabConfig(
            screen: HomeScreen(),
            item: ItemConfig(icon: Icon(CupertinoIcons.home), title: "Home",activeForegroundColor:AppColors.primaryColor),
          ),
          PersistentTabConfig(
            screen: CartScreen(),
            item: ItemConfig(icon: Icon(CupertinoIcons.cart), title: "Cart",activeForegroundColor:AppColors.primaryColor),
          ),
          PersistentTabConfig(
            screen: FavouriteScreen(),
            item: ItemConfig(
              icon: Icon(CupertinoIcons.heart),
              title: "Favourite",
                activeForegroundColor:AppColors.primaryColor
            ),
          ),
          PersistentTabConfig(
            screen: ProfileScreen(),
            item: ItemConfig(
              icon: Icon(CupertinoIcons.profile_circled),
              title: "Profile"
                ,activeForegroundColor:AppColors.primaryColor
            ),
          ),
        ],
        navBarBuilder: (navBarConfig) =>
            Style6BottomNavBar(navBarConfig: navBarConfig),
        handleAndroidBackButtonPress: true,
        resizeToAvoidBottomInset: true,
        screenTransitionAnimation: const ScreenTransitionAnimation(
          duration: Duration(milliseconds: 200),
          curve: Curves.ease,
        ),
        stateManagement: false,
      ),
    );
  }
}
