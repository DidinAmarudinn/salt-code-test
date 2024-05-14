import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:salt_code_test/presentations/bloc/home_bloc/home_bloc.dart';

import '../../dummy_data/dummy_objects.dart';
import '../../helper/test_helper.mocks.dart';

void main() {
  late HomeBloc homeBloc;
  late MockGetNewsUsecase mockGetNewsUsecase;

  setUp(() {
    mockGetNewsUsecase = MockGetNewsUsecase();
    homeBloc = HomeBloc(getNews: mockGetNewsUsecase);
  });

  group("Home Bloc", () {
    blocTest<HomeBloc, HomeState>(
      "NewsFetched Event"
      "should emit requestState initial and requestStatte success when get data is successfull",
      build: () {
        when(mockGetNewsUsecase.call(tParams))
            .thenAnswer((_) async => Right(tArticles));

        return homeBloc;
      },
      seed: () => HomeState.initial(),
      act: (bloc) => bloc.add(NewsFetched()),
      expect: () => [
        const HomeState().copyWith(
          status: RequestStatus.success,
          articles: tArticles,
          page: 2,
          hasReachMax: true,
          errorMessage: ""
        ),
      ],
      verify: (bloc) {
        verify(mockGetNewsUsecase.call(tParams));
      },
    );

    blocTest<HomeBloc, HomeState>(
      "NextNewsFetched Event"
      "should emit requestState initial and requestStatte success when get data is successfull",
      build: () {
        when(mockGetNewsUsecase.call(tParams.copyWith(offset: 1)))
            .thenAnswer((_) async => Right(tArticles));

        return homeBloc;
      },
      act: (bloc) => bloc.add(NextNewsFetched()),
      expect: () => [
        const HomeState().copyWith(
          status: RequestStatus.success,
          articles: tArticles,
          page: 2,
          hasReachMax: true,
          errorMessage: ""
        ),
      ],
      verify: (bloc) {
        verify(mockGetNewsUsecase.call(tParams.copyWith(offset: 1)));
      },
    );
  });
}
