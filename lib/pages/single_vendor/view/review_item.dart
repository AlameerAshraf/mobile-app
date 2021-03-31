import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:weds360/core/helpers/Constants.dart';

class Reviewitem extends StatelessWidget {
  final String imagePath;
  final String name;
  final double rate;
  final String content;

  const Reviewitem({
    this.imagePath,
    this.name,
    this.rate,
    this.content,
  });
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: kPADDING * 2),
      child: Column(
        children: [
          Divider(
            indent: 30.0,
            endIndent: 30.0,
            color: Colors.grey,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 30, right: 30),
            child: Row(
              children: [
                Container(
                  margin: EdgeInsets.only(right: kPADDING, top: kPADDING),
                  width: 50,
                  height: 50,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                        image: AssetImage(imagePath),
                        fit: BoxFit.cover,
                        alignment: Alignment.center),
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      name,
                      style: Theme.of(context).textTheme.headline2,
                    ),
                    RatingBarIndicator(
                      rating: rate,
                      itemBuilder: (context, index) => Icon(
                        Icons.star,
                        color: Colors.amber,
                      ),
                      itemCount: 5,
                      itemSize: 15.0,
                      direction: Axis.horizontal,
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width - 120,
                      child: Text(
                        content,
                        style: Theme.of(context).textTheme.subtitle2,
                      ),
                    )
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
