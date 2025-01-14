import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app_ca/features/daily_news/presentation/bloc/article/remote/remote_article_bloc.dart';
import 'package:news_app_ca/features/daily_news/presentation/bloc/article/remote/remote_article_state.dart';
import 'package:news_app_ca/features/daily_news/presentation/widgets/article_widgets.dart';

class DailyNews extends StatelessWidget {
  const DailyNews({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Daily News',
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: _buildBody(),
    );
  }

  _buildBody() {
    return BlocBuilder<RemoteArticleBloc, RemoteArticleState>(
        builder: (_, state) {
      if (state is RempoteArticleLoading) {
        return const Center(
          child: CupertinoActivityIndicator(),
        );
      }

      if (state is RempoteArticleError) {
        return const Center(
          child: Icon(Icons.refresh),
        );
      }
      if (state is RempoteArticleDone) {
        return ListView.builder(
            itemCount: state.articles!.length,
            itemBuilder: (context, index) {
              return ArticleWidgets(
                article: state.articles![index],
              );
            });
      }

      return const SizedBox();
    });
  }
}
