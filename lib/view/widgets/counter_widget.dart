import 'package:flutter/material.dart';
import 'package:trendify/constants/app_colors.dart';

class CounterWidget extends StatelessWidget {
  final int value;
  final dynamic cubit;
  final int productId;
  final int? initialValue;
  const CounterWidget({
    super.key,
    required this.value,
    required this.productId,
    required this.cubit,
    this.initialValue,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: AppColors.grey2,
      ),
      child: Row(
        children: [
          IconButton(
            onPressed: () =>initialValue!=null?cubit.decrementCounter(productId,initialValue):cubit.decrementCounter(productId),
            icon: Icon(Icons.remove_circle_outline),
            color: AppColors.black,
          ),
          Text(value.toString(), style: TextStyle(fontSize: 14)),
          IconButton(
            onPressed: () =>initialValue!=null?cubit.incrementCounter(productId,initialValue):cubit.incrementCounter(productId),
            icon: Icon(Icons.add_circle_rounded),
          ),
        ],
      ),
    );
  }
}
