import 'package:dartz/dartz.dart';
import 'package:salt_code_test/data/datasource/local/news_local_datasource.dart';
import 'package:salt_code_test/data/datasource/remote/news_remote_datasource.dart';
import 'package:salt_code_test/data/model/news_table.dart';
import 'package:salt_code_test/domain/entities/article.dart';
import 'package:salt_code_test/domain/params/pagnation_params.dart';
import 'package:salt_code_test/domain/repository/news_repository.dart';
import 'package:utils/utils.dart';

import '../../core/helper/network_info.dart';
import '../../core/helper/type_defs.dart';

class NewsRepositoryImpl implements NewsRepository {
  final NewsLocalDataSource localDataSource;
  final NewsRemoteDataSource remoteDataSource;
  final NetworkInfo networkInfo;

  NewsRepositoryImpl({
    required this.localDataSource,
    required this.remoteDataSource,
    required this.networkInfo,
  });

  @override
  FutureEither<List<Article>> getNews(PagnationParams params) async {
  if (await networkInfo.isConnected) {
      try {
        final result = await remoteDataSource.getNews(params.page);
        localDataSource.cahceNews(
          result.map((news) => NewsTable.fromDTO(news)).toList(),
        );
        return Right(
          result.map((model) => model.toEntity()).toList(),
        );
      } on ServerException {
        return const Left(
          ServerFailure('Internal Server Error'),
        );
      }
    } else {
      try {
        final result = await localDataSource.getCached(params);
        return Right(result.map((model) => model.toEntity()).toList());
      } on CacheException catch (e) {
        return Left(CacheFailure(e.message));
      }
    }
  }
}
