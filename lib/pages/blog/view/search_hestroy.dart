import 'package:flutter/material.dart';
import 'package:material_floating_search_bar/material_floating_search_bar.dart';
import 'package:weds360/core/helpers/Constants.dart';

class SearchHestroy extends StatelessWidget {
  final FloatingSearchBarController controller;

  const SearchHestroy({@required this.controller});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(ROUNDED),
      child: Material(
        color: Colors.white,
        elevation: 4.0,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ListTile(
              title: Text(
                'ALi',
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              leading: const Icon(Icons.history),
              trailing: IconButton(
                icon: const Icon(Icons.clear),
                onPressed: () {
                  // setState(() {
                  //   deleteSearchTerm(term);
                  // });
                },
              ),
              onTap: () {
                // setState(() {
                //   putSearchTermFirst(term);
                //   selectedTerm = term;
                // });
                controller.close();
              },
            ),
            ListTile(
              title: Text(
                'ALi',
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              leading: const Icon(Icons.history),
              trailing: IconButton(
                icon: const Icon(Icons.clear),
                onPressed: () {
                  // setState(() {
                  //   deleteSearchTerm(term);
                  // });
                },
              ),
              onTap: () {
                // setState(() {
                //   putSearchTermFirst(term);
                //   selectedTerm = term;
                // });
                controller.close();
              },
            ),
            ListTile(
              title: Text(
                'ALi',
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              leading: const Icon(Icons.history),
              trailing: IconButton(
                icon: const Icon(Icons.clear),
                onPressed: () {
                  // setState(() {
                  //   deleteSearchTerm(term);
                  // });
                },
              ),
              onTap: () {
                // setState(() {
                //   putSearchTermFirst(term);
                //   selectedTerm = term;
                // });
                controller.close();
              },
            ),
            ListTile(
              title: Text(
                'ALi',
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              leading: const Icon(Icons.history),
              trailing: IconButton(
                icon: const Icon(Icons.clear),
                onPressed: () {
                  // setState(() {
                  //   deleteSearchTerm(term);
                  // });
                },
              ),
              onTap: () {
                // setState(() {
                //   putSearchTermFirst(term);
                //   selectedTerm = term;
                // });
                controller.close();
              },
            ),
          ],
        ),
      ),
    );
  }
}
