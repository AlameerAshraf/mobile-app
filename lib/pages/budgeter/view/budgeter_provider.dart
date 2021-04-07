import 'package:flutter/cupertino.dart';
import 'package:weds360/pages/budgeter/models/budget_item.dart';

import 'package:weds360/pages/home/view/home_provider.dart';

class BudgeterProvider extends ChangeNotifier {
  int budget;
  int newBudget;
  bool isValide = true;

  List<BudgetItem> budgetItems = [
    BudgetItem(
        title: 'venue',
        recomended: 200,
        spent: 150,
        vendor: 'nada',
        description: 'sfdjkhfndskjhf',
        note: 'fdafasfasfasf'),
    BudgetItem(
        title: 'DJ',
        recomended: 300,
        spent: 300,
        vendor: 'nada',
        description: 'sfdjkhfndskjhf',
        note: 'fdafasfasfasf'),
    BudgetItem(
        title: 'Budgetone',
        recomended: 300,
        spent: 300,
        vendor: 'nada',
        description: 'sfdjkhfndskjhf',
        note: 'fdafasfasfasf'),
    BudgetItem(
        title: 'Spa',
        recomended: 300,
        spent: 300,
        vendor: 'nada',
        description:
            "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.",
        note: 'fdafasfasfasf'),
  ];

  double newSpent;
  String newNote;
  String newTitle;
  String newDescription;
  double newAmount;
  List<String> vendors = [
    'Maga',
    'asdsa',
    'asffff',
    'Mkljlkjaga',
    'Majjga',
    'Maderga',
    'sfaasfsffgggg',
    'ijinio',
  ];
  String selctedVendor;
  void onChangeBudget(String value) {
    newBudget = int.parse(value);

    notifyListeners();
  }

  void onSubmetBudget() {
    if (newBudget == null) {
      print('NO');
    } else {
      budget = newBudget;

      notifyListeners();
    }
  }

  void onSelctedVendor(String vendor) {
    selctedVendor = vendor;
    notifyListeners();
  }

  void onNoteChange(String note) {
    newNote = note;
    notifyListeners();
  }

  void changePersenct(HomeProvider home) {
    double totalSpent = 0;
    for (BudgetItem item in budgetItems) {
      totalSpent += item.spent;
    }

    home.budgeterPersintege(totalSpent / budget);
    notifyListeners();
  }

  void onSubmetedbudget(BudgetItem budgetItem, double spent) {
    if (spent == null) {
    } else {
      int index = budgetItems.indexOf(budgetItem);
      budgetItems[index].spent = spent;
      newSpent = null;
      notifyListeners();
    }
  }

  void onSubmeted(BudgetItem budgetItem) {
    int index = budgetItems.indexOf(budgetItem);
    if (newNote != null) {
      budgetItems[index].note = newNote;
    }
    if (newSpent != null) {
      budgetItems[index].spent = newSpent;
    }
    if (selctedVendor != null) {
      budgetItems[index].vendor = selctedVendor;
    }
    newNote = null;
    newSpent = null;
    selctedVendor = null;

    notifyListeners();
  }

  void onTitleChange(String value) {
    newTitle = value;
    notifyListeners();
  }

  void onDescriptionChange(String value) {
    newDescription = value;
    notifyListeners();
  }

  void onAmountChange(String value) {
    newAmount = double.parse(value);
    notifyListeners();
  }

  void addNewBudgetItem() {
    if (newTitle == null || newDescription == null || newAmount == null) {
      print(newTitle);
      print(newDescription);
      print(newAmount);
    } else {
      print('YES');
      budgetItems.add(BudgetItem(
        title: newTitle,
        spent: newAmount,
        description: newDescription,
      ));
      notifyListeners();
      newTitle = null;
      newDescription = null;
      newAmount = null;
    }
  }

  void deleteBudgetItem(BudgetItem budgetItem) {
    budgetItems.remove(budgetItem);
    notifyListeners();
  }
}
