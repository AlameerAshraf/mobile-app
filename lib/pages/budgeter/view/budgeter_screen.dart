import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weds360/components/check_list_card_view.dart';
import 'package:weds360/components/raised_button_costem.dart';
import 'package:weds360/components/text_field_custem.dart';

import 'package:weds360/core/helpers/Constants.dart';
import 'package:weds360/pages/budgeter/view/bottom_sheet_badget_item.dart';
import 'package:weds360/pages/budgeter/view/budgeter_provider.dart';
import 'package:weds360/pages/budgeter/view/enter_your_budget.dart';
import 'package:weds360/pages/home/view/home_provider.dart';

class BudgeterScren extends StatefulWidget {
  static const String id = 'Budgeter';
  @override
  _BudgeterScrenState createState() => _BudgeterScrenState();
}

class _BudgeterScrenState extends State<BudgeterScren> {
  @override
  Widget build(BuildContext context) {
    final data = Provider.of<BudgeterProvider>(context);
    final home = Provider.of<HomeProvider>(context);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      data.changePersenct(home);
    });

    return Scaffold(
      appBar: AppBar(
        title: Text('Budgeter'),
        centerTitle: true,
        actions: [
          IconButton(
            icon: Icon(Icons.edit),
            onPressed: () {
              showDialog(
                  context: context,
                  builder: (context) {
                    return EnterYourBudget();
                  });
            },
          ),
        ],
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(kPADDING),
          child: data.budget == null
              ? Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextFieldCustem(
                        label: 'Budget',
                        prefexIcon: Icons.check_box_outlined,
                        keyboardType: TextInputType.number,
                        onChanged: (value) {
                          print(value);

                          data.onChangeBudget(value);
                        },
                        errorMessege: data.isValide ? null : 'enter Budget',
                        onSubmitted: (_) {
                          data.onSubmetBudget();
                        }),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: RaisedButtonCustem(
                        title: 'Submet',
                        onPressed: () {
                          data.onSubmetBudget();
                        },
                      ),
                    )
                  ],
                )
              : ListView(
                  children: [
                    Consumer<HomeProvider>(builder: (context, value, child) {
                      return CheckListCardView(
                        percent: value.planner[2].percent,
                        title: value.planner[2].title,
                        description: value.planner[2].description,
                        onPressed: () {
                          data.changePersenct(value);
                        },
                      );
                    }),
                    DataTable(
                        showCheckboxColumn: false,
                        columns: [
                          DataColumn(label: Text('vendors')),
                          DataColumn(label: Text('Recomended')),
                          DataColumn(label: Text('Spent')),
                        ],
                        rows: data.budgetItems
                            .map((e) => DataRow(
                                    onSelectChanged: (_) {
                                      showModalBottomSheet(
                                          context: context,
                                          shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.only(
                                                topLeft:
                                                    Radius.circular(ROUNDED),
                                                topRight:
                                                    Radius.circular(ROUNDED)),
                                          ),
                                          elevation: 5.0,
                                          isScrollControlled: true,
                                          builder: (context) {
                                            return DraggableScrollableSheet(
                                                expand: false,
                                                maxChildSize: 0.65,
                                                builder:
                                                    (context, scrollControlor) {
                                                  return BottomSheetBadgetItem(
                                                    budgetItem: e,
                                                    scrollController:
                                                        scrollControlor,
                                                  );
                                                });
                                          });
                                    },
                                    cells: [
                                      DataCell(Text(e.title),
                                          showEditIcon: true),
                                      DataCell(
                                          Text(e.recomended.toString() + 'LE')),
                                      DataCell(Text(e.spent.toString() + 'LE')),
                                    ]))
                            .toList())
                  ],
                ),
        ),
      ),
      floatingActionButton: data.budget == null
          ? null
          : FloatingActionButton(
              backgroundColor: Theme.of(context).primaryColor,
              onPressed: () {
                showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        title: Text('ADD'),
                        content: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            TextFieldCustem(
                              label: 'Title',
                              prefexIcon: Icons.title_rounded,
                              keyboardType: TextInputType.text,
                              onChanged: (value) {
                                data.onTitleChange(value);
                              },
                              onSubmitted: (_) {},
                            ),
                            TextFieldCustem(
                              label: 'Description',
                              prefexIcon: Icons.description_outlined,
                              keyboardType: TextInputType.multiline,
                              onChanged: (value) {
                                data.onDescriptionChange(value);
                              },
                              onSubmitted: (_) {},
                            ),
                            TextFieldCustem(
                              label: 'Amount',
                              prefexIcon: Icons.monetization_on_outlined,
                              keyboardType: TextInputType.number,
                              onChanged: (value) {
                                data.onAmountChange(value);
                              },
                              onSubmitted: (_) {
                                data.addNewBudgetItem();
                                Navigator.pop(context);
                              },
                            ),
                          ],
                        ),
                        actions: [
                          FlatButton(
                            onPressed: () {
                              data.addNewBudgetItem();
                              Navigator.pop(context);
                            },
                            child: Text(
                              'Submet',
                              style: TextStyle(
                                color: Theme.of(context).accentColor,
                              ),
                            ),
                          ),
                        ],
                      );
                    });
              },
              child: Icon(
                Icons.add,
              ),
            ),
    );
  }
}
