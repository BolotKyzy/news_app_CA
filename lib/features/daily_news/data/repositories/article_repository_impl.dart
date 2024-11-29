import 'package:news_app_ca/core/resources/data_state.dart';
import 'package:news_app_ca/features/daily_news/data/models/article.dart';
import 'package:news_app_ca/features/daily_news/domain/repository/article_repository.dart';

class ArticleRepositoryImpl implements ArticleRepository {
  @override
  Future<DataState<List<ArtcileModel>>> getNewsArticle() {
    throw UnimplementedError();
  }
}
