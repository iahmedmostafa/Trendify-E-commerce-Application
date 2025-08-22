import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:trendify/constants/app_constants.dart';
import 'package:trendify/constants/app_colors.dart';
import 'package:trendify/view/widgets/home_tab_view.dart';
import 'package:trendify/view/widgets/category_tab_view.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with SingleTickerProviderStateMixin {
  late TabController _tabController;


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
  void initState() {
    super.initState();
    _tabController=TabController(length: 2, vsync: this);
  }


  @override
  Widget build(BuildContext context) {

    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            children: [
              tobBarHome(context),
              const SizedBox(height: 20),
              TabBar(
                  controller: _tabController,
                  dividerHeight: 0.0,
                  unselectedLabelColor:AppColors.grey,
                  tabs: [
                    Tab(
                      text: "Home",
                    ),
                    Tab(
                      text: "Categories",
                    ),
                  ]),
              const SizedBox(height: 20),
               Expanded(
                 child: TabBarView(
                     controller: _tabController,
                     children: [
                   HomeTabView(),
                   CategoryTabView(),
                 ]),
               )

            ],
          ),
        ),
      ),
    );
  }
}
