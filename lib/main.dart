import 'package:flutter/material.dart';

import 'widgets/news_card.dart';
import 'models/news_model.dart';
import 'services/news_services.dart';

void main() {
  runApp(
    // ignore: prefer_const_constructors
    NewsApp(),
  );
}

class NewsApp extends StatefulWidget {
  const NewsApp({Key? key}) : super(key: key);

  @override
  State<NewsApp> createState() => _NewsAppState();
}

class _NewsAppState extends State<NewsApp> {
  late Future<News> futureNews;

  String searchString = '';

  @override
  void initState() {
    super.initState();
    futureNews = fetchNews();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // Remove the debug banner
      debugShowCheckedModeBanner: false,
      // const title: 'News App',
      home: Scaffold(
        // appBar: AppBar(
        // ),
        body: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 30),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15.0),
              child: TextField(
                onChanged: (value) {
                  setState(() {
                    searchString = value.toLowerCase();
                  });
                },
                decoration: const InputDecoration(
                    labelText: 'Поиск', suffixIcon: Icon(Icons.search)),
              ),
            ),
            const SizedBox(height: 10),
            Expanded(
              child: FutureBuilder<News>(
                future: futureNews,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return Center(
                      child: ListView.builder(
                        padding: const EdgeInsets.all(8),
                        itemCount: snapshot.data!.articles.length,
                        itemBuilder: (context, index) {
                          final Article item = snapshot.data!.articles[index];

                          return item.title.toLowerCase().contains(searchString)
                              ? NewsCard(item: item)
                              : Container();
                        },
                      ),
                    );
                  } else if (snapshot.hasError) {
                    return Text('${snapshot.error}');
                  }
                  return const Center(child: CircularProgressIndicator());
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
