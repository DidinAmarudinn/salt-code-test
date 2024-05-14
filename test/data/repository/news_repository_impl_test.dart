import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:salt_code_test/data/datasource/local/news_local_datasource.dart';
import 'package:salt_code_test/data/datasource/remote/news_remote_datasource.dart';
import 'package:salt_code_test/data/repositories/news_repository_impl.dart';
import 'package:utils/utils.dart';
import '../../dummy_data/dummy_objects.dart';
import '../../helper/test_helper.mocks.dart';

void main() {
  late NewsRepositoryImpl repository;
  late NewsRemoteDataSource mockRemoteDataSource;
  late NewsLocalDataSource mockLocalDataSource;
  late MockNetworkInfo mockNetworkInfo;

  setUp(() {
    mockRemoteDataSource = MockNewsRemoteDataSource();
    mockLocalDataSource = MockNewsLocalDataSource();
    mockNetworkInfo = MockNetworkInfo();
    repository = NewsRepositoryImpl(
        remoteDataSource: mockRemoteDataSource,
        localDataSource: mockLocalDataSource,
        networkInfo: mockNetworkInfo);
  });

  group("Get Pokemons", () {
    test(
      'should check if device is online',
      () async {
        // arrange
        when(mockNetworkInfo.isConnected).thenAnswer((_) async => true);
        when(mockRemoteDataSource.getNews(tParams.page))
            .thenAnswer((_) async => []);
        // act
        await repository.getNews(tParams);
        // assert
        verify(mockNetworkInfo.isConnected);
      },
    );

    group("When device is online", () { 
      setUp(() {
        when(mockNetworkInfo.isConnected).thenAnswer((_) async => true);
      });
      test('should return article list when call to data source is success',
          () async {
        // arrange
        when(mockRemoteDataSource.getNews(tParams.page))
            .thenAnswer((_) async => tArticlesModel);
        // act
        final result = await repository.getNews(tParams);
        // assert
        final resultList = result.getOrElse(() => []);
        expect(resultList, tArticles);
      });

      test(
        'should cache data locally when the call to remote data source is successful',
        () async {
          // arrange
          when(mockRemoteDataSource.getNews(tParams.page))
              .thenAnswer((_) async => tArticlesModel);
          // act
          await repository.getNews(tParams);
          // assert
          verify(mockRemoteDataSource.getNews(tParams.page));
          verify(mockLocalDataSource.cahceNews([tNewsCache]));
        },
      );

      test(
          'should return server failure when call to data source is unsuccessful',
          () async {
        // arrange
        when(mockRemoteDataSource.getNews(tParams.page))
            .thenThrow(ServerException());
        // act
        final result = await repository.getNews(tParams);
        // assert
        expect(result, const Left(ServerFailure('Internal Server Error')));
      });
    });

    group("when device is offline", () {
      setUp(() {
        when(mockNetworkInfo.isConnected).thenAnswer((_) async => false);
      });
      test(
        'should return cached news data when device is offline',
        () async {
          // arrange
          when(mockLocalDataSource.getCached(tParams))
              .thenAnswer((_) async => [tNewsCache]);
          // act
          final result = await repository.getNews(tParams);
          // assert
          verify(mockLocalDataSource.getCached(tParams));
          final resultList = result.getOrElse(() => []);
          expect(resultList, tArticles);
        },
      );
      test(
        'should return CacheFailure when app has no cache',
        () async {
          // arrange
          // arrange
          when(mockLocalDataSource.getCached(tParams))
              .thenThrow(CacheException('No Cache'));
          // act
          final result = await repository.getNews(tParams);
          // assert
          verify(mockLocalDataSource.getCached(tParams));
          expect(result, const Left(CacheFailure('No Cache')));
        },
      );
    });
  });
}
