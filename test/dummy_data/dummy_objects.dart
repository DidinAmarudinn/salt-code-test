import 'package:salt_code_test/data/model/article_model.dart';
import 'package:salt_code_test/data/model/news_table.dart';
import 'package:salt_code_test/domain/entities/article.dart';
import 'package:salt_code_test/domain/params/pagnation_params.dart';

NewsTable tNewsCache = const NewsTable(
  sourceId: "",
  sourceName: "Fox News",
  url: "",
  title:
      "Sublinguale Therapie verbessert Prognose nach Schlaganfall - Ärzte Zeitung",
  urlToImage:
      "https://news.google.com/rss/articles/CBMia2h0dHBzOi8vd3d3LmFlcnp0ZXplaXR1bmcuZGUvTWVkaXppbi9TdWJsaW5ndWFsZS1UaGVyYXBpZS12ZXJiZXNzZXJ0LVByb2dub3NlLW5hY2gtU2NobGFnYW5mYWxsLTQ0ODI5My5odG1s0gEA?oc=5",
  description: null,
  publishedAt: "2024-05-13T02:02:31Z",
  content: null,
);

final tNewsMap = {
  "sourceId": "",
  "sourceName": "Fox News",
  "url": "",
  "title":
      "Sublinguale Therapie verbessert Prognose nach Schlaganfall - Ärzte Zeitung",
  "urlToImage":
      "https://news.google.com/rss/articles/CBMia2h0dHBzOi8vd3d3LmFlcnp0ZXplaXR1bmcuZGUvTWVkaXppbi9TdWJsaW5ndWFsZS1UaGVyYXBpZS12ZXJiZXNzZXJ0LVByb2dub3NlLW5hY2gtU2NobGFnYW5mYWxsLTQ0ODI5My5odG1s0gEA?oc=5",
  "description": null,
  "publishedAt": "2024-05-13T02:02:31Z",
  "content": null
};

final tArticlesModel = [
  ArticleModel(
    source: SourceModel(id: "", name: "Fox News"),
    url: "",
    title:
        "Sublinguale Therapie verbessert Prognose nach Schlaganfall - Ärzte Zeitung",
    urlToImage:
        "https://news.google.com/rss/articles/CBMia2h0dHBzOi8vd3d3LmFlcnp0ZXplaXR1bmcuZGUvTWVkaXppbi9TdWJsaW5ndWFsZS1UaGVyYXBpZS12ZXJiZXNzZXJ0LVByb2dub3NlLW5hY2gtU2NobGFnYW5mYWxsLTQ0ODI5My5odG1s0gEA?oc=5",
    description: null,
    publishedAt: "2024-05-13T02:02:31Z",
    content: null,
  )
];

final tArticles = [
  Article(
     source: SourceModel(id: "", name: "Fox News").toEntity(),
    url: "",
    title:
        "Sublinguale Therapie verbessert Prognose nach Schlaganfall - Ärzte Zeitung",
    urlToImage:
        "https://news.google.com/rss/articles/CBMia2h0dHBzOi8vd3d3LmFlcnp0ZXplaXR1bmcuZGUvTWVkaXppbi9TdWJsaW5ndWFsZS1UaGVyYXBpZS12ZXJiZXNzZXJ0LVByb2dub3NlLW5hY2gtU2NobGFnYW5mYWxsLTQ0ODI5My5odG1s0gEA?oc=5",
    description: null,
    publishedAt: "2024-05-13T02:02:31Z",
    content: null,
  )
];

const tParams = PagnationParams(limit: 20, offset: 0, page: 1);
