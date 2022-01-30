import 'package:flutter/material.dart';
import 'package:flutter_news_ukraine/models/news_model.dart';
import 'package:url_launcher/url_launcher.dart';

class NewsCard extends StatelessWidget {
  htmlOpenLink() async {
    String url = item.url;
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  const NewsCard({
    Key? key,
    required this.item,
  }) : super(key: key);

  final Article item;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: [
          FadeInImage.assetNetwork(
              placeholder: 'assets/Spinner-1.2s-231px.gif',
              image: item.imageUrl),
          ListTile(
            leading: const CircleAvatar(child: FlutterLogo(size: 20.0)),
            title: Text(
              item.title,
              maxLines: 1,
              softWrap: false,
              overflow: TextOverflow.ellipsis,
            ),
            subtitle: Text(
              item.source + '\n' + item.description,
              maxLines: 2,
              softWrap: false,
              overflow: TextOverflow.ellipsis,
            ),
            onTap: htmlOpenLink,
            trailing: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  item.publishedAt.substring(11, 16),
                ),
                const Icon(
                  Icons.arrow_forward_ios,
                ),
              ],
            ),
            isThreeLine: true,
          ),
        ],
      ),
    );
  }
}
