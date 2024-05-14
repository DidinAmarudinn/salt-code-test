import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:salt_code_test/domain/params/pagnation_params.dart';

import 'package:salt_code_test/domain/usecase/get_news_usecase.dart';

import '../../../domain/entities/article.dart';

import 'package:stream_transform/stream_transform.dart';

import 'package:bloc_concurrency/bloc_concurrency.dart';
part 'home_event.dart';
part 'home_state.dart';

const throttleDuration = Duration(milliseconds: 100);

EventTransformer<E> throttleDroppable<E>(Duration duration) {
  return (events, mapper) {
    return droppable<E>().call(events.throttle(duration), mapper);
  };
}

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final GetNewsUsecase getNews;
  HomeBloc({required this.getNews}) : super(HomeState.initial()) {
    on<NewsFetched>(_onNewsFetched);
    on<NextNewsFetched>(_onNextNewsFetched,
        transformer: throttleDroppable(throttleDuration));
  }

  Future<void> _onNewsFetched(
      NewsFetched event, Emitter<HomeState> emit) async {
    const params = PagnationParams(page: 1, offset: 0, limit: 20);
    final articles = await getNews.call(params);
    return articles.fold((l) {
      return emit(
        state.copyWith(
          status: RequestStatus.failure,
          errorMessage: l.message,
        ),
      );
    }, (articles) {
      return emit(
        state.copyWith(
          status: RequestStatus.success,
          page: 2,
          hasReachMax: articles.length < 20,
          articles: filterArticles(articles),
        ),
      );
    });
  }

  Future<void> _onNextNewsFetched(
      HomeEvent event, Emitter<HomeState> emit) async {
    if (state.hasReachMax) return;
    final params = PagnationParams(
        page: state.page, offset: state.articles.length + 1, limit: 20);
    final articles = await getNews.call(params);
    return articles.fold((l) {
      return emit(
        state.copyWith(status: RequestStatus.failure, errorMessage: l.message),
      );
    }, (articles) {
      return emit(
        state.copyWith(
          status: RequestStatus.success,
          page: state.page + 1,
          articles: List.of(state.articles)..addAll(filterArticles(articles)),
          hasReachMax: articles.length < 20,
        ),
      );
    });
  }

  List<Article> filterArticles(List<Article> articles) {
    return articles
        .where((element) =>
            element.title != "[Removed]" && element.urlToImage != null)
        .toList();
  }
}
