import 'package:equatable/equatable.dart';

class RandomEntity extends Equatable {
  final String id;
  final String content;
  final String author;
  final String authorSlug;
  final int length;
  final String dateAdded;
  final String dateModified;

  RandomEntity(
      {required this.id,
      required this.content,
      required this.author,
      required this.authorSlug,
      required this.length,
      required this.dateAdded,
      required this.dateModified});

  @override
  List<Object?> get props =>
      [id, content, author, authorSlug, length, dateAdded, dateModified];
}
