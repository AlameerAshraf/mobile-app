import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:weds360/core/helpers/Constants.dart';

import 'package:weds360/pages/categorys/view/categorys_provider.dart';

class CategorysListView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final categoryData = Provider.of<CategorysProvider>(context);
    return Padding(
      padding: const EdgeInsets.all(kPADDING * 2),
      child: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 1,
              childAspectRatio: 3 / 2,
              crossAxisSpacing: kPADDING * 2,
              mainAxisSpacing: kPADDING * 2),
          itemCount: categoryData.selctedList().length,
          itemBuilder: (BuildContext ctx, index) {
            return InkWell(
              onTap: () {
                categoryData.onPressed(
                    context, categoryData.selctedList()[index]);
              },
              child: Hero(
                tag: categoryData.selctedList()[index].title,
                child: Stack(
                  children: [
                    CachedNetworkImage(
                      imageUrl: categoryData.selctedList()[index].imagePath,
                      imageBuilder: (context, imageProvider) => Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(ROUNDED),
                          color: Colors.black,
                          image: DecorationImage(
                              colorFilter: ColorFilter.mode(
                                  Colors.black.withOpacity(0.3),
                                  BlendMode.dstATop),
                              image: imageProvider,
                              fit: BoxFit.cover),
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
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            categoryData.selctedList()[index].icon,
                            size: 40.0,
                            color: Theme.of(context).scaffoldBackgroundColor,
                          ),
                          Text(
                            categoryData.selctedList()[index].title,
                            style:
                                Theme.of(context).textTheme.headline1.copyWith(
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
                        ],
                      ),
                    )
                  ],
                ),
              ),
            );
          }),
    );
  }
}
