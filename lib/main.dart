import 'package:flutter/material.dart';
import 'package:trendify/constants/app_routers.dart';
import 'package:trendify/view/screens/custom_bottom_nav_bar.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      //color: Colors.white,
      title: ' Ecommerce App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: CustomBottomNavBar(),
      onGenerateRoute: AppRouters.onGenerateRoute,

    );
  }
}
