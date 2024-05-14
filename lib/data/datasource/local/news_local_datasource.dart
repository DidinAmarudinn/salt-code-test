import 'package:salt_code_test/data/model/news_table.dart';
import 'package:salt_code_test/domain/params/pagnation_params.dart';

abstract class NewsLocalDataSource {
  Future<void> cahceNews(List<NewsTable> news);
  Future<List<NewsTable>> getCached(PagnationParams params);
}
