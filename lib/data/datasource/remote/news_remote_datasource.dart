import 'package:salt_code_test/data/model/article_model.dart';

abstract class NewsRemoteDataSource {
  Future<List<ArticleModel>> getNews(int page);
}