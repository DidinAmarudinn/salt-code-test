import 'package:dio/dio.dart';
import 'package:salt_code_test/data/datasource/remote/news_remote_datasource.dart';
import 'package:salt_code_test/data/model/article_model.dart';
import 'package:utils/utils.dart';

import '../../../core/constants/api_constants.dart';

class NewsRemoteDataSourceImpl extends NewsRemoteDataSource {
  final Dio dio;

  NewsRemoteDataSourceImpl({required this.dio});

  @override
  Future<List<ArticleModel>> getNews(int page) async {
    try {
      final response = await dio.get(APIConstants.getNewsUrl,
          queryParameters: {"country": "us", "page": page});
      final List<dynamic> newsList = response.data['articles'];
      final List<ArticleModel> news = newsList.map((json) {
        return ArticleModel.fromJson(json);
      }).toList();
      return news;
    } catch (error) {
      throw ServerException();
    }
  }
}
