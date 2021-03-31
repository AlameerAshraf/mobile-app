import 'package:flutter/material.dart';
import 'package:flutter_brand_icons/flutter_brand_icons.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:weds360/core/helpers/Constants.dart';
import 'package:weds360/pages/single_vendor/view/single_vendor_provider.dart';

class SliverBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<SingleVendorProvider>(
      builder: (context, value, child) => SliverList(
        delegate: SliverChildListDelegate(
          [
            Padding(
              padding:
                  const EdgeInsets.only(top: kPADDING * 2, left: kPADDING * 2),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.baseline,
                children: [
                  Expanded(
                    child: Text(
                      value.singleVendrorModel.title.toUpperCase(),
                      style: Theme.of(context).textTheme.headline1,
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.all(kPADDING),
                    padding: EdgeInsets.all(kPADDING),
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Theme.of(context).primaryColor,
                      ),
                      borderRadius: BorderRadius.all(
                        Radius.circular(ROUNDED * 2),
                      ),
                    ),
                    child: Text(
                      value.singleVendrorModel.category.toUpperCase(),
                      style: Theme.of(context).textTheme.headline2.copyWith(
                            letterSpacing: 5.0,
                            color: Theme.of(context).primaryColor,
                          ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  top: kPADDING,
                  left: kPADDING * 2,
                  right: kPADDING * 2,
                  bottom: kPADDING),
              child: Row(
                children: [
                  Icon(
                    Icons.location_on,
                    color: Colors.grey[600],
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width - (kPADDING * 7),
                    child: Text(
                      value.singleVendrorModel.address,
                      maxLines: 2,
                      style: Theme.of(context)
                          .textTheme
                          .subtitle2
                          .copyWith(fontSize: 15.0, color: Colors.grey[600]),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  left: kPADDING * 2,
                  right: kPADDING * 2,
                  bottom: kPADDING * 2),
              child: Row(
                children: [
                  RatingBarIndicator(
                    rating: 4.5,
                    itemBuilder: (context, index) => Icon(
                      Icons.star,
                      color: Colors.amber,
                    ),
                    itemCount: 5,
                    itemSize: 25.0,
                    direction: Axis.horizontal,
                  ),
                  SizedBox(
                    width: kPADDING,
                  ),
                  Text(
                    '(' +
                        value.singleVendrorModel.reviews.toString() +
                        ' reviews)',
                    style: Theme.of(context).textTheme.subtitle2,
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  left: kPADDING * 2,
                  right: kPADDING * 2,
                  bottom: kPADDING * 2),
              child: Row(
                children: [
                  FlatButton.icon(
                    shape: new RoundedRectangleBorder(
                        side: BorderSide(
                            color: FACEBOOKCOLOR,
                            width: 1,
                            style: BorderStyle.solid),
                        borderRadius: new BorderRadius.circular(30.0)),
                    onPressed: () {
                      value.launchURL(value.singleVendrorModel.facebookUrl);
                    },
                    icon: Icon(
                      FontAwesomeIcons.facebookF,
                      color: FACEBOOKCOLOR,
                    ),
                    label: Text('FACEBOOK',
                        style: Theme.of(context).textTheme.overline.copyWith(
                              color: FACEBOOKCOLOR,
                            )),
                  ),
                  SizedBox(
                    width: kPADDING,
                  ),
                  FlatButton.icon(
                    shape: new RoundedRectangleBorder(
                        side: BorderSide(
                            color: INSTAGRAMCOLOR,
                            width: 1,
                            style: BorderStyle.solid),
                        borderRadius: new BorderRadius.circular(30.0)),
                    onPressed: () {
                      value.launchURL(value.singleVendrorModel.instagramUrl);
                    },
                    icon: Icon(
                      FontAwesomeIcons.instagram,
                      color: INSTAGRAMCOLOR,
                    ),
                    label: Text('INSTAGRAM',
                        style: Theme.of(context).textTheme.overline.copyWith(
                              color: INSTAGRAMCOLOR,
                            )),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  left: kPADDING * 2,
                  right: kPADDING * 2,
                  bottom: kPADDING * 2),
              child: Text(
                value.singleVendrorModel.descreption,
                style: Theme.of(context).textTheme.subtitle2.copyWith(
                      fontSize: 15.0,
                    ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  left: kPADDING * 2,
                  right: kPADDING * 2,
                  bottom: kPADDING * 2),
              child: Text(
                'Reviews',
                style: Theme.of(context).textTheme.subtitle1,
              ),
            )
          ],
        ),
      ),
    );
  }
}
