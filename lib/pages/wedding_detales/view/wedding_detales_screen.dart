import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weds360/components/text_field_custem.dart';
import 'package:weds360/core/helpers/Constants.dart';
import 'package:weds360/pages/edit_profile/view/data_filed.dart';
import 'package:weds360/pages/edit_profile/view/edit_dialog.dart';
import 'package:weds360/pages/wedding_detales/view/wedding_detales_provider.dart';

class WeddingDetalesScreen extends StatefulWidget {
  static const String id = 'WeddingDetales';
  @override
  _WeddingDetalesScreenState createState() => _WeddingDetalesScreenState();
}

class _WeddingDetalesScreenState extends State<WeddingDetalesScreen> {
  @override
  Widget build(BuildContext context) {
    final data = Provider.of<WeddingDetalesProvider>(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        elevation: 0.0,
        iconTheme: Theme.of(context).iconTheme.copyWith(
              color: Theme.of(context).accentColor,
            ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(kPADDING * 2),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Wedding Detales',
                  textAlign: TextAlign.start,
                  style: Theme.of(context).textTheme.headline1.copyWith(
                        fontSize: 35.0,
                        color: Theme.of(context).primaryColor,
                      ),
                ),
                SizedBox(
                  height: 20.0,
                ),
                DataFiled(
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (context) => EditDialog(
                        label: 'Wedding Date',
                        errorMassege:
                            data.isWeddingDateValid ? null : 'enter Valid Date',
                        onPressed: () {
                          data.onEditWeddingDate(data.newWeddingDate, context);
                        },
                        onChanded: (value) {
                          data.onChangeWeddingDate(value);
                        },
                        icon: Icons.person,
                        keyboard: TextInputType.number,
                        onSubmeted: (value) {
                          data.onEditWeddingDate(value, context);
                        },
                        isBirthday: true,
                      ),
                    );
                  },
                  label: 'Wedding Date',
                  data: data.weddingDetalesModel.weddingDate == null
                      ? 'not Exist'
                      : data.weddingDetalesModel.weddingDate,
                ),
                DataFiled(
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (context) => EditDialog(
                        label: 'Venue',
                        errorMassege:
                            data.isVenueValid ? null : 'enter Valid Venue',
                        onPressed: () {
                          data.onEditVenue(data.newVenue, context);
                        },
                        onChanded: (value) {
                          data.onChangeVenue(value);
                        },
                        icon: Icons.person,
                        keyboard: TextInputType.name,
                        onSubmeted: (value) {
                          data.onEditVenue(value, context);
                        },
                      ),
                    );
                  },
                  label: 'Venue',
                  data: data.weddingDetalesModel.venue == null
                      ? 'not Exist'
                      : data.weddingDetalesModel.venue,
                ),
                DataFiled(
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (context) => EditDialog(
                        label: 'Budget',
                        errorMassege:
                            data.isBudgetValid ? null : 'enter Valid Budget',
                        onPressed: () {
                          data.onEditBudget(data.newBudget.toString(), context);
                        },
                        onChanded: (value) {
                          data.onChangeBudget(value);
                        },
                        icon: Icons.person,
                        keyboard: TextInputType.number,
                        onSubmeted: (value) {
                          data.onEditBudget(value, context);
                        },
                      ),
                    );
                  },
                  label: 'Buddget',
                  data: data.weddingDetalesModel.buddget == null
                      ? 'not Exist'
                      : data.weddingDetalesModel.buddget.toString() + 'LE',
                ),
                DataFiled(
                  label: 'Number of Guests',
                  data: data.weddingDetalesModel.numberOfGuest == null
                      ? 'not Exist'
                      : data.weddingDetalesModel.numberOfGuest.toString(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
