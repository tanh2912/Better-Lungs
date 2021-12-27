import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fitness_flutter/data/article_model.dart';
import 'package:fitness_flutter/data/news_repository.dart';
import 'news_event.dart';
import 'news_state.dart';


class NewsBloc extends Bloc<NewsEvents, NewsStates> {
  NewsRepository newsRepository;
  NewsBloc({required NewsStates initialState, required this.newsRepository})
      : super(initialState) {
    add(StartEvent());
  }

  @override
  Stream<NewsStates> mapEventToState(NewsEvents event) async* {
    if (event is StartEvent) {
      try {
        List<ArticleModel> _articleList = [];
        yield NewsLoadingState();
        _articleList = await newsRepository.fetchNews();
        yield NewsLoadedState(articleList: _articleList);
      } catch (e) {
        yield NewsErrorState(errorMessage: e.toString());
      }
    }
  }
}