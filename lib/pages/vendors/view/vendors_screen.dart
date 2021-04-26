
import 'package:flutter/material.dart';
import 'package:material_floating_search_bar/material_floating_search_bar.dart';

import 'package:weds360/core/helpers/Constants.dart';
import 'package:weds360/pages/blog/view/search_hestroy.dart';

import 'package:weds360/pages/vendors/view/carsual_baner_view.dart';
import 'package:weds360/pages/vendors/view/featured_vendors_view.dart';
import 'package:weds360/pages/vendors/view/filtter_sheet_view.dart';
import 'package:weds360/pages/vendors/view/header_change_category_view.dart';
import 'package:weds360/pages/vendors/view/vendors_listView.dart';


class VendorsScreen extends StatefulWidget {
  static const String id = 'Vendors';

  @override
  _VendorsScreenState createState() => _VendorsScreenState();
}

class _VendorsScreenState extends State<VendorsScreen> {
  FloatingSearchBarController controller;

  @override
  void initState() {
    controller = FloatingSearchBarController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    

    return Scaffold(
      body: SafeArea(
        child: FloatingSearchBar(
          controller: controller,
          hint: 'Search...',
          scrollPadding: const EdgeInsets.only(top: 16, bottom: 56),
          margins: EdgeInsets.all(kPADDING),
          transitionDuration: kBaseSettleDuration,
          transitionCurve: Curves.easeInOut,
          physics: const BouncingScrollPhysics(),
          borderRadius: BorderRadius.all(Radius.circular(ROUNDED)),
          openAxisAlignment: 0.0,
          maxWidth: MediaQuery.of(context).size.width - 30,
          debounceDelay: const Duration(milliseconds: 500),
          onQueryChanged: (query) {
            // Call your model, bloc, controller here.
          },
          transition: CircularFloatingSearchBarTransition(),
          actions: [
            FloatingSearchBarAction.searchToClear(
              showIfClosed: true,
            ),
            IconButton(
              icon: Icon(Icons.filter_list_rounded),
              onPressed: () {
                showModalBottomSheet(
                    context: context,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(ROUNDED),
                    ),
                    elevation: 5.0,
                    builder: (context) => FiltersheetView());
              },
            ),
          ],
          builder: (context, transition) {
            return SearchHestroy(controller: controller);
          },
          body: FloatingSearchBarScrollNotifier(
            child: ListView(
              children: [
                HeaderChangeCategoryView(),
                CarsualbannerView(),
                FeaturedVendorsView(),
                VendorListView(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
