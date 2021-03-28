import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

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
    tabController.addListener(() {
      categoryData.onTabCliced(tabController.index);
    });
    return Column(
      children: [
        TabBar(
            controller: tabController,
            labelColor: Theme.of(context).primaryColor,
            unselectedLabelColor: Colors.grey,
            indicatorColor: Theme.of(context).primaryColor,
            isScrollable: true,
            labelStyle: Theme.of(context).textTheme.headline1,
            onTap: (index) {
              categoryData.onTabCliced(index);
            },
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
          child: 
            TabBarView(controller: tabController, children: [
              CategorysListView(),
              CategorysListView(),
              CategorysListView(),
            ]),
          ),
        
      ],
    );
  }
}
