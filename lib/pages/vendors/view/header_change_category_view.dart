import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weds360/pages/categorys/view/categorys_provider.dart';
import 'package:weds360/pages/vendors/view/categorys_listview_header.dart';

class HeaderChangeCategoryView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final categoryData = Provider.of<CategorysProvider>(context);

    return Stack(
      children: [
        Container(
          width: MediaQuery.of(context).size.width,
          height: 160.0,
        ),
        Container(
          width: MediaQuery.of(context).size.width,
          height: 110.0,
          color: Theme.of(context).primaryColor,
        ),
        Positioned(
          bottom: 0,
          child: CategorysListViewHeader(),
        )
      ],
    );
  }
}
