import 'package:dart_rss/dart_rss.dart';
import 'package:flutter/material.dart';

class Feeds extends StatelessWidget {
  final RssFeed feed;
  const Feeds({Key? key, required this.feed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: feed.items.length,
        itemBuilder: (BuildContext context, int i) {
          final item = feed.items[i];
          return Padding(
            padding: const EdgeInsets.all(10),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
              ),
              child: ListTile(
                title: Text("$item.title"),
                subtitle: Text("$item.pubDate"),
                leading: Image(
                  image: AssetImage("assets/job.png"),
                  height: 50,
                  width: 50,
                  fit: BoxFit.fill,
                ),
              ),
            ),
          );
        });
  }
}
