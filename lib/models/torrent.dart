import '../constants/enums.dart';

enum Quality { THE_720_P, THE_1080_P }

final qualityValues = EnumValues({
  "1080p": Quality.THE_1080_P,
  "720p": Quality.THE_720_P
});

enum Type { WEB, BLURAY }

final typeValues = EnumValues({
  "bluray": Type.BLURAY,
  "web": Type.WEB
});

class Torrent {
  Torrent({
    required this.url,
    required this.hash,
    required this.quality,
    required this.type,
    required this.seeds,
    required this.peers,
    required this.size,
    required this.sizeBytes,
    required this.dateUploaded,
    required this.dateUploadedUnix,
  });

  String url;
  String hash;
  Quality quality;
  Type type;
  int seeds;
  int peers;
  String size;
  int sizeBytes;
  DateTime dateUploaded;
  int dateUploadedUnix;

  factory Torrent.fromJson(Map<String, dynamic> json) => Torrent(
    url: json["url"],
    hash: json["hash"],
    quality: qualityValues.map[json["quality"]] ?? Quality.THE_720_P,
    type: typeValues.map[json["type"]] ?? Type.WEB,
    seeds: json["seeds"],
    peers: json["peers"],
    size: json["size"],
    sizeBytes: json["size_bytes"],
    dateUploaded: DateTime.parse(json["date_uploaded"]),
    dateUploadedUnix: json["date_uploaded_unix"],
  );

  Map<String, dynamic> toJson() => {
    "url": url,
    "hash": hash,
    "quality": qualityValues.reverse[quality],
    "type": typeValues.reverse[type],
    "seeds": seeds,
    "peers": peers,
    "size": size,
    "size_bytes": sizeBytes,
    "date_uploaded": dateUploaded.toIso8601String(),
    "date_uploaded_unix": dateUploadedUnix,
  };
}