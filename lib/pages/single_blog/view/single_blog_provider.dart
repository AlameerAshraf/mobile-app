import 'package:flutter/cupertino.dart';
import 'package:weds360/pages/single_blog/models/blog_model.dart';

class SingleBlogProvider extends ChangeNotifier {
  BlogModel blog = BlogModel(
    image:
        'https://image.freepik.com/free-photo/indoor-portrait-young-girl-black-dress-bride-her-groom-with-rose-pocket-dancing-isolated-background_197531-16335.jpg',
    title: 'loresm opsm',
    date: '26 Nov 2021',
    body: """<article>
  <h2>Topic Introduction</h2>
  <p>Liquorice candy macaroon soufflé jelly cake. Candy canes ice cream biscuit marzipan. Macaroon pie sesame snaps
    jelly-o.
  </p>
  <h2>The Main Topic</h2>
  <p>Liquorice candy macaroon soufflé jelly cake. Candy canes ice cream biscuit marzipan. Macaroon pie sesame snaps
    jelly-o.
  </p>
  <h3 style='color:red'>A subtopic to the main one</h3>
  <p>Liquorice candy macaroon soufflé jelly cake. Candy canes ice cream biscuit marzipan. Macaroon pie sesame snaps
    jelly-o.
  </p>
  <img src="http://placecorgi.com/200x150" alt="Good corgi doggo" align="left">
</article>""",
  );


}
