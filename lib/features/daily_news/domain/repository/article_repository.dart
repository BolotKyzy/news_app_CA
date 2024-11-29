import 'package:news_app_ca/core/resources/data_state.dart';
import 'package:news_app_ca/features/daily_news/domain/entities/article.dart';

abstract class ArticleRepository {
  Future<DataState<List<ArticleEntity>>> getNewsArticle();
}
