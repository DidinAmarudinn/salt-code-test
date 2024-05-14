import 'package:equatable/equatable.dart';
import 'package:salt_code_test/data/model/article_model.dart';
import 'package:salt_code_test/domain/entities/article.dart';
import 'package:salt_code_test/domain/entities/source.dart';

class NewsTable extends Equatable {
  final String? sourceId;
  final String? sourceName;
  final String? author;
  final String title;
  final String? description;
  final String? url;
  final String? urlToImage;
  final String? publishedAt;
  final String? content;

  const NewsTable({
    this.sourceId,
    this.sourceName,
    this.author,
   required this.title,
    this.description,
    this.url,
    this.urlToImage,
    this.publishedAt,
    this.content,
  });

  @override
  List<Object?> get props => [
        sourceId,
        sourceName,
        author,
        title,
        description,
        url,
        urlToImage,
        publishedAt,
        content,
      ];

  Map<String, dynamic> toMap() {
    return {
      'sourceId': sourceId,
      'sourceName': sourceName,
      'author': author,
      'title': title,
      'description': description,
      'url': url,
      'urlToImage': urlToImage,
      'publishedAt': publishedAt,
      'content': content,
    };
  }

  factory NewsTable.fromMap(Map<String, dynamic> map) {
    return NewsTable(
      sourceId: map['sourceId'],
      sourceName: map['sourceName'],
      author: map['author'],
      title: map['title'],
      description: map['description'],
      url: map['url'],
      urlToImage: map['urlToImage'],
      publishedAt: map['publishedAt'],
      content: map['content'],
    );
  }

  factory NewsTable.fromDTO(ArticleModel article) {
    return NewsTable(
      sourceId: article.source?.id,
      sourceName: article.source?.name,
      author: article.author,
      title: article.title ?? "-",
      description: article.description,
      url: article.url,
      urlToImage: article.urlToImage,
      publishedAt: article.publishedAt,
      content: article.content,
    );
  }

  Article toEntity() {
    return Article(
      author: author,
      source: Source(id: sourceId ?? "-", name: sourceName ?? "-"),
      title: title,
      description: description,
      url: url,
      publishedAt: publishedAt,
      urlToImage: urlToImage,
      content: content
    );
  }
}
