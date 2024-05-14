import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:salt_code_test/core/constants/api_constants.dart';
import 'package:salt_code_test/data/datasource/remote/news_remote_datasource_impl.dart';
import 'package:salt_code_test/data/model/article_model.dart';
import 'package:salt_code_test/domain/params/pagnation_params.dart';
import 'package:utils/utils.dart';

import '../../helper/json_reader.dart';
import '../../helper/test_helper.mocks.dart';

void main() {
  late NewsRemoteDataSourceImpl remoteDataSourceImpl;
  late MockDioClient mockDioClient;
  const params = PagnationParams(limit: 20, offset: 0, page: 1);

  setUp(() {
    mockDioClient = MockDioClient();
    remoteDataSourceImpl = NewsRemoteDataSourceImpl(dio: mockDioClient);
  });

  group("Remote Data Source", () {
    final queryParams = {"country": "us", "page": params.page};
    test(
      'should return list article model when success get news',
      () async {
        // arrange
        when(mockDioClient.get(APIConstants.getNewsUrl, queryParameters: queryParams))
            .thenAnswer(
          (_) async => Response(
            data: json.decode(
              readJson('dummy_data/news.json'),
            ),
            statusCode: 200,
            requestOptions: RequestOptions(path: ''),
          ),
        );
        // act
        final result = await remoteDataSourceImpl.getNews(params.page);
        // assert
        expect(result, isA<List<ArticleModel>>());
      },
    );

    test(
      'should throw an error when failed get news',
      () async {
        // arrange
        when(mockDioClient.get(APIConstants.getNewsUrl,
                queryParameters: queryParams))
            .thenThrow(DioException(
          response: Response(
            statusCode: 401,
            requestOptions: RequestOptions(path: ''),
          ),
          requestOptions: RequestOptions(path: ''),
        ));
        // act
        expect(
          () => remoteDataSourceImpl.getNews(params.page),
          throwsA(isA<ServerException>()),
        );
      },
    );
    
  });
}
