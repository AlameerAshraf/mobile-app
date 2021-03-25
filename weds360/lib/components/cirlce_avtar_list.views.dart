import 'package:flutter/material.dart';

class CircleAvatarListViews extends StatelessWidget {
  final List<String> imagesPaths;
  CircleAvatarListViews(this.imagesPaths);
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 20,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: imagesPaths.length,
        shrinkWrap: true,
        itemBuilder: (context, index) {
          return Align(
            widthFactor: 0.6,
            child: Container(
              width: 20,
              height: 20,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                    image: NetworkImage(imagesPaths[index]),
                    fit: BoxFit.cover,
                    alignment: Alignment.center),
              ),
            ),
          );
        },
      ),
    );
  }
}
