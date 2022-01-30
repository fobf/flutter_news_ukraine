import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:flutter_news_ukraine/models/news_model.dart';

const url = 'https://newsapi.org/v2/top-headlines?country=ua&apiKey=$apiKey';

const apiKey = '';

Future<News> fetchNews() async {
  final response = await http.get(Uri.parse(url));

  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.

    // print(response.body);
    return News.fromJson(jsonDecode(response.body));
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load');
  }
}
