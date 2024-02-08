import 'package:cgi_test/domain/entities/random_entity.dart';

class RandomDataModel {
  final String id;
  final String content;
  final String author;
  final String authorSlug;
  final int length;
  final String dateAdded;
  final String dateModified;

  RandomDataModel(
      {required this.id,
      required this.content,
      required this.author,
      required this.authorSlug,
      required this.length,
      required this.dateAdded,
      required this.dateModified});

  // Convert JSON into RandomDataModel
  factory RandomDataModel.fromJson(Map<String, dynamic> json) {
    return RandomDataModel(
        id: json['_id'],
        content: json['content'],
        author: json['author'],
        authorSlug: json['authorSlug'],
        length: json['length'],
        dateAdded: json['dateAdded'],
        dateModified: json['dateModified']);
  }

  // Convert RandomDataModel int JSON
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'content': content,
      'author': author,
      'authorSlug': authorSlug,
      'length': length,
      'dateAdded': dateAdded,
      'dateModified': dateModified
    };
  }

  RandomEntity toEntity() {
    return RandomEntity(
        id: id,
        content: content,
        author: author,
        authorSlug: authorSlug,
        length: length,
        dateAdded: dateAdded,
        dateModified: dateModified);
  }
}
