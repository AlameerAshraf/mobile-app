import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:provider/provider.dart';
import 'package:weds360/components/filtter_chip_custem.dart';
import 'package:weds360/components/raised_button_costem.dart';
import 'package:weds360/core/helpers/Constants.dart';
import 'package:weds360/pages/vendors/view/vendors_provider.dart';

class FiltersheetView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 350,
      child: Consumer<VendorsProvuder>(
        builder: (context, value, child) => Padding(
          padding: const EdgeInsets.only(
              top: kPADDING * 4,
              left: kPADDING * 2,
              right: kPADDING * 2,
              bottom: kPADDING * 2),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Location',
                style: Theme.of(context)
                    .textTheme
                    .headline1
                    .copyWith(color: Colors.grey),
              ),
              Wrap(
                spacing: 8.0,
                children: value.locationList
                    .map((e) => FiltterChipCustem(
                        label: e.label,
                        selcted: e.isSelcted,
                        onSelcted: (selcted) {
                          value.onLocationChipChange(e);
                        }))
                    .toList()
                    .cast<Widget>(),
              ),
              Text(
                'Minimum Rate',
                style: Theme.of(context)
                    .textTheme
                    .headline1
                    .copyWith(color: Colors.grey),
              ),
              RatingBar.builder(
                initialRating: 3,
                minRating: 1,
                direction: Axis.horizontal,
                allowHalfRating: true,
                itemCount: 5,
                itemSize: 40,
                itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
                itemBuilder: (context, _) => Icon(
                  Icons.star,
                  color: Colors.amber,
                ),
                onRatingUpdate: (rating) {
                  print(rating);
                },
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  child: RaisedButtonCustem(
                    title: 'APPLY',
                    onPressed: () {},
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
