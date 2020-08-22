import 'package:url_launcher/url_launcher.dart';

class FeedItem {

  String title;
  String imageUrl;
  DateTime pubDate;
  String postURL;

  void openUrl(url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  FeedItem({this.title, this.pubDate, this.postURL, this.imageUrl});

}