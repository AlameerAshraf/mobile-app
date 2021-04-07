import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:weds360/components/cirlce_avtar_list.views.dart';
import 'package:weds360/core/helpers/Constants.dart';
import 'package:weds360/pages/single_blog/view/single_blog_screen.dart';

class HeaderBlogView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, SingleBlogScreen.id);
      },
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(ROUNDED),
        ),
        child: Container(
            width: MediaQuery.of(context).size.width,
            height: 350.0,
            child: Padding(
              padding: const EdgeInsets.all(kPADDING),
              child: Column(
                children: [
                  Expanded(
                    flex: 7,
                    child: CachedNetworkImage(
                      imageUrl:
                          'https://image.freepik.com/free-photo/elegant-wedding-couple_1157-18560.jpg',
                      fit: BoxFit.cover,
                      imageBuilder: (context, imageProvider) => Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(ROUNDED),
                          image: DecorationImage(
                            image: imageProvider,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
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
                    ),
                  ),
                  Expanded(
                    flex: 3,
                    child: Container(
                      margin: EdgeInsets.all(kPADDING),
                      child: Row(
                        children: [
                          Expanded(
                              flex: 6,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Napa Valey',
                                    style: Theme.of(context)
                                        .textTheme
                                        .headline1
                                        .copyWith(
                                          fontWeight: FontWeight.bold,
                                          color: Theme.of(context).primaryColor,
                                        ),
                                  ),
                                  Text(
                                    'Vestibulum ac est lacinia nisi venenatis tristique. Fusce congue, diam id ornare imperdiet, sapien urna pretium nisl, ut volutpat sapien arcu sed augue. Aliquam erat volutpat.\n\nIn congue. Etiam justo. Etiam pretium iaculis justo.\n\nIn hac habitasse platea dictumst. Etiam faucibus cursus urna. Ut tellus.',
                                    overflow: TextOverflow.ellipsis,
                                    maxLines: 3,
                                    style: Theme.of(context)
                                        .textTheme
                                        .subtitle2
                                        .copyWith(
                                          fontWeight: FontWeight.w300,
                                          color: Theme.of(context).accentColor,
                                        ),
                                  ),
                                ],
                              )),
                          Expanded(
                              flex: 4,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  CircleAvatarListViews([
                                    'https://image.freepik.com/free-photo/cheerful-curly-business-girl-wearing-glasses_176420-206.jpg',
                                    'https://image.freepik.com/free-photo/cheerful-middle-aged-woman-with-curly-hair_1262-20859.jpg',
                                    'https://image.freepik.com/free-photo/cheerful-teenager-with-toothy-smile-afro-hairstyle-holds-modern-cell-phone-chats-online-with-boyfriend_273609-30470.jpg',
                                    'https://image.freepik.com/free-photo/close-up-young-attractive-charismatic-woman-isolated_273609-35349.jpg',
                                    'https://image.freepik.com/free-photo/cheerful-curly-business-girl-wearing-glasses_176420-206.jpg',
                                    'https://image.freepik.com/free-photo/cheerful-middle-aged-woman-with-curly-hair_1262-20859.jpg',
                                    'https://image.freepik.com/free-photo/cheerful-teenager-with-toothy-smile-afro-hairstyle-holds-modern-cell-phone-chats-online-with-boyfriend_273609-30470.jpg',
                                    'https://image.freepik.com/free-photo/close-up-young-attractive-charismatic-woman-isolated_273609-35349.jpg',
                                  ]),
                                  RatingBarIndicator(
                                    rating: 4.5,
                                    itemBuilder: (context, index) => Icon(
                                      Icons.star,
                                      color: Colors.amber,
                                    ),
                                    itemCount: 5,
                                    itemSize: 20.0,
                                    direction: Axis.horizontal,
                                  ),
                                  Text(
                                    '100+ Reviews',
                                    style: Theme.of(context)
                                        .textTheme
                                        .headline3
                                        .copyWith(
                                          fontFamily: 'raleway',
                                          fontSize: 15.0,
                                        ),
                                  ),
                                ],
                              )),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            )),
      ),
    );
  }
}
