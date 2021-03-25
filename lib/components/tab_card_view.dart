import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:weds360/components/cirlce_avtar_list.views.dart';

import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:weds360/core/helpers/Constants.dart';

class TabCardView extends StatelessWidget {
  final String imagePath;
  final String title;
  final String description;
  final Function onPressed;

  const TabCardView({
    @required this.imagePath,
    @required this.title,
    @required this.description,
    @required this.onPressed,
  });
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Card(
        margin: EdgeInsets.all(8.0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),
        borderOnForeground: true,
        elevation: 2.0,
        child: Container(
          width: 270.0,
          height: 121.0,
          padding: EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Expanded(
                flex: 1,
                child: ClipRRect(
                    borderRadius: BorderRadius.all(
                      Radius.circular(8.0),
                    ),
                    child: CachedNetworkImage(
                      imageUrl: imagePath,
                      width: 109.0,
                      height: 109.0,
                      fit: BoxFit.cover,
                      progressIndicatorBuilder:
                          (context, url, downloadProgress) => Center(
                        child: Center(
                          child: SizedBox(
                            width: 50.0,
                            height: 50.0,
                            child: CircularProgressIndicator(
                                value: downloadProgress.progress),
                          ),
                        ),
                      ),
                      errorWidget: (context, url, error) => Icon(Icons.error),
                    )),
              ),
              Expanded(
                flex: 2,
                child: Padding(
                  padding: const EdgeInsets.only(
                      top: kPADDING, right: kPADDING, left: kPADDING),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text(
                        title,
                        style: Theme.of(context).textTheme.headline3,
                      ),
                      Expanded(
                        child: Text(
                          description,
                          style: Theme.of(context).textTheme.bodyText1,
                          overflow: TextOverflow.ellipsis,
                          maxLines: 3,
                        ),
                      ),
                      Align(
                        alignment: Alignment.bottomRight,
                        child: Column(
                          children: [
                            CircleAvatarListViews([
                              'https://image.freepik.com/free-photo/cheerful-curly-business-girl-wearing-glasses_176420-206.jpg',
                              'https://image.freepik.com/free-photo/cheerful-middle-aged-woman-with-curly-hair_1262-20859.jpg',
                              'https://image.freepik.com/free-photo/cheerful-teenager-with-toothy-smile-afro-hairstyle-holds-modern-cell-phone-chats-online-with-boyfriend_273609-30470.jpg',
                              'https://image.freepik.com/free-photo/close-up-young-attractive-charismatic-woman-isolated_273609-35349.jpg'
                            ]),
                            RatingBarIndicator(
                              rating: 4.2,
                              itemBuilder: (context, index) => Icon(
                                Icons.star,
                                color: Colors.amber,
                              ),
                              itemCount: 5,
                              itemSize: 10.0,
                              direction: Axis.horizontal,
                            ),
                            Text(
                              '100+ Reviews',
                              style: Theme.of(context)
                                  .textTheme
                                  .headline3
                                  .copyWith(
                                    fontFamily: 'raleway',
                                    fontSize: 10.0,
                                  ),
                            ),
                          ],
                        ),
                      ),
                    ],
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
