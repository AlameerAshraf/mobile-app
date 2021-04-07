import 'package:flutter/foundation.dart';

class BudgetItem {
  String title;
  String vendor;
  double recomended;
  double spent;
  String description;
  String note;
  BudgetItem({
    @required this.title,
    this.vendor,
    this.recomended = 0.0,
    @required this.spent,
    @required this.description,
    this.note,
  });
}
