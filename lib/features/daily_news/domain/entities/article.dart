import 'package:equatable/equatable.dart';

class ArticleEntity extends Equatable {
  final int? id;
  // final String? author;
  final String? title;
  final String? description;
  final String? url;
  final String? country;
  final String? urlToImage;
  final String? publishedAt;
  final String? content;

  const ArticleEntity({
    this.id,
    this.country,
    this.title,
    this.description,
    this.url,
    this.urlToImage,
    this.publishedAt,
    this.content,
  });

  @override
  List<Object?> get props {
    return [
      id,
      country,
      title,
      description,
      url,
      urlToImage,
      publishedAt,
      content
    ];
  }
}
