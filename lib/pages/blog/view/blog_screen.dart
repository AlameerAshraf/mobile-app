import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weds360/components/tab_card_view.dart';
import 'package:weds360/core/helpers/Constants.dart';
import 'package:weds360/pages/blog/view/blog_list_view.dart';

import 'package:weds360/pages/blog/view/blog_provider.dart';
import 'package:material_floating_search_bar/material_floating_search_bar.dart';
import 'package:weds360/pages/blog/view/header_blog_view.dart';
import 'package:weds360/pages/blog/view/search_hestroy.dart';

class BlogScreen extends StatefulWidget {
  static const String id = 'Blog';

  @override
  _BlogScreenState createState() => _BlogScreenState();
}

class _BlogScreenState extends State<BlogScreen> {
  FloatingSearchBarController controller;
  @override
  void initState() {
    controller = FloatingSearchBarController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final homeData = Provider.of<BlogProvider>(context);
    homeData.getList(context);
    return Padding(
      padding: const EdgeInsets.all(kPADDING),
      child: FloatingSearchBar(
        controller: controller,
        hint: 'Search...',
        scrollPadding: const EdgeInsets.only(top: 16, bottom: 56),
        transitionDuration: kBaseSettleDuration,
        transitionCurve: Curves.easeInOut,
        physics: const BouncingScrollPhysics(),
        borderRadius: BorderRadius.all(Radius.circular(ROUNDED)),
        openAxisAlignment: 0.0,
        maxWidth: 400.0,
        debounceDelay: const Duration(milliseconds: 500),
        onQueryChanged: (query) {
          // Call your model, bloc, controller here.
        },
        transition: CircularFloatingSearchBarTransition(),
        actions: [
          FloatingSearchBarAction.searchToClear(
            showIfClosed: true,
          ),
        ],
        builder: (context, transition) {
          return SearchHestroy(controller: controller);
        },
        body: FloatingSearchBarScrollNotifier(
          child: Padding(
            padding: const EdgeInsets.all(kPADDING),
            child: ListView(
              children: [
                SizedBox(
                  height: 55.0,
                ),
                HeaderBlogView(),
                BlogListView(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
