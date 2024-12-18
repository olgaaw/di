import 'dart:convert';

class KnownFor {
  int? id;
  String? title;
  String? originalTitle;
  String? overview;
  int? popularity;
  String? releaseDate;

  KnownFor({
    this.id,
    this.title,
    this.originalTitle,
    this.overview,
    this.popularity,
    this.releaseDate,
  });

  factory KnownFor.fromMap(Map<String, dynamic> data) {
    return KnownFor(
      id: data['id'] as int?,
      title: data['title'] as String?,
      originalTitle: data['original_title'] as String?,
      overview: data['overview'] as String?,
      popularity: data['popularity'] as int?,
      releaseDate: data['release_date'] as String?,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'original_title': originalTitle,
      'overview': overview,
      'popularity': popularity,
      'release_date': releaseDate,
    };
  }

  factory KnownFor.fromJson(String data) {
    return KnownFor.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  String toJson() => json.encode(toMap());
}
