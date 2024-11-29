import 'package:news_app_ca/features/daily_news/domain/entities/article.dart';

class ArtcileModel extends ArticleEntity {
  const ArtcileModel({
    final int? id,
    final String? author,
    final String? title,
    final String? description,
    final String? url,
    final String? urlToImage,
    final String? publishedAt,
    final String? content,
  }) : super(
          id: id,
          title: title,
          description: description,
          url: url,
          urlToImage: urlToImage,
          publishedAt: publishedAt,
          content: content,
        );

  factory ArtcileModel.fromJson(Map<String, dynamic> map) {
    final parsed = ArtcileModel(
      author: map['author'],
      title: map['title'],
      description: map['description'],
      url: map['url'],
      urlToImage: map['urlToImage'],
      publishedAt: map['publishedAt'],
      content: map['content'],
    );
    return parsed;
  }
}
