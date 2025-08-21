import 'package:flutter/cupertino.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent_bottom_nav_bar_v2.dart';
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
  @override
  void initState() {
    super.initState();
    controller= PersistentTabController();
  }

  @override
  Widget build(BuildContext context) {
    return PersistentTabView(
      controller:controller ,

      tabs: [
        PersistentTabConfig(
          screen: HomeScreen(),
          item: ItemConfig(icon: Icon(CupertinoIcons.home), title: "Home"),
        ),
        PersistentTabConfig(
          screen: CartScreen(),
          item: ItemConfig(icon: Icon(CupertinoIcons.cart), title: "Cart"),
        ),
        PersistentTabConfig(
          screen: FavouriteScreen(),
          item: ItemConfig(
            icon: Icon(CupertinoIcons.heart),
            title: "Favourite",
          ),
        ),
        PersistentTabConfig(
          screen: ProfileScreen(),
          item: ItemConfig(
            icon: Icon(CupertinoIcons.profile_circled),
            title: "Profile",
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
      stateManagement: true,

    );
  }
}
