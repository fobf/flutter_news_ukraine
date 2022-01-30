class News {
  final List<Article> articles;

  News({
    required this.articles,
  });

  factory News.fromJson(Map<String, dynamic> json) {
    var list = json['articles'] as List;
    List<Article> articleList = list.map((i) => Article.fromJson(i)).toList();
    return News(
      articles: articleList,
    );
  }
}

class Article {
  final String title;
  final String source;
  final String description;
  final String imageUrl;
  final String url;
  final String publishedAt;
  Article({
    required this.publishedAt,
    required this.url,
    required this.source,
    required this.title,
    required this.imageUrl,
    required this.description,
  });

  factory Article.fromJson(Map<String, dynamic> json) {
    return Article(
      source: json['source']['name'],
      title: json['title'],
      imageUrl: json['urlToImage'],
      description: json['description'],
      url: json['url'],
      publishedAt: json['publishedAt'],
    );
  }
}
