import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:health_app/api/blog_api.dart';
import 'package:health_app/constants/constants.dart';
import 'package:url_launcher/url_launcher.dart';

class Blog2 extends StatefulWidget {
  const Blog2({super.key});

  @override
  State<Blog2> createState() => _BlogState();
}

class _BlogState extends State<Blog2> {
  List<NewsArticle> newsArticles = [];
  bool isloading = true;

  @override
  void initState() {
    super.initState();
    main();
  }

  Future<void> main() async {
    // try {
    newsArticles = await NewsArticle.getTopHeadlines(
        'in', 'b06717d2cb2545c98fa601b779518f97');

    setState(() {
      isloading = false;
    });

    // Use the retrieved news data
    //   for (var article in newsArticles) {
    //     print('Title: ${article.title}');
    //     print('Description: ${article.description}');
    //     print('URL: ${article.url}');
    //     print('URL to Image: ${article.urlToImage}');
    //     print('Author: ${article.author}');
    //     print('---');
    //   }
    // } catch (e) {
    //   print('Error: $e');
    // }
  }

  Future<void> _launchUrl(Uri _url) async {
    if (!await launchUrl(_url)) {
      throw Exception('Could not launch $_url');
    }
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          // color: Colors.blue,
          decoration: BoxDecoration(
              gradient:
                  LinearGradient(colors: [Colors.lightBlue, Colors.purple])),

          child: _buildBody(),
        ),
      ),
    );
  }

  Widget _buildBody() {
    if (isloading) {
      return Center(
        child: CircularProgressIndicator(),
      );
    } else if (newsArticles.isEmpty) {
      return Center(
        child: Text(
          'No workouts available.',
          style: TextStyle(fontSize: 18.0, color: Colors.grey),
        ),
      );
    } else {
      return ListView.builder(
        itemCount: newsArticles.length,
        itemBuilder: (context, index) {
          final blog = newsArticles[index];
          return buildBlog(blog);
        },
      );
    }
  }

  Widget buildBlog(NewsArticle blog) {
    return Padding(
      padding: const EdgeInsets.only(bottom: kDefaultPadding),
      child: Column(
        children: [
          AspectRatio(
            aspectRatio: 2,
            child: Image.network(blog.urlToImage),
          ),
          Container(
            padding: EdgeInsets.all(kDefaultPadding),
            decoration: BoxDecoration(
              // color: Colors.amber,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(10),
                bottomRight: Radius.circular(10),
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    // Text(
                    //   "Design".toUpperCase(),
                    //   style: TextStyle(
                    //     color: Colors.white,
                    //     fontSize: 12,
                    //     fontWeight: FontWeight.bold,
                    //   ),
                    // ),
                    SizedBox(width: kDefaultPadding),
                    Text(
                      blog.date!,
                      style: TextStyle(color: Colors.white),
                      // style: Theme.of(context).textTheme.caption,
                    ),
                  ],
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: kDefaultPadding),
                  child: Text(
                    blog.title!,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontSize: 24,
                      fontFamily: "Raleway",
                      color: Colors.white,
                      height: 1.3,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                Text(
                  blog.description!,
                  maxLines: 4,
                  style: TextStyle(height: 1.5, color: Colors.white),
                ),
                SizedBox(height: kDefaultPadding),
                Row(
                  children: [
                    TextButton(
                          onPressed: () async {
                            final Uri url = Uri.parse(blog.url);
                            launchUrl(url);
                          },
                          child: Container(
                            padding:
                                EdgeInsets.only(bottom: kDefaultPadding / 4),
                            decoration: BoxDecoration(
                              border: Border(
                                bottom:
                                    BorderSide(color: kPrimaryColor, width: 3),
                              ),
                            ),
                            child: Text(
                              "Read More",
                              style: TextStyle(color: kDarkBlackColor),
                            ),
                          ),
                        ),
                    Spacer(),
                    IconButton(
                      
                      icon: SvgPicture.asset("/icons/feather_thumbs-up.svg"),
                      onPressed: () {},
                    ),
                    IconButton(
                      icon:
                          SvgPicture.asset("/icons/feather_message-square.svg"),
                      onPressed: () {},
                    ),
                    IconButton(
                      icon: SvgPicture.asset("/icons/feather_share-2.svg"),
                      onPressed: () {},
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
