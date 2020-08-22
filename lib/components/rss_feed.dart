import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:myPortfolio/models/feed_item.dart';
import 'package:webfeed/domain/rss_content.dart';
import 'package:webfeed/webfeed.dart';
import 'package:http/http.dart' as http;
import 'package:content_placeholder/content_placeholder.dart';

class RSSReader extends StatefulWidget {
  static String id = 'RSSReader';
  final screenSize;
  RSSReader(this.screenSize);

  @override
  _RSSReaderState createState() => _RSSReaderState();
}

class _RSSReaderState extends State<RSSReader> {
  //  The feed URLS
  static List<String> feedUrls = [
    'https://aorillasdeltamesis.com/author/2vrcc/feed/',
//    'https://medium.com/feed/@Subirats345',
  ];

//The feed widgets List
  List<Widget> feedWidgetsList;

  // Get the data from the urls
  Future<RssFeed> getFromURL(source) async {
    try {
      final result = await http.get(source);
      return RssFeed.parse(result.body);
    } catch (e) {
      print(e);
    }
    return null;
  }

  updateFeed() async {
    List<RssFeed> rssFeedList = [];
    for (var source in feedUrls) {
      RssFeed _feed = await getFromURL(source);
      rssFeedList.add(_feed);
    }
    agregatorFeed(rssFeedList);
  }

  List<RssFeed> agregatorFeed(List<RssFeed> rssFeedList) {
    List<RssItem> aggregatedFeedList = [];

    for (var _feed in rssFeedList) {
      List<RssItem> rssItemsList = _feed.items;
      for (RssItem rssItem in rssItemsList) {
        aggregatedFeedList.add(rssItem);
      }
    }
    orderFeedsByPubDate(aggregatedFeedList);
  }

  List<RssItem> orderFeedsByPubDate(List<RssItem> aggregatedFeedList) {
    List<FeedItem> finalList = [];
    for (RssItem item in aggregatedFeedList) {
      RssContent rssItemContent = item.content;
      List<String> rssPostImagesList = rssItemContent.images.toList();
      String rssPostImage =
          rssPostImagesList.isNotEmpty ? rssPostImagesList[0] : 'foto';

      finalList.add(
        FeedItem(
            title: item.title,
            pubDate: item.pubDate,
            postURL: item.link,
            imageUrl: rssPostImage),
      );
    }

    finalList.sort((a, b) => b.pubDate.compareTo(a.pubDate));
    feedList(finalList);
  }

  List<Widget> feedList(List<FeedItem> rssFeedList) {
    List<Widget> feedList = [];

    for (var _feed in rssFeedList) {
      feedList.add(
        GestureDetector(
          onTap: (){
            _feed.openUrl(_feed.postURL);
          },
          child: Container(
            width: 280.0,
            child: Column(
              children: [
                SizedBox(
                  height: widget.screenSize.width / 6,
                  width: widget.screenSize.width / 3.8,
                  child: Card(
                    child: Image.network(
                      _feed.imageUrl,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                    top: widget.screenSize.height / 70,
                  ),
                  child: Text(
                    _feed.title,
                    style: GoogleFonts.montserrat(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    }
    setState(() {
      feedWidgetsList = feedList;
    });
  }

  @override
  void initState() {
    updateFeed();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> placeHolderList = [
      Container(
        width: 280.0,
        child: Column(
          children: [
            SizedBox(
              height: widget.screenSize.width / 6,
              width: widget.screenSize.width / 3.8,
              child: Card(
                child: ContentPlaceholder(),
              ),
            ),
            Padding(
                padding: EdgeInsets.only(
                  top: widget.screenSize.height / 70,
                ),
                child: ContentPlaceholder(
                  height: 20.0,
                )),
          ],
        ),
      ),
      Container(
        width: 280.0,
        child: Column(
          children: [
            SizedBox(
              height: widget.screenSize.width / 6,
              width: widget.screenSize.width / 3.8,
              child: Card(
                child: ContentPlaceholder(),
              ),
            ),
            Padding(
                padding: EdgeInsets.only(
                  top: widget.screenSize.height / 70,
                ),
                child: ContentPlaceholder(
                  height: 20.0,
                )),
          ],
        ),
      ),
      Container(
        width: 280.0,
        child: Column(
          children: [
            SizedBox(
              height: widget.screenSize.width / 6,
              width: widget.screenSize.width / 3.8,
              child: Card(
                child: ContentPlaceholder(),
              ),
            ),
            Padding(
                padding: EdgeInsets.only(
                  top: widget.screenSize.height / 70,
                ),
                child: ContentPlaceholder(
                  height: 20.0,
                )),
          ],
        ),
      ),
      Container(
        width: 280.0,
        child: Column(
          children: [
            SizedBox(
              height: widget.screenSize.width / 6,
              width: widget.screenSize.width / 3.8,
              child: Card(
                child: ContentPlaceholder(),
              ),
            ),
            Padding(
                padding: EdgeInsets.only(
                  top: widget.screenSize.height / 70,
                ),
                child: ContentPlaceholder(
                  height: 20.0,
                )),
          ],
        ),
      ),
    ];

    return ListView(
      scrollDirection: Axis.horizontal,
      children: feedWidgetsList == null ? placeHolderList : feedWidgetsList,
    );
  }
}
