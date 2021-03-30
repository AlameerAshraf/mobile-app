import 'package:flutter/material.dart';

class FiltterChipCustem extends StatelessWidget {
  final String label;
  final bool selcted;
  final Function onSelcted;

  const FiltterChipCustem({
    @required this.label,
    @required this.selcted,
    @required this.onSelcted,
  });
  @override
  Widget build(BuildContext context) {
    return FilterChip(
      label: Text(label),
      onSelected: onSelcted,
      selected: selcted,
      selectedColor: Theme.of(context).primaryColor,
      checkmarkColor: Theme.of(context).scaffoldBackgroundColor,
      labelStyle: TextStyle(
        color: Theme.of(context).scaffoldBackgroundColor,
      ),
      backgroundColor: Colors.grey,
      avatar: selcted
          ? null
          : Icon(
              Icons.add,
              color: Theme.of(context).scaffoldBackgroundColor,
            ),
    );
  }
}
