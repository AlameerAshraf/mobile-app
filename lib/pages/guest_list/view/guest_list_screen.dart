import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weds360/components/raised_button_costem.dart';

import 'package:weds360/core/helpers/Constants.dart';
import 'package:weds360/pages/guest_list/view/add_guest_dialog.dart';
import 'package:weds360/pages/guest_list/view/guest_dashboard_view.dart';
import 'package:weds360/pages/guest_list/view/guest_list_provider.dart';

class GuestListScreen extends StatefulWidget {
  static const String id = 'GuestList';
  @override
  _GuestListScreenState createState() => _GuestListScreenState();
}

class _GuestListScreenState extends State<GuestListScreen> {
  @override
  Widget build(BuildContext context) {
    final data = Provider.of<GuestListProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Guest List'),
        centerTitle: true,
        // actions: [
        //   IconButton(
        //     icon: Icon(Icons.add_rounded),
        //     onPressed: () {

        //     },
        //   ),
        // ],
      ),
      body: SafeArea(
        child: ListView(
          padding: EdgeInsets.all(kPADDING),
          children: [
            // Consumer<HomeProvider>(builder: (context, value, child) {
            //   return CheckListCardView(
            //     percent: value.planner[0].percent,
            //     title: value.planner[0].title,
            //     description: value.planner[0].description,
            //     onPressed: () {
            //       // data.changePersenct(value);
            //     },
            //   );
            // }),
            GuestDashBoardView(),
            Padding(
              padding: const EdgeInsets.all(kPADDING),
              child: IntrinsicHeight(
                child: Container(
                  color: Colors.white,
                  padding: EdgeInsets.all(kPADDING),
                  child: Row(
                    // mainAxisAlignment: MainAxisAlignment.spaceAround,
                    // crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Text(
                          'Name',
                          textAlign: TextAlign.start,
                          style: Theme.of(context).textTheme.headline1.copyWith(
                                color: Theme.of(context).primaryColor,
                              ),
                        ),
                      ),
                      VerticalDivider(
                        color: Colors.black,
                        thickness: 2.0,
                        width: 20.0,
                      ),
                      Expanded(
                        child: Text(
                          'Status',
                          style: Theme.of(context).textTheme.headline1.copyWith(
                                color: Theme.of(context).primaryColor,
                              ),
                          textAlign: TextAlign.center,
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(kPADDING * 2),
              child: ListView.separated(
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return Row(
                    children: [
                      Expanded(
                        child: Text(
                          data.guestList[index].name,
                          style: Theme.of(context).textTheme.subtitle1,
                        ),
                      ),
                      Expanded(
                        child: data.getGeustStutes(
                            data.guestList[index].invitationStatus),
                      ),
                    ],
                  );
                },
                separatorBuilder: (context, index) {
                  return Divider(
                    thickness: 2.0,
                  );
                },
                itemCount: data.guestList.length,
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Theme.of(context).primaryColor,
        onPressed: () {
          showDialog(
            context: context,
            builder: (context) => AddGuestDialog(),
          );
        },
        child: Icon(
          Icons.add,
        ),
      ),
    );
  }
}
