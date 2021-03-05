import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:weds360/core/helpers/app_localizations.dart';

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
        borderOnForeground: true,
        elevation: 2.0,
        child: Container(
          width: 334.0,
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
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text(
                        title,
                        style: Theme.of(context).textTheme.headline3,
                      ),
                      Text(
                        description,
                        style: Theme.of(context).textTheme.bodyText1,
                        maxLines: 4,
                      ),
                      Align(
                        alignment: Alignment.bottomRight,
                        child: InkWell(
                            onTap: onPressed,
                            child: Text(
                              AppLocalizations.of(context)
                                  .translate('recomended_componant_Button'),
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyText1
                                  .copyWith(fontWeight: FontWeight.bold),
                            )),
                      )
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
