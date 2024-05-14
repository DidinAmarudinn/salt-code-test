import 'package:json_annotation/json_annotation.dart';
import 'package:salt_code_test/domain/entities/article.dart';
import 'package:salt_code_test/domain/entities/source.dart';

part 'article_model.g.dart';


@JsonSerializable()
class ArticleModel {
  final SourceModel? source;
  final String? author;
  final String? title;
  final String? description;
  final String? url;
  final String? urlToImage;
  final String? publishedAt;
  final String? content;

  ArticleModel({
    this.source,
    this.author,
    this.title,
    this.description,
    this.url,
    this.urlToImage,
    this.publishedAt,
    this.content,
  });

  Article toEntity() {
    return Article(
      source: source?.toEntity(),
      author: author,
      title: title,
      description: description,
      url: url,
      urlToImage: urlToImage,
      publishedAt: publishedAt,
      content: content,
    );
  }

  factory ArticleModel.fromJson(Map<String, dynamic> json) =>
      _$ArticleModelFromJson(json);

  Map<String, dynamic> toJson() => _$ArticleModelToJson(this);
}

@JsonSerializable()
class SourceModel {
  final String? id;
  final String? name;

  SourceModel({
    this.id,
    this.name,
  });

  Source toEntity() {
    return Source(id: id ??"-", name: name ?? "-");
  }

  factory SourceModel.fromJson(Map<String, dynamic> json) =>
      _$SourceModelFromJson(json);

  Map<String, dynamic> toJson() => _$SourceModelToJson(this);
}
