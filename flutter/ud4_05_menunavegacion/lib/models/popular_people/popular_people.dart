import 'dart:convert';
import 'package:ud4_05_menunavegacion/models/popular_people/result.dart';

class PopularPeopleResponse {
  int? page;
  List<Result>? results; 
  int? totalPages;
  int? totalResults;

  PopularPeopleResponse({
    this.page,
    this.results,
    this.totalPages,
    this.totalResults,
  });

  factory PopularPeopleResponse.fromMap(Map<String, dynamic> data) {
    return PopularPeopleResponse(
      page: data['page'] as int?,
      results: (data['results'] as List<dynamic>?)
          ?.map((e) => Result.fromJson(e as Map<String, dynamic>)) 
          .toList(),
      totalPages: data['total_pages'] as int?,
      totalResults: data['total_results'] as int?,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'page': page,
      'results': results?.map((e) => e.toJson()).toList(),
      'total_pages': totalPages,
      'total_results': totalResults,
    };
  }

  factory PopularPeopleResponse.fromJson(String data) {
    return PopularPeopleResponse.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  String toJson() => json.encode(toMap());
}
