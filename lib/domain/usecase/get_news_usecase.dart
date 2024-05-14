import 'package:salt_code_test/core/helper/type_defs.dart';
import 'package:salt_code_test/domain/entities/article.dart';
import 'package:salt_code_test/domain/params/pagnation_params.dart';
import 'package:salt_code_test/domain/repository/news_repository.dart';
import '../../core/abstract/usecase.dart';

class GetNewsUsecase implements Usecase<List<Article>, PagnationParams> {
  final NewsRepository _repositories;

  const GetNewsUsecase(this._repositories);
  
  @override
  FutureEither<List<Article>> call(PagnationParams params) {
    return _repositories.getNews(params);
  }
}