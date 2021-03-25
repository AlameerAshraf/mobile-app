import 'package:flutter/material.dart';
import 'package:weds360/core/helpers/Constants.dart';

class ProfileSectionHome extends StatelessWidget {
  final String imagePath;
  final String userName;
  final String partnerName;
  final String date;

  const ProfileSectionHome({
    this.imagePath = 'assets/images/userprofile.jpg',
    @required this.userName,
    @required this.partnerName,
    @required this.date,
  });
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          // decoration: BoxDecoration(
          //   borderRadius: BorderRadius.all(Radius.circular(ROUNDED)),
          //   color: Theme.of(context).primaryColor.withOpacity(0.2),
          //   image: new DecorationImage(
          //     fit: BoxFit.cover,
          //     colorFilter: ColorFilter.mode(
          //         Colors.black.withOpacity(0.2), BlendMode.dstATop),
          //     image: AssetImage(
          //       BACKGROUND,
          //     ),
          //   ),
          // ),
          width: MediaQuery.of(context).size.width,
          height: 150.0,
        ),
        Positioned(
            top: kPADDING,
            left: kPADDING,
            child: Text(
              '$userName and $partnerName \nwedding day 🎁',
              style: Theme.of(context).textTheme.headline1.copyWith(
                  fontSize: 40.0,
                  fontWeight: FontWeight.w700,
                  fontFamily: 'raleway'),
            )),
        Positioned(
          left: kPADDING,
          top: kPADDING * 14,
          child: RichText(
            text: TextSpan(
              children: [
                TextSpan(
                    text: '$date,',
                    style: Theme.of(context).textTheme.headline2.copyWith(
                          color: Theme.of(context).primaryColor,
                          fontWeight: FontWeight.bold,
                        )),
                TextSpan(
                  text: ' 6:00pm',
                  style: Theme.of(context).textTheme.headline2.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
