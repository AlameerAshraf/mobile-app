import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weds360/components/recomended_card_view.dart';
import 'package:weds360/pages/blog/view/blog_provider.dart';

class RecomenededListView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final homeData = Provider.of<BlogProvider>(context);

    return Container(
      height: 230.0,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 4,
        itemBuilder: (context, index) {
          return RecomendedCardView(
            imagePath: homeData.recomendedModelList[index].imagePath,
            title: homeData.recomendedModelList[index].title,
            description: homeData.recomendedModelList[index].descreption,
            onPressed: () {},
          );
        },
      ),
    );
  }
}
