import 'package:flutter/material.dart';
import 'package:weds360/components/progress_with_centered_value.dart';
import 'package:weds360/core/helpers/Constants.dart';

class CheckListCardView extends StatelessWidget {
  final double percent;
  final String title;
  final String description;
  final Function onPressed;

  const CheckListCardView({
    @required this.percent,
    @required this.title,
    @required this.description,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Card(
        elevation: 0.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(ROUNDED),
        ),
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: 90.0,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                ProgressWithCenteredValue(
                  percent: percent == null ? 0.0 : percent,
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          title,
                          style: Theme.of(context).textTheme.headline3,
                        ),
                        Text(
                          description,
                          style: Theme.of(context).textTheme.overline,
                          overflow: TextOverflow.clip,
                          maxLines: 1,
                        ),
                      ],
                    ),
                  ),
                ),
                IconButton(
                    icon: Icon(
                      Icons.arrow_forward_ios_rounded,
                      color: Theme.of(context).primaryColor,
                      size: 35.0,
                    ),
                    onPressed: onPressed),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
