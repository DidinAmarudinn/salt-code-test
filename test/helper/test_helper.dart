import 'package:dio/dio.dart';
import 'package:mockito/annotations.dart';
import 'package:salt_code_test/core/helper/database_helper.dart';
import 'package:salt_code_test/core/helper/network_info.dart';
import 'package:salt_code_test/data/datasource/local/news_local_datasource.dart';
import 'package:salt_code_test/data/datasource/remote/news_remote_datasource.dart';
import 'package:salt_code_test/domain/repository/news_repository.dart';
import 'package:salt_code_test/domain/usecase/get_news_usecase.dart';
@GenerateMocks([
  NewsRemoteDataSource,
  NewsLocalDataSource,
  NewsRepository,
  GetNewsUsecase,
  DatabaseHelper,
  InterceptorsWrapper,
  NetworkInfo
], customMocks: [
  MockSpec<Dio>(as: #MockDioClient)
])
void main() {}
