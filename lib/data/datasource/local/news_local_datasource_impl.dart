import 'package:salt_code_test/core/helper/database_helper.dart';
import 'package:salt_code_test/data/datasource/local/news_local_datasource.dart';
import 'package:salt_code_test/data/model/news_table.dart';
import 'package:salt_code_test/domain/params/pagnation_params.dart';
import 'package:utils/utils.dart';

class NewsLocalDataSourceImpl extends NewsLocalDataSource {
  final DatabaseHelper databaseHelper;

  NewsLocalDataSourceImpl({required this.databaseHelper});

  @override
  Future<void> cahceNews(List<NewsTable> news) async {
    await databaseHelper.clearCache();
    await databaseHelper.insertCacheTransaction(news);
  }

  @override
  Future<List<NewsTable>> getCached(PagnationParams params) async {
   try {
      final result = await databaseHelper.getNewsCache(params);
      if (result.isNotEmpty) {
        return result.map((news) => NewsTable.fromMap(news)).toList();
      } else {
        return [];
      }
    } catch (_) {
      throw CacheException("Can't get the data");
    }
  }
}
