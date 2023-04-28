import 'package:movies/constance/string.dart';

class PopularModel {
  List<Result> result = [];
  dynamic page = nullValueName;
  PopularModel.fromJson(Map<String, dynamic> json) {
    page = json['page'] ?? nullValueName;
    result = json['results'] == null
        ? []
        : (json['results'] as List).map((e) => Result.fromJson(e)).toList();
  }
}

class Result {
  dynamic id = nullValueName;
  dynamic inSideImage = nullValueName;
  dynamic title = nullValueName;
  dynamic overView = nullValueName;
  dynamic posterImage = nullValueName;
  dynamic releaseDate = nullValueName;
  dynamic voteAverage = nullValueName;

  Result.fromJson(Map<String, dynamic> json) {
    id = json['id'] ?? nullValueName;
    inSideImage = json['backdrop_path'] ?? nullValueName;
    title = json['original_title'] ?? nullValueName;
    overView = json['overview'] ?? nullValueName;
    posterImage = json['poster_path'] ?? nullValueName;
    releaseDate = json['release_date'] ?? nullValueName;
    voteAverage = json['vote_average'] ?? nullValueName;
  }
}
