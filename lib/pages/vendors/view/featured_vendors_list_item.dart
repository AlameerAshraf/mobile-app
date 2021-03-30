import 'package:flutter/material.dart';
import 'package:weds360/components/rating_card.dart';
import 'package:weds360/core/helpers/Constants.dart';

class FeaturedVendorsListItem extends StatelessWidget {
  final String imagePath;
  final bool isFavorite;
  final String title;
  final Function favoriteOnPressed;
  final double rate;
  const FeaturedVendorsListItem({
    @required this.imagePath,
    @required this.isFavorite,
    @required this.favoriteOnPressed,
    @required this.title,
    @required this.rate,
  });
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Stack(
          children: [
            Container(
              margin: EdgeInsets.all(kPADDING),
              width: MediaQuery.of(context).size.width / 2.5,
              height: MediaQuery.of(context).size.width / 2.5,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(ROUNDED)),
                color: Colors.black,
                image: DecorationImage(
                  image: NetworkImage(imagePath),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Positioned(
              right: 5.0,
              top: 5.0,
              child: IconButton(
                icon: Icon(
                  isFavorite ? Icons.favorite : Icons.favorite_border,
                  size: 30,
                  color: Colors.red,
                ),
                onPressed: favoriteOnPressed,
              ),
            ),
          ],
        ),
        SizedBox(
          width: MediaQuery.of(context).size.width / 2.5,
          child: Padding(
            padding: const EdgeInsets.only(left: kPADDING * 2),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  title,
                  style: Theme.of(context).textTheme.headline2,
                ),
                RatingCard(rating: rate),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
