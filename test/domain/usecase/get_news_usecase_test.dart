import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:salt_code_test/domain/repository/news_repository.dart';
import 'package:salt_code_test/domain/usecase/get_news_usecase.dart';

import '../../dummy_data/dummy_objects.dart';
import '../../helper/test_helper.mocks.dart';

void main() {
  late GetNewsUsecase getNewsUsecase;
  late NewsRepository mockRepository;

  setUp(() {
    mockRepository = MockNewsRepository();
    getNewsUsecase = GetNewsUsecase(mockRepository);
  });


  test(
    'should call getNews and return list news from news repository',
    () async {
      // arrange
      when(mockRepository.getNews(tParams))
          .thenAnswer((_) async => right(tArticles));
      // act
      final result = await getNewsUsecase.call(tParams);
      verify(mockRepository.getNews(tParams));
      // assert
      expect(result, right(tArticles));
    },
  );
  
}
