import 'package:salt_code_test/core/helper/type_defs.dart';
import 'package:salt_code_test/domain/entities/article.dart';
import 'package:salt_code_test/domain/params/pagnation_params.dart';

abstract class NewsRepository {
 FutureEither<List<Article>> getNews(PagnationParams params);
}