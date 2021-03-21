import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weds360/components/tab_card_view.dart';
import 'package:weds360/pages/blog/view/blog_provider.dart';

class TabsPagerView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final homeData = Provider.of<BlogProvider>(context);
    return ListView.builder(
        physics: ScrollPhysics(),
        itemCount: 5,
        itemBuilder: (context, index) {
          return TabCardView(
            imagePath: homeData.recomendedModelList[index].imagePath,
            title: homeData.recomendedModelList[index].title,
            description: homeData.recomendedModelList[index].descreption,
            onPressed: () {},
          );
        });
  }
}
//
