import 'package:movies/constance/string.dart';

class UpComing {
  List<Result> result = [];
  dynamic page = nullValueName;
  UpComing.fromJson(Map<String, dynamic> json) {
    page = json['page'] ?? nullValueName;
    result = page == 1
        ? (json['results'] as List).map((e) => Result.fromJson(e)).toList()
        : [];
  }
}

class Result {
  dynamic id = nullValueName;
  String inSideImage = nullValueName;
  String title = nullValueName;
  String overView = nullValueName;
  String posterImage = nullValueName;
  String releaseDate = nullValueName;
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
