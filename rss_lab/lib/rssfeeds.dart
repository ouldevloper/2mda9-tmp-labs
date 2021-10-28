import 'dart:io';
import 'package:flutter/material.dart';
import "package:http/http.dart" as http;
import 'package:dart_rss/dart_rss.dart';
import 'package:flutter/cupertino.dart';
import 'package:rss_lab/rsscontroller.dart';
import 'package:rss_lab/sys/feeds.dart';
import 'package:url_launcher/url_launcher.dart';

class Rssfeeds extends StatefulWidget {
  const Rssfeeds({Key? key}) : super(key: key);

  @override
  _RssfeedsState createState() => _RssfeedsState();
}

class _RssfeedsState extends State<Rssfeeds> {
  late String title = "Home Jobs";
  final Rsscontroller rss = Rsscontroller();
  late RssFeed feeds;
  static String url = "https://hnrss.org/jobs";
  late GlobalKey<RefreshIndicatorState> _refresh;
  @override
  void initState() {
    super.initState();
    _refresh = GlobalKey<RefreshIndicatorState>();
    load();
  }

  void updatetitle(title) {
    setState(() {
      title = title;
    });
  }

  load() async {
    getFeeds(url).then((result) {
      if (null == result || result.toString().isEmpty) {
        updatetitle("Ops ...");
        print("Ops ... 31");
        return;
      }
      setState(() {
        feeds = result;
        print(feeds.items[0].title);
        title = result.title ?? "IT Jobs....";
      });
    });
  }

  isNotValid() {
    return null == feeds || null == feeds.items;
  }

  buildBody() {
    return isNotValid()
        ? const Center(child: CircularProgressIndicator())
        : RefreshIndicator(
            child: ListView.builder(
                itemCount: feeds.items.length,
                itemBuilder: (BuildContext context, int i) {
                  final item = feeds.items[i];
                  return Padding(
                    padding: const EdgeInsets.all(3),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.deepPurple.shade50,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: ListTile(
                        trailing: IconButton(
                          icon: const Icon(Icons.more_horiz_outlined),
                          onPressed: () {
                            setState(() {
                              openFeed(item.link ?? "https://google.com");
                            });
                          },
                        ),
                        focusColor: Colors.amber,
                        title: Text("From : ${item.dc!.creator}"),
                        subtitle: Text(item.title ?? "ops..."),
                        leading: const Image(
                          image: AssetImage("assets/job.jpg"),
                          height: 70,
                          width: 67,
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                  );
                }),
            onRefresh: () => load(),
            key: _refresh);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.pink,
          actions: [
            IconButton(
                onPressed: () => buildBody,
                icon: const Icon(Icons.restart_alt_outlined))
          ],
          title: Text(title),
        ),
        body: buildBody());
  }

  getFeeds(String url) async {
    try {
      final client = http.Client();
      final response = await client.get(Uri.parse(url));
      return RssFeed.parse(response.body);
    } catch (e) {
      //print("Error: $e");
    }
    return null;
  }

  Future<void> openFeed(String url) async {
    if (await canLaunch(url)) {
      await launch(
        url,
        forceSafariVC: true,
        forceWebView: true,
      );
      setState(() {
        title = "Hacker News|Jobs";
      });

      return;
    }
    title = "Oppps ....";
  }
}
