import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:provider/provider.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:weds360/pages/vendors/view/vendors_provider.dart';

class CarsualbannerView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<VendorsProvuder>(
      builder: (context, value, child) => Stack(
        children: [
          CarouselSlider.builder(
            itemCount: value.carsualiamges.length,
            itemBuilder: (context, index, _) {
              return Image.network(
                value.carsualiamges[index],
                width: MediaQuery.of(context).size.width,
                fit: BoxFit.cover,
              );
            },
            options: CarouselOptions(
                // height: 200.0,
                autoPlay: true,
                viewportFraction: 1,
                onPageChanged: (index, _) {
                  value.onSliderpageChange(index);
                }),
          ),
          Positioned(
            bottom: 20,
            right: 20.0,
            child: AnimatedSmoothIndicator(
              activeIndex: value.activeimageSlider,
              count: value.carsualiamges.length,
              duration: Duration(milliseconds: 500),
              effect: ExpandingDotsEffect(
                  expansionFactor: 3,
                  activeDotColor: Theme.of(context).primaryColor,
                  dotColor: Theme.of(context).scaffoldBackgroundColor,
                  dotWidth: 10.0,
                  dotHeight: 4.0),
            ),
          ),
        ],
      ),
    );
  }
}
