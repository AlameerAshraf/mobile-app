import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weds360/components/check_list_card_view.dart';
import 'package:weds360/core/helpers/Constants.dart';
import 'package:weds360/pages/home/view/home_provider.dart';
import 'package:image_picker/image_picker.dart';
import 'package:weds360/pages/registry/view/add_item_dialog.dart';
import 'package:weds360/pages/registry/view/edit_item_dialog.dart';
import 'package:weds360/pages/registry/view/registry_provider.dart';
import 'package:weds360/pages/registry/view/rigestry_item_view.dart';

class RegistryScreen extends StatefulWidget {
  static const String id = 'Registry';

  @override
  _RegistryScreenState createState() => _RegistryScreenState();
}

class _RegistryScreenState extends State<RegistryScreen> {
  @override
  Widget build(BuildContext context) {
    final data = Provider.of<RegistryProvider>(context);
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
          ListView.builder(
              padding: EdgeInsets.all(kPADDING),
              shrinkWrap: true,
              itemCount: data.regestrylist.length,
              itemBuilder: (context, index) {
                return RigestryItemView(
                  registryModel: data.regestrylist[index],
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (context) => EditItemDialog(data.regestrylist[index]),
                    );
                  },
                );
              })
        ],
      )),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Theme.of(context).primaryColor,
        onPressed: () {
          showDialog(
            context: context,
            builder: (context) => AddItemDialog(),
          );
        },
        child: Icon(
          Icons.add,
        ),
      ),
    );
  }
}
