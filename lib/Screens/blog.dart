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
    return Card(
      elevation: 3,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            gradient:
                LinearGradient(colors: [Colors.lightBlue, Colors.purple])),
        child: Column(
          children: [
            AspectRatio(
              aspectRatio: 16 / 9,
              child: ClipRRect(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(10.0),
                  topRight: Radius.circular(10.0),
                ),
                child: Image.network(
                  blog.urlToImage,
                  fit: BoxFit.fill,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(kDefaultPadding),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    blog.date!,
                    style: TextStyle(color: Colors.grey),
                  ),
                  SizedBox(height: 8),
                  Text(
                    blog.title!,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                        fontSize: 20,
                        fontFamily: "Raleway",
                        fontWeight: FontWeight.bold,
                        decoration: TextDecoration.underline),
                  ),
                  SizedBox(height: 8),
                  Text(
                    blog.description!,
                    maxLines: 4,
                    style: TextStyle(color: Colors.black87),
                  ),
                  SizedBox(height: 16),
                  ElevatedButton(
                    style: ButtonStyle(
                        backgroundColor:
                            MaterialStatePropertyAll(Colors.purple)),
                    onPressed: () async {
                      final Uri url = Uri.parse(blog.url);
                      launchUrl(url);
                    },
                    child: Text("Read More"),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
