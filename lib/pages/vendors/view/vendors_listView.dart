import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weds360/components/rating_card.dart';
import 'package:weds360/core/helpers/Constants.dart';
import 'package:weds360/pages/vendors/view/vendors_provider.dart';

class VendorListView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<VendorsProvuder>(
      builder: (context, value, child) => Padding(
        padding: const EdgeInsets.all(kPADDING * 2),
        child: GridView.builder(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 9 / 14,
            crossAxisSpacing: kPADDING * 2,
            mainAxisSpacing: kPADDING * 2,
          ),
          itemCount: value.vendorsList.length,
          itemBuilder: (context, index) {
            return Stack(
              children: [
                AspectRatio(
                  aspectRatio: 9 / 14,
                  child: Image.network(
                    value.vendorsList[index].imagePath,
                    fit: BoxFit.cover,
                  ),
                ),
                Align(
                  alignment: Alignment.topRight,
                  child: IconButton(
                    icon: Icon(
                      value.vendorsList[index].isFavorite
                          ? Icons.favorite
                          : Icons.favorite_border,
                      size: 30,
                      color: Colors.red,
                    ),
                    onPressed: () {
                      value.onFavoriteClick(index);
                    },
                  ),
                ),
                Positioned(
                    top: 8.0,
                    left: 8.0,
                    child: RatingCard(rating: value.vendorsList[index].rate)),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Container(
                    height: 40.0,
                    width: MediaQuery.of(context).size.width,
                    decoration: new BoxDecoration(
                      color: Theme.of(context).scaffoldBackgroundColor,
                      borderRadius: new BorderRadius.only(
                        topLeft: const Radius.circular(ROUNDED),
                        topRight: const Radius.circular(ROUNDED),
                      ),
                    ),
                    child: Center(
                        child: Text(
                      value.vendorsList[index].title,
                      style: Theme.of(context).textTheme.headline1,
                    )),
                  ),
                )
              ],
            );
          },
        ),
      ),
    );
  }
}
