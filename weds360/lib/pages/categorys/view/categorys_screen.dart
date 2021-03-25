import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:weds360/core/helpers/Constants.dart';
import 'package:weds360/pages/blog/view/tabs_pager_view.dart';
import 'package:weds360/pages/categorys/view/categorysListView.dart';
import 'package:weds360/pages/categorys/view/categorys_provider.dart';

class CategorysScreen extends StatefulWidget {
  static const String id = 'Categorys';

  @override
  _CategorysScreenState createState() => _CategorysScreenState();
}

class _CategorysScreenState extends State<CategorysScreen>
    with SingleTickerProviderStateMixin {
  TabController tabController;
  @override
  void initState() {
    tabController = new TabController(length: 3, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final categoryData = Provider.of<CategorysProvider>(context);
    return Column(
      children: [
        TabBar(
            controller: tabController,
            labelColor: Theme.of(context).primaryColor,
            unselectedLabelColor: Colors.grey,
            indicatorColor: Theme.of(context).primaryColor,
            isScrollable: true,
            labelStyle: Theme.of(context).textTheme.headline1,
            tabs: [
              Tab(
                text: "For Her",
              ),
              Tab(
                text: "For Him",
              ),
              Tab(
                text: "For Wedding",
              ),
            ]),
        Expanded(
          child: TabBarView(controller: tabController, children: [
            CategorysListView(categorys: categoryData.forher),
            CategorysListView(categorys: categoryData.forHim),
            CategorysListView(categorys: categoryData.forWedding),
          ]),
        ),
      ],
    );
  }
}
