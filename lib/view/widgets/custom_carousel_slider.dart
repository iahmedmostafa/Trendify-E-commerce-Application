import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_carousel_widget/flutter_carousel_widget.dart';
import 'package:trendify/data/model/home_carousel_model.dart';

class CustomCarouselSlider extends StatelessWidget {
  const CustomCarouselSlider({super.key});

  @override
  Widget build(BuildContext context) {
    return FlutterCarousel.builder(
      itemCount: dummyHomeCarouselItems.length,
      itemBuilder: (BuildContext context, int itemIndex, int pageViewIndex) {
        return Padding(
          padding: EdgeInsetsGeometry.directional(end: 10),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(16.0),
            child: CachedNetworkImage(
              imageUrl: dummyHomeCarouselItems[itemIndex].imgUrl,
              fit: BoxFit.cover,
            ),
          ),
        );
      },
      options: FlutterCarouselOptions(
        height: 200.0,
        showIndicator: true,
        enlargeCenterPage: true,
        slideIndicator: CircularWaveSlideIndicator(
          slideIndicatorOptions: SlideIndicatorOptions(
            alignment: Alignment.bottomCenter,
            currentIndicatorColor: Colors.blueAccent,
            indicatorBackgroundColor: Colors.grey.withOpacity(0.3),
            indicatorBorderColor: Colors.grey.withOpacity(0.3),
            indicatorBorderWidth: 0,
            indicatorRadius: 6,
            itemSpacing: 20,
            enableAnimation: true,
          ),
        ),
        autoPlay: false,
        viewportFraction: .88,
      ),
    );
  }
}
