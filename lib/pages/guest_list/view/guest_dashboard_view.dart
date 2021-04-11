import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weds360/components/date_view.dart';
import 'package:weds360/components/invitation_counter_view.dart';
import 'package:weds360/core/helpers/Constants.dart';
import 'package:weds360/pages/guest_list/view/guest_list_provider.dart';

class GuestDashBoardView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final data = Provider.of<GuestListProvider>(context);
    return Padding(
      padding: const EdgeInsets.all(kPADDING),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              DataView(
                day: '25',
                mounth: 'APR',
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Wedding after Party',
                      style: Theme.of(context).textTheme.headline1.copyWith(
                            color: Theme.of(context).primaryColor,
                            fontSize: 40.0,
                          ),
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    RichText(
                      text: TextSpan(
                        children: [
                          WidgetSpan(
                            child: Icon(
                              Icons.location_on_rounded,
                              color: Theme.of(context).primaryColor,
                            ),
                          ),
                          TextSpan(
                            text: '15 Nasr City',
                            style: Theme.of(context).textTheme.headline1,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
          Row(
            children: [
              InvitationCounterView(
                number: data.getAceptedLenth().toString(),
                title: 'Accepted',
                color: Colors.green,
              ),
              InvitationCounterView(
                number: data.getDeclinedLenth().toString(),
                title: 'Declined',
                color: Colors.red,
              ),
              InvitationCounterView(
                number: data.getInvitedLenth().toString(),
                title: 'Invited',
                color: Colors.yellow[700],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
