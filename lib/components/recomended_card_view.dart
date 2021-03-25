import 'package:flutter/material.dart';
import 'package:weds360/core/helpers/app_localizations.dart';
import 'package:cached_network_image/cached_network_image.dart';

class RecomendedCardView extends StatefulWidget {
  final String imagePath;
  final String title;
  final String description;
  final Function onPressed;

  const RecomendedCardView({
    @required this.imagePath,
    @required this.title,
    @required this.description,
    @required this.onPressed,
  });

  @override
  _RecomendedCardViewState createState() => _RecomendedCardViewState();
}

class _RecomendedCardViewState extends State<RecomendedCardView> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.onPressed,
      child: Card(
        borderOnForeground: false,
        child: Container(
          width: MediaQuery.of(context).size.width / 2.5,
          height: 230.0,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(8.0),
                    topRight: Radius.circular(8.0),
                  ),
                  child: CachedNetworkImage(
                    imageUrl: widget.imagePath,
                    width: 180,
                    height: 100.0,
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
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  widget.title,
                  style: Theme.of(context).textTheme.headline3,
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(left: 8.0, right: 8.0),
                  child: Text(
                    widget.description,
                    style: Theme.of(context).textTheme.overline,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 4,
                  ),
                ),
              ),
              Align(
                alignment: Alignment.bottomRight,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: InkWell(
                      onTap: widget.onPressed,
                      child: Text(
                        AppLocalizations.of(context)
                            .translate('recomended_componant_Button'),
                        style: Theme.of(context)
                            .textTheme
                            .bodyText1
                            .copyWith(fontWeight: FontWeight.bold),
                      )),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
