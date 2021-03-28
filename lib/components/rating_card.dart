import 'package:flutter/material.dart';

class RatingCard extends StatelessWidget {
  final double rating;

  RatingCard({
    @required this.rating,
  });
  Color getColor(double rating) {
    if (rating >= 0 && rating <= 1) {
      return Colors.red[900];
    } else if (rating > 1 && rating <= 2) {
      return Colors.red[400];
    } else if (rating > 2 && rating <= 3) {
      return Colors.yellow[900];
    } else if (rating > 3 && rating <= 4) {
      return Colors.yellow[400];
    } else if (rating > 4 && rating <= 5) {
      return Colors.green[700];
    }
    return Colors.green[700];
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 60.0,
      height: 30.0,
      decoration: BoxDecoration(
          color: getColor(rating),
          borderRadius: BorderRadius.all(Radius.circular(20))),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Icon(
            Icons.star_border,
          ),
          Text(
            rating.toString(),
            textAlign: TextAlign.justify,
            style: Theme.of(context).textTheme.caption.copyWith(
                  color: Theme.of(context).accentColor,
                  fontWeight: FontWeight.bold,
                  fontSize: 15.0,
                ),
          ),
        ],
      ),
    );
  }
}
