import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trendify/business_logic/home/home_cubit.dart';
import 'package:trendify/constants/app_colors.dart';
import 'package:trendify/view/widgets/home_tab_view.dart';
import 'package:trendify/view/widgets/category_tab_view.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;


  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }


  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) {
      final cubit = HomeCubit();
      cubit.getHomeData();
      return cubit;
    },
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            children: [
              const SizedBox(height: 10),
              TabBar(
                controller: _tabController,
                dividerHeight: 0.0,
                unselectedLabelColor: AppColors.grey,
                tabs: [
                  Tab(text: "Home"),
                  Tab(text: "Categories"),
                ],
              ),
              const SizedBox(height: 20),
              Expanded(
                child: TabBarView(
                  controller: _tabController,
                  children: [
                    HomeTabView(),
                    CategoryTabView()],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
