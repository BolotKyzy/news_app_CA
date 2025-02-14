import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app_ca/core/resources/data_state.dart';
import 'package:news_app_ca/features/daily_news/domain/use_cases/get_article.dart';
import 'package:news_app_ca/features/daily_news/presentation/bloc/article/remote/remote_article_event.dart';
import 'package:news_app_ca/features/daily_news/presentation/bloc/article/remote/remote_article_state.dart';

class RemoteArticleBloc extends Bloc<RemoteArticleEvent, RemoteArticleState> {
  final GetArticleUseCase _getArticleUseCase;

  RemoteArticleBloc(this._getArticleUseCase)
      : super(const RempoteArticleLoading()) {
    on<GetArticles>(onGetArticles);
  }
  Future<void> onGetArticles(
      GetArticles event, Emitter<RemoteArticleState> emit) async {
    final dataState = await _getArticleUseCase();
    if (dataState is DataSuccess && dataState.data!.isNotEmpty) {
      emit(RempoteArticleDone(dataState.data!));
    }
    if (dataState is DataFailed) {
      emit(RempoteArticleError(dataState.error!));
    }
  }
}
