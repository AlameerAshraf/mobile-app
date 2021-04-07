import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weds360/components/raised_button_costem.dart';
import 'package:weds360/components/text_field_custem.dart';

import 'package:weds360/core/helpers/Constants.dart';
import 'package:weds360/pages/budgeter/models/budget_item.dart';
import 'package:weds360/pages/budgeter/view/budgeter_provider.dart';

class BottomSheetBadgetItem extends StatelessWidget {
  final BudgetItem budgetItem;

  final ScrollController scrollController;
  BottomSheetBadgetItem({
    @required this.budgetItem,
    @required this.scrollController,
  });
  @override
  Widget build(BuildContext context) {
    final data = Provider.of<BudgeterProvider>(context);
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: Padding(
        padding: EdgeInsets.all(kPADDING * 2),
        child: ListView(
          controller: scrollController,
          children: [
            Align(
                alignment: Alignment.topRight,
                child: IconButton(
                    icon: Icon(Icons.delete),
                    onPressed: () {
                      data.deleteBudgetItem(budgetItem);
                      Navigator.pop(context);
                    })),
            Text(
              'Description',
              style: Theme.of(context).textTheme.headline1.copyWith(
                    color: Theme.of(context).primaryColor,
                  ),
            ),
            Padding(
              padding: const EdgeInsets.all(kPADDING),
              child: Text(
                budgetItem.description,
                style: Theme.of(context).textTheme.subtitle2,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: kPADDING),
              child: Text(
                ' Vendor',
                style: Theme.of(context).textTheme.headline1.copyWith(
                      color: Theme.of(context).primaryColor,
                    ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(kPADDING),
              child: Text(
                budgetItem.vendor == null
                    ? 'No Selcted Vendor'
                    : budgetItem.vendor,
                style: Theme.of(context).textTheme.subtitle2,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: kPADDING),
              child: Text(
                'Note',
                style: Theme.of(context).textTheme.headline1.copyWith(
                      color: Theme.of(context).primaryColor,
                    ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(kPADDING),
              child: Text(
                budgetItem.note == null
                    ? 'Please enter your note'
                    : budgetItem.note,
                style: Theme.of(context).textTheme.subtitle2,
              ),
            ),
            TextFieldCustem(
              label: 'Amount Spent',
              keyboardType: TextInputType.number,
              prefexIcon: Icons.monetization_on_outlined,
              onChanged: (value) {
                data.newSpent = double.parse(value);
              },
            ),
            Padding(
              padding: const EdgeInsets.all(kPADDING),
              child: DropdownButton(
                  value: data.selctedVendor,
                  items: data.vendors
                      .map((e) => DropdownMenuItem(value: e, child: Text(e)))
                      .toList(),
                  onChanged: (value) {
                    data.onSelctedVendor(value);
                  }),
            ),
            TextFieldCustem(
              label: 'Note',
              keyboardType: TextInputType.multiline,
              prefexIcon: Icons.note_add_outlined,
              onChanged: (value) {
                data.newNote = value;
              },
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Center(
                child: RaisedButtonCustem(
                  title: 'Submet',
                  onPressed: () {
                    data.onSubmeted(budgetItem);
                    Navigator.pop(context);
                  },
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
