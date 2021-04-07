import 'dart:io';

import 'package:flutter/material.dart';
import 'package:weds360/core/helpers/Constants.dart';
import 'package:weds360/pages/registry/models/registry_model.dart';

class RigestryItemView extends StatelessWidget {
  final RegistryModel registryModel;
  final Function onPressed;
  RigestryItemView({
    @required this.registryModel,
    @required this.onPressed,
  });
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(8.0),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8.0),
      ),
      borderOnForeground: true,
      elevation: 2.0,
      child: Stack(
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            height: 121.0,
            padding: EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                  child: ClipRRect(
                    borderRadius: BorderRadius.all(
                      Radius.circular(8.0),
                    ),
                    child: Image.file(
                      registryModel.image,
                      fit: BoxFit.cover,
                      height: 121.0,
                    ),
                  ),
                ),
                Expanded(
                    flex: 2,
                    child: Padding(
                      padding: const EdgeInsets.only(left: kPADDING),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            registryModel.title,
                            style: Theme.of(context).textTheme.headline1,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.location_on_outlined,
                                color: Colors.grey,
                                size: 15.0,
                              ),
                              Text(
                                registryModel.address,
                                style: Theme.of(context).textTheme.subtitle2,
                                textAlign: TextAlign.start,
                              )
                            ],
                          ),
                          Expanded(
                            child: Text(
                              registryModel.note,
                              style: Theme.of(context).textTheme.overline,
                              overflow: TextOverflow.ellipsis,
                              maxLines: 3,
                            ),
                          ),
                        ],
                      ),
                    )),
              ],
            ),
          ),
          Positioned(
            top: 0.0,
            right: 0.0,
            child: IconButton(
              icon: Icon(Icons.edit),
              onPressed: onPressed,
            ),
          ),
          Positioned(
            bottom: 8.0,
            right: 8.0,
            child: Text(registryModel.price.toString() + 'LE'),
          ),
        ],
      ),
    );
  }
}
