// To parse this JSON data, do
//
//     final movieVideosModel = movieVideosModelFromJson(jsonString);

import 'dart:convert';

MovieVideosModel movieVideosModelFromJson(String str) => MovieVideosModel.fromJson(json.decode(str));

String movieVideosModelToJson(MovieVideosModel data) => json.encode(data.toJson());

class MovieVideosModel {
    final int? id;
    final List<Result>? results;

    MovieVideosModel({
        this.id,
        this.results,
    });

    factory MovieVideosModel.fromJson(Map<String, dynamic> json) => MovieVideosModel(
        id: json["id"],
        results: json["results"] == null ? [] : List<Result>.from(json["results"]!.map((x) => Result.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "results": results == null ? [] : List<dynamic>.from(results!.map((x) => x.toJson())),
    };
}

class Result {
    final String? iso6391;
    final String? iso31661;
    final String? name;
    final String? key;
    final String? site;
    final int? size;
    final String? type;
    final bool? official;
    final DateTime? publishedAt;
    final String? id;

    Result({
        this.iso6391,
        this.iso31661,
        this.name,
        this.key,
        this.site,
        this.size,
        this.type,
        this.official,
        this.publishedAt,
        this.id,
    });

    factory Result.fromJson(Map<String, dynamic> json) => Result(
        iso6391: json["iso_639_1"],
        iso31661: json["iso_3166_1"],
        name: json["name"],
        key: json["key"],
        site: json["site"],
        size: json["size"],
        type: json["type"],
        official: json["official"],
        publishedAt: json["published_at"] == null ? null : DateTime.parse(json["published_at"]),
        id: json["id"],
    );

    Map<String, dynamic> toJson() => {
        "iso_639_1": iso6391,
        "iso_3166_1": iso31661,
        "name": name,
        "key": key,
        "site": site,
        "size": size,
        "type": type,
        "official": official,
        "published_at": publishedAt?.toIso8601String(),
        "id": id,
    };
}
