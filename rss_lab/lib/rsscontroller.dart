import 'dart:ffi';

import "package:dart_rss/dart_rss.dart" as rss;
import 'package:flutter/cupertino.dart';
import "package:http/http.dart" as http;
import 'package:rss_lab/sys/feeds.dart';
import "package:url_launcher/link.dart" as url;
import 'package:url_launcher/url_launcher.dart';

class Rsscontroller {
  late String? title = "";

  Future<void> openFeed(String url) async {
    if (await canLaunch(url)) {
      await launch(
        url,
        forceSafariVC: true,
        forceWebView: false,
      );
      title = "Feeds ....";
      return;
    }
    title = "Error ....";
  }

  Future<rss.RssFeed> getFeeds(String url) async {
    try {
      final client = http.Client();
      final response = await client.get(Uri.parse(url));
      return rss.RssFeed.parse(response.body);
    } catch (e) {
      //
    }
    return const rss.RssFeed();
  }
}
