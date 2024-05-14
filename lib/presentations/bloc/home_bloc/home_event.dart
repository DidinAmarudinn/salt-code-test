part of 'home_bloc.dart';

sealed class HomeEvent extends Equatable {
  const HomeEvent();

  @override
  List<Object> get props => [];
}

class NewsFetched extends HomeEvent {
  @override
  List<Object> get props => [];
}

class NextNewsFetched extends HomeEvent {
  @override
  List<Object> get props => [];
}
