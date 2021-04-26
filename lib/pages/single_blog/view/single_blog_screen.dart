import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import 'package:share/share.dart';

import 'package:weds360/core/helpers/Constants.dart';
import 'package:weds360/pages/single_blog/view/single_blog_provider.dart';
import 'package:flutter_html/flutter_html.dart';

class SingleBlogScreen extends StatefulWidget {
  static const String id = 'SingleBlog';

  @override
  _SingleBlogScreenState createState() => _SingleBlogScreenState();
}

class _SingleBlogScreenState extends State<SingleBlogScreen> {
  @override
  Widget build(BuildContext context) {
    final data = Provider.of<SingleBlogProvider>(context);
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            pinned: true,
            floating: true,
            expandedHeight: MediaQuery.of(context).size.height * 0.55,
            stretch: true,
            centerTitle: true,
            title: Text(data.blog.title),
            actions: [
              IconButton(
                icon: Icon(
                  Icons.share,
                  size: 30,
                ),
                onPressed: () {
                  Share.share('check out my website https://example.com',
                      subject: 'Look what I made!');
                },
              ),
            ],
            flexibleSpace: FlexibleSpaceBar(
              background: Hero(
                tag: data.blog.image,
                child: CachedNetworkImage(
                  imageUrl: data.blog.image,
                  // width: 180,
                  // height: 100.0,
                  fit: BoxFit.cover,
                  progressIndicatorBuilder: (context, url, downloadProgress) =>
                      Center(
                    child: Center(
                      child: SizedBox(
                        width: 50.0,
                        height: 50.0,
                        child: CircularProgressIndicator(
                            value: downloadProgress.progress),
                      ),
                    ),
                  ),
                  errorWidget: (context, url, error) => Icon(Icons.error),
                ),
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildListDelegate(
              [
                Padding(
                  padding: EdgeInsets.only(
                      top: kPADDING * 2,
                      left: kPADDING * 2,
                      right: kPADDING * 2),
                  child: Row(
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              data.blog.title,
                              style: Theme.of(context)
                                  .textTheme
                                  .headline1
                                  .copyWith(
                                    color: Theme.of(context).primaryColor,
                                  ),
                            ),
                            Text(
                              data.blog.date,
                              style: Theme.of(context).textTheme.subtitle2,
                            ),
                          ],
                        ),
                      ),
                      Text(
                        '20K',
                        style: Theme.of(context).textTheme.subtitle2.copyWith(
                              fontSize: 15.0,
                            ),
                      ),
                      SizedBox(
                        width: 10.0,
                      ),
                      ImageIcon(
                        AssetImage('assets/images/clapping.png'),
                        color: Colors.grey,
                        size: 30.0,
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(kPADDING),
                  child: Html(
                    data: data.blog.body,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(kPADDING),
                  child: Row(
                    children: [
                      Expanded(
                        child: Divider(
                          color: Colors.black,
                          indent: 10.0,
                          endIndent: 10.0,
                        ),
                      ),
                      Text(
                        'You Might Also Like'.toUpperCase(),
                        style: Theme.of(context).textTheme.caption.copyWith(
                              color: Theme.of(context).primaryColor,
                            ),
                      ),
                      Expanded(
                        child: Divider(
                          color: Colors.black,
                          indent: 10.0,
                          endIndent: 10.0,
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(kPADDING * 2),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Expanded(
                        flex: 1,
                        child: AspectRatio(
                          aspectRatio: 1,
                          child: CachedNetworkImage(
                            imageUrl:
                                'https://image.freepik.com/free-photo/indoor-portrait-young-girl-black-dress-bride-her-groom-with-rose-pocket-dancing-isolated-background_197531-16335.jpg',
                            fit: BoxFit.cover,
                            imageBuilder: (context, imageProvider) => Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(ROUNDED),
                                image: DecorationImage(
                                  image: imageProvider,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            progressIndicatorBuilder:
                                (context, url, downloadProgress) => Center(
                              child: Center(
                                child: SizedBox(
                                  width: 50.0,
                                  height: 50.0,
                                  child: CircularProgressIndicator(
                                      value: downloadProgress.progress),
                                ),
                              ),
                            ),
                            errorWidget: (context, url, error) =>
                                Icon(Icons.error),
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 3,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'How to Find your Loved one',
                                style: Theme.of(context)
                                    .textTheme
                                    .headline2
                                    .copyWith(
                                      color: Theme.of(context).primaryColor,
                                    ),
                              ),
                              Text(
                                "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dumm",
                                style: Theme.of(context).textTheme.subtitle2,
                              )
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                );
              },
              childCount: 4,
            ),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: ImageIcon(
          AssetImage('assets/images/clapping.png'),
          color: Theme.of(context).scaffoldBackgroundColor,
          size: 30.0,
        ),
        onPressed: () {},
      ),
    );
  }
}
