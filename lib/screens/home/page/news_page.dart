import 'dart:convert';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:fitness_flutter/screens/home/page/web_page.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:webfeed/webfeed.dart';

class NewsPage extends StatefulWidget {
  const NewsPage({Key? key}) : super(key: key);

  final String title = 'News';

  @override
  NewsPageState createState() => NewsPageState();
}

class NewsPageState extends State<NewsPage> {
  static const String feedURL = 'https://vnexpress.net/rss/suc-khoe.rss';
  RssFeed? _feed;
  static const String placeholderImg = 'assets/icons/progress.png';
  GlobalKey<RefreshIndicatorState>? _refreshKey;

  updateFeed(feed) {
    setState(() {
      _feed = feed;
    });
  }

  Future<void> openFeed(String url) async {
    Navigator.of(context).push(MaterialPageRoute(builder: (_) => WebPage(url)));
  }

  load() async {
    loadFeed().then((result) {
      if (null == result || result.toString().isEmpty) {
        return;
      }
      updateFeed(result);
    });
  }

  Future<RssFeed?> loadFeed() async {
    try {
      final client = http.Client();
      final response = await client.get(Uri.parse(feedURL));
      String jsonData = utf8.decode(response.bodyBytes);
      return RssFeed.parse(jsonData);
    } catch (e) {
      //
    }
    return null;
  }

  @override
  void initState() {
    super.initState();
    _refreshKey = GlobalKey<RefreshIndicatorState>();
    load();
  }

  title(title) {
    return Text(
      title,
      style: const TextStyle(fontSize: 20.0, fontWeight: FontWeight.w500),
      maxLines: 2,
      overflow: TextOverflow.ellipsis,
    );
  }

  subtitle(subTitle) {
    return Text(
      subTitle.toString(),
      style: const TextStyle(fontSize: 16.0, fontWeight: FontWeight.w100),
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
    );
  }

  thumbnail(imageUrl) {
    if (imageUrl != null) {
      return Padding(
        padding: const EdgeInsets.only(left: 15.0),
        child: CachedNetworkImage(
          placeholder: (context, url) => Image.asset(placeholderImg),
          imageUrl: imageUrl,
          height: 50,
          width: 70,
          alignment: Alignment.center,
          fit: BoxFit.fill,
        ),
      );
    }
    return null;
  }

  rightIcon() {
    return const Icon(
      Icons.keyboard_arrow_right,
      color: Colors.grey,
      size: 30.0,
    );
  }

  divider() {
    return const Divider(
      height: 1,
      color: Colors.grey,
    );
  }

  list() {
    return ListView.separated(
      separatorBuilder: (context, index) => divider(),
      shrinkWrap: false,
      itemCount: _feed?.items?.length ?? 0,
      itemBuilder: (BuildContext context, int index) {
        final item = _feed!.items![index];
        return ListTile(
          title: title(item.title),
          subtitle: subtitle(item.pubDate),
          leading: thumbnail(item.enclosure?.url),
          trailing: rightIcon(),
          contentPadding: const EdgeInsets.all(5.0),
          onTap: () {
            if (item.link != null) openFeed(item.link!);
          },
        );
      },
    );
  }

  isFeedEmpty() {
    return null == _feed || null == _feed?.items;
  }

  body() {
    return isFeedEmpty()
        ? const Center(
            child: CircularProgressIndicator(),
          )
        : RefreshIndicator(
            key: _refreshKey,
            child: list(),
            onRefresh: () => load(),
          );
  }

  @override
  Widget build(BuildContext context) {
    return body();
  }
}
