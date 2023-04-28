import 'package:movies/constance/string.dart';

class VideosModel {
  dynamic id = nullValueName;
  List<Result> result = [];

  VideosModel.fromJson(Map<String, dynamic> json) {
    id = json['id'] ?? nullValueName;
    result = (json['results'] as List).map((e) => Result.fromJson(e)).toList();
  }
}

class Result {
  String name = nullValueName;
  String site = nullValueName;
  String key = nullValueName;
  dynamic size = nullValueName;
  dynamic id = nullValueName;

  Result.fromJson(Map<String, dynamic> json) {
    id = json['id'] ?? nullValueName;
    name = json['name'] ?? nullValueName;
    site = json['site'] ?? nullValueName;
    key = json['key'] ?? nullValueName;
    size = json['size'] ?? nullValueName;
  }
}
