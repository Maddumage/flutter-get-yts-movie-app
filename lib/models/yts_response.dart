import 'package:movie_buddy/models/data.dart';
import 'package:movie_buddy/models/meta.dart';
import 'package:movie_buddy/models/movie.dart';
import 'dart:convert';

YTSResponse ytsResponseFromJson(String str) => YTSResponse.fromJson(json.decode(str));

String ytsResponseToJson(YTSResponse data) => json.encode(data.toJson());

class YTSResponse {
  YTSResponse({
    required this.status,
    required this.statusMessage,
    required this.data,
    required this.meta,
  });

  Stat status;
  String statusMessage;
  Data data;
  Meta meta;

  factory YTSResponse.fromJson(Map<String, dynamic> json) => YTSResponse(
    status: statValues.map[json["status"]]!,
    statusMessage: json["status_message"],
    data: Data.fromJson(json["data"]),
    meta: Meta.fromJson(json["@meta"]),
  );

  Map<String, dynamic> toJson() => {
    "status": statValues.reverse[status],
    "status_message": statusMessage,
    "data": data.toJson(),
    "@meta": meta.toJson(),
  };
}