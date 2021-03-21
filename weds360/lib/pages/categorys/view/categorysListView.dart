import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:weds360/core/helpers/Constants.dart';
import 'package:weds360/pages/categorys/models/categorys_model.dart';
import 'package:weds360/pages/categorys/view/categorys_provider.dart';

class CategorysListView extends StatelessWidget {
  const CategorysListView({
    Key key,
    @required this.categorys,
  }) : super(key: key);

  final List<CategorysModel> categorys;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Padding(
        padding: const EdgeInsets.all(kPADDING * 2),
        child: GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 1,
                childAspectRatio: 3 / 2,
                crossAxisSpacing: kPADDING * 2,
                mainAxisSpacing: kPADDING * 2),
            itemCount: categorys.length,
            itemBuilder: (BuildContext ctx, index) {
              return Stack(
                children: [
                  CachedNetworkImage(
                    imageUrl: categorys[index].imagePath,
                    imageBuilder: (context, imageProvider) => Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(ROUNDED),
                        image: DecorationImage(
                            image: imageProvider, fit: BoxFit.cover),
                      ),
                    ),
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
                  ),
                  Center(
                    child: Text(
                      categorys[index].title,
                      style: Theme.of(context).textTheme.headline1.copyWith(
                        color: Theme.of(context).scaffoldBackgroundColor,
                        shadows: [
                          Shadow(
                            blurRadius: 10.0,
                            color: Theme.of(context).accentColor,
                            offset: Offset(5.0, 5.0),
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              );
            }),
      ),
    );
  }
}
