import 'dart:io';

import 'package:dio/dio.dart';
import 'package:news_app_ca/core/constants/constants.dart';
import 'package:news_app_ca/core/resources/data_state.dart';
import 'package:news_app_ca/features/daily_news/data/data_sources/remote/news_api_service.dart';
import 'package:news_app_ca/features/daily_news/data/models/article.dart';
import 'package:news_app_ca/features/daily_news/domain/repository/article_repository.dart';

class ArticleRepositoryImpl implements ArticleRepository {
  final NewsApiService _newsApiService;
  ArticleRepositoryImpl(this._newsApiService);
  @override
  Future<DataState<List<ArtcileModel>>> getNewsArticles() async {
    try {
      final httpResponse = await _newsApiService.getNewsArticles(
        apiKey: newsAPIKey,
        country: countryQuery,
        category: categoryQuery,
      );
      if (httpResponse.response.statusCode == HttpStatus.ok) {
        return DataSuccess(httpResponse.data);
      } else {
        print("L-----------------------------------");
        print(httpResponse.response.statusCode);
        return DataFailed(DioException(requestOptions: RequestOptions()));
      }
    } on DioException catch (e) {
      print(e);
      return DataFailed(e);
    }
  }
}
