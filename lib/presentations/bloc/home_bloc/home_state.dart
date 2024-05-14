part of 'home_bloc.dart';

enum RequestStatus { intital, success, failure }

final class HomeState extends Equatable {
  final RequestStatus status;
  final String errorMessage;
  final bool hasReachMax;
  final List<Article> articles;
  final int page;

  const HomeState(
      {this.articles = const <Article>[],
      this.status = RequestStatus.intital,
      this.errorMessage = "",
      this.hasReachMax = false,
      this.page = 1});

  @override
  List<Object> get props => [status, errorMessage, hasReachMax, articles, page];

  factory HomeState.initial() => const HomeState(
      articles : <Article>[],
      status : RequestStatus.intital,
      errorMessage : "",
      hasReachMax : false,
      page : 1);

  HomeState copyWith(
      {RequestStatus? status,
      String? errorMessage,
      bool? hasReachMax,
      List<Article>? articles,
      int? page}) {
    return HomeState(
        status: status ?? this.status,
        errorMessage: errorMessage ?? this.errorMessage,
        hasReachMax: hasReachMax ?? this.hasReachMax,
        articles: articles ?? this.articles,
        page: page ?? this.page);
  }
}
