import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weds360/components/tab_card_view.dart';
import 'package:weds360/pages/home/view/home_provider.dart';

class TabsPagerView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final homeData = Provider.of<HomeProvider>(context);
    return Container(
      width: MediaQuery.of(context).size.width,
      child: ListView.builder(
          scrollDirection: Axis.vertical,
          itemCount: 5,
          itemBuilder: (context, index) {
            return TabCardView(
              imagePath: homeData.recomendedModelList[index].imagePath,
              title: homeData.recomendedModelList[index].title,
              description: homeData.recomendedModelList[index].descreption,
              onPressed: () {},
            );
          }),
    );
  }
}
//
