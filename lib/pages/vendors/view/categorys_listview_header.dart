import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:weds360/pages/categorys/view/categorys_provider.dart';
import 'package:weds360/pages/vendors/view/category_list_item.dart';

class CategorysListViewHeader extends StatefulWidget {
  @override
  _CategorysListViewHeaderState createState() =>
      _CategorysListViewHeaderState();
}

class _CategorysListViewHeaderState extends State<CategorysListViewHeader> {
  @override
  Widget build(BuildContext context) {
    return Consumer<CategorysProvider>(
      builder: (context, category, _) {
        return Container(
          height: 100.0,
          width: MediaQuery.of(context).size.width,
          child: ListView.builder(
            physics: ScrollPhysics(),
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            itemCount: category.vendorsCategorys.length,
            itemBuilder: (context, index) {
              return CategoryListItem(
                onPressed: () {
                  category.onSwapPressed(
                      context, category.vendorsCategorys[index]);
                },
                image: category.vendorsCategorys[index].imagePath,
                icon: category.vendorsCategorys[index].icon,
                title: category.vendorsCategorys[index].title,
              );
            },
          ),
        );
      },
    );
  }
}
