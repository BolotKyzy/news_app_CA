import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:news_app_ca/features/daily_news/domain/entities/article.dart';

abstract class RemoteArticleState extends Equatable {
  final List<ArticleEntity>? articles;
  final DioException? error;
  const RemoteArticleState({this.articles, this.error});

  @override
  List<Object> get props => [articles!, error!];
}

class RempoteArticleLoading extends RemoteArticleState {
  const RempoteArticleLoading();
}

class RempoteArticleDone extends RemoteArticleState {
  const RempoteArticleDone(List<ArticleEntity> article)
      : super(articles: article);
}

class RempoteArticleError extends RemoteArticleState {
  const RempoteArticleError(DioException error) : super(error: error);
}
