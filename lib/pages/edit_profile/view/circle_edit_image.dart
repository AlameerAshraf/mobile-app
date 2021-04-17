import 'dart:io';

import 'package:flutter/material.dart';

class CircleEditImage extends StatelessWidget {
  final Function onTap;
  final String imagePath;

  CircleEditImage({
    @required this.onTap,
    @required this.imagePath,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: PhysicalModel(
        elevation: 10.0,
        color: Colors.black,
        shape: BoxShape.circle,
        child: CircleAvatar(
          backgroundColor: Colors.amber,
          radius: 70,
          backgroundImage: AssetImage(
            imagePath,
          ),
          child: Align(
            alignment: Alignment.bottomRight,
            child: Container(
              width: 40.0,
              height: 40.0,
              decoration: BoxDecoration(
                  color: Theme.of(context).primaryColor,
                  shape: BoxShape.circle),
              child: Icon(
                Icons.camera_alt,
                color: Theme.of(context).scaffoldBackgroundColor,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
