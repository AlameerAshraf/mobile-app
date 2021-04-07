import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weds360/components/check_list_card_view.dart';
import 'package:weds360/core/helpers/Constants.dart';
import 'package:weds360/pages/home/view/home_provider.dart';

class RegistryScreen extends StatefulWidget {
  static const String id = 'Registry';

  @override
  _RegistryScreenState createState() => _RegistryScreenState();
}

class _RegistryScreenState extends State<RegistryScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: ListView(
        padding: const EdgeInsets.all(kPADDING),
        children: [
          Consumer<HomeProvider>(builder: (context, value, child) {
            return CheckListCardView(
                percent: value.planner[3].percent,
                title: value.planner[3].title,
                description: value.planner[3].description,
                onPressed: () {
                  // data.changePersenct(value);
                });
          }),
        ],
      )),
    );
  }
}
