import 'package:carousel_slider/carousel_options.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:share/share.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:weds360/pages/single_vendor/view/single_vendor_provider.dart';

class SliverAppbarImages extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final data = Provider.of<SingleVendorProvider>(context);
    return SliverAppBar(
      pinned: true,
      floating: true,
      expandedHeight: MediaQuery.of(context).size.height * 0.55,
      stretch: true,
      centerTitle: true,
      title: Text(data.singleVendrorModel.title),
      actions: [
        IconButton(
          icon: Icon(
            data.singleVendrorModel.isFavorite
                ? Icons.favorite
                : Icons.favorite_border,
            size: 30,
            color:
                data.singleVendrorModel.isFavorite ? Colors.red : Colors.black,
          ),
          onPressed: () {
            data.onFavoriteClick();
          },
        ),
        IconButton(
          icon: Icon(
            Icons.share,
            size: 30,
            color: Colors.black,
          ),
          onPressed: () {
            Share.share('check out my website https://example.com',
                subject: 'Look what I made!');
          },
        ),
      ],
      flexibleSpace: FlexibleSpaceBar(
        background: Consumer<SingleVendorProvider>(
          builder: (context, value, child) =>
              Stack(alignment: Alignment.bottomRight, children: [
            CarouselSlider.builder(
              itemCount: value.singleVendrorModel.imageUrls.length,
              itemBuilder: (context, index, _) {
                return index == 0
                    ? Hero(
                        tag: value.singleVendrorModel.imageUrls.first,
                        child: Image.network(
                          value.singleVendrorModel.imageUrls[index],
                          fit: BoxFit.cover,
                          loadingBuilder: (context, child, progress) {
                            return progress == null
                                ? child
                                : LinearProgressIndicator();
                          },
                        ),
                      )
                    : Image.network(
                        value.singleVendrorModel.imageUrls[index],
                        fit: BoxFit.cover,
                        loadingBuilder: (context, child, progress) {
                          return progress == null
                              ? child
                              : LinearProgressIndicator();
                        },
                      );
              },
              options: CarouselOptions(
                  height: MediaQuery.of(context).size.height,
                  initialPage: 0,
                  enableInfiniteScroll: true,
                  viewportFraction: 1,
                  onPageChanged: (index, reason) {
                    value.onSliderpageChange(index);
                  }),
            ),
            Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20.0, vertical: 8.0),
                child: AnimatedSmoothIndicator(
                  activeIndex: value.activeimageSlider,
                  count: value.singleVendrorModel.imageUrls.length,
                  duration: Duration(milliseconds: 500),
                  effect: ExpandingDotsEffect(
                      expansionFactor: 3,
                      activeDotColor: Theme.of(context).primaryColor,
                      dotWidth: 10.0,
                      dotHeight: 10.0),
                )),
          ]),
        ),
      ),
    );
  }
}
