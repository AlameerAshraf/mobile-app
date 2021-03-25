import 'package:flutter/material.dart';
import 'package:weds360/components/tab_card_view.dart';

class BlogListView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: ScrollPhysics(),
      shrinkWrap: true,
      itemCount: 20,
      itemBuilder: (context, index) {
        return TabCardView(
          imagePath:
              'https://image.freepik.com/free-photo/indoor-portrait-young-girl-black-dress-bride-her-groom-with-rose-pocket-dancing-isolated-background_197531-16335.jpg',
          title: 'Tax Accountant',
          description:
              'Vestibulum ac est lacinia nisi venenatis tristique. Fusce congue, diam id ornare imperdiet, sapien urna pretium nisl, ut volutpat sapien arcu sed augue. Aliquam erat volutpat.\n\nIn congue. Etiam justo. Etiam pretium iaculis justo.\n\nIn hac habitasse platea dictumst. Etiam faucibus cursus urna. Ut tellus.',
          onPressed: () {},
        );
      },
    );
  }
}
