import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weds360/core/helpers/Constants.dart';
import 'package:weds360/pages/vendors/view/featured_vendors_list_item.dart';
import 'package:weds360/pages/vendors/view/vendors_provider.dart';

class FeaturedVendorsView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(kPADDING),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            'Featured Vendors',
            style: Theme.of(context).textTheme.headline1,
          ),
          Consumer<VendorsProvuder>(
            builder: (context, value, child) => Container(
              height: MediaQuery.of(context).size.width / 2.5 + 46,
              child: ListView.builder(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemCount: value.vendorsList.length,
                  itemBuilder: (context, index) {
                    return FeaturedVendorsListItem(
                      imagePath: value.vendorsList[index].imagePath,
                      isFavorite: value.vendorsList[index].isFavorite,
                      title: value.vendorsList[index].title,
                      rate: value.vendorsList[index].rate,
                      favoriteOnPressed: () {
                        value.onFavoriteClick(index);
                      },
                    );
                  }),
            ),
          )
        ],
      ),
    );
  }
}
