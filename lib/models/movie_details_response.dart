import 'dart:convert';

import 'package:movie_buddy/models/movie_data.dart';

import 'meta.dart';

MovieDetailsResponse movieDetailsResponseFromJson(String str) => MovieDetailsResponse.fromJson(json.decode(str));

String movieDetailsResponseToJson(MovieDetailsResponse data) => json.encode(data.toJson());

class MovieDetailsResponse {
  String? status;
  String? statusMessage;
  MovieData? data;
  Meta? meta;

  MovieDetailsResponse({this.status, this.statusMessage, this.data, this.meta});

  MovieDetailsResponse.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    statusMessage = json['status_message'];
    data = json['data'] != null ? MovieData.fromJson(json['data']) : null;
    meta = json['@meta'] != null ? Meta.fromJson(json['@meta']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    data['status_message'] = statusMessage;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    if (meta != null) {
      data['@meta'] = meta!.toJson();
    }
    return data;
  }
}
