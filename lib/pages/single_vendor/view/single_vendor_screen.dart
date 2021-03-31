import 'package:carousel_slider/carousel_options.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_brand_icons/flutter_brand_icons.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:provider/provider.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:weds360/components/raised_button_costem.dart';
import 'package:weds360/core/helpers/Constants.dart';
import 'package:weds360/pages/single_vendor/view/review_item.dart';
import 'package:weds360/pages/single_vendor/view/single_vendor_provider.dart';
import 'package:weds360/pages/single_vendor/view/sliverAppbarimages.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:weds360/pages/single_vendor/view/sliver_body.dart';

class SingleVendorScreen extends StatefulWidget {
  static const String id = 'SingleVendor';
  @override
  _SingleVendorScreenState createState() => _SingleVendorScreenState();
}

class _SingleVendorScreenState extends State<SingleVendorScreen> {
  @override
  Widget build(BuildContext context) {
    final data = Provider.of<SingleVendorProvider>(context);
    return Scaffold(
        body: CustomScrollView(
          slivers: [
            SliverAppbarImages(),
            SliverBody(),
            SliverList(
              delegate: SliverChildBuilderDelegate(
                (context, index) {
                  return Reviewitem(
                    imagePath:
                        data.singleVendrorModel.reviewsList[index].imagePath,
                    name: data.singleVendrorModel.reviewsList[index].name,
                    rate: data.singleVendrorModel.reviewsList[index].rate,
                    content: data.singleVendrorModel.reviewsList[index].content,
                  );
                },
                childCount: data.singleVendrorModel.reviewsList.length,
              ),
            )
          ],
        ),
        floatingActionButton: SpeedDial(
          icon: Icons.call,
          backgroundColor: Theme.of(context).primaryColor,
          activeIcon: Icons.remove,
          children: [
            SpeedDialChild(
              child: Icon(Icons.call),
              backgroundColor: Theme.of(context).accentColor,
              onTap: () {
                data.launchURL('tel:' + data.singleVendrorModel.phone);
              },
            ),
            SpeedDialChild(
              child: Icon(Icons.message),
              onTap: () {},
              backgroundColor: Theme.of(context).accentColor,
            ),
          ],
        ));
  }
}
// IconButton(
//                         icon: Icon(
//                           BrandIcons.facebook,
//                           color: Theme.of(context).primaryColor,
//                         ),
//                         onPressed: () {
//                           value.launchURL(
//                               value.singleVendrorModel.facebookUrl);
//                         }),
//                     IconButton(
//                         icon: Icon(
//                           BrandIcons.instagram,
//                           color: Theme.of(context).primaryColor,
//                         ),
//                         onPressed: () {
//                           value.launchURL(
//                               value.singleVendrorModel.instagramUrl);
//                         // }),
// ListView.separated(
//                 physics: NeverScrollableScrollPhysics(),
//                 itemBuilder: (context, index) {
//                   return Container(
//                     height: 100.0,
//                     color: Colors.amber,
//                   );
//                 },
//                 separatorBuilder: (context, index) {
//                   return Divider();
//                 },
//                 itemCount: 10),
