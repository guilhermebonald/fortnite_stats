// To parse this JSON data, do
//
//     final fortniteModel = fortniteModelFromJson(jsonString);

import 'dart:convert';

FortniteModel fortniteModelFromJson(String str) =>
    FortniteModel.fromJson(json.decode(str));

String fortniteModelToJson(FortniteModel data) => json.encode(data.toJson());

class FortniteModel {
  FortniteModel({
    this.accountId,
    this.avatar,
    this.platformId,
    this.platformName,
    this.platformNameLong,
    this.epicUserHandle,
    this.stats,
    this.lifeTimeStats,
    this.recentMatches,
  });

  String accountId;
  String avatar;
  int platformId;
  String platformName;
  String platformNameLong;
  String epicUserHandle;
  Stats stats;
  List<LifeTimeStat> lifeTimeStats;
  List<dynamic> recentMatches;

  factory FortniteModel.fromJson(Map<String, dynamic> json) => FortniteModel(
        accountId: json["accountId"],
        avatar: json["avatar"],
        platformId: json["platformId"],
        platformName: json["platformName"],
        platformNameLong: json["platformNameLong"],
        epicUserHandle: json["epicUserHandle"],
        stats: Stats.fromJson(json["stats"]),
        lifeTimeStats: List<LifeTimeStat>.from(
            json["lifeTimeStats"].map((x) => LifeTimeStat.fromJson(x))),
        recentMatches: List<dynamic>.from(json["recentMatches"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "accountId": accountId,
        "avatar": avatar,
        "platformId": platformId,
        "platformName": platformName,
        "platformNameLong": platformNameLong,
        "epicUserHandle": epicUserHandle,
        "stats": stats.toJson(),
        "lifeTimeStats":
            List<dynamic>.from(lifeTimeStats.map((x) => x.toJson())),
        "recentMatches": List<dynamic>.from(recentMatches.map((x) => x)),
      };
}

class LifeTimeStat {
  LifeTimeStat({
    this.key,
    this.value,
  });

  String key;
  String value;

  factory LifeTimeStat.fromJson(Map<String, dynamic> json) => LifeTimeStat(
        key: json["key"],
        value: json["value"],
      );

  Map<String, dynamic> toJson() => {
        "key": key,
        "value": value,
      };
}

class Stats {
  Stats({
    this.p2,
    this.p10,
    this.p9,
    this.ltm,
    this.trios,
  });

  Map<String, Ltm> p2;
  Map<String, Ltm> p10;
  Map<String, Ltm> p9;
  Map<String, Ltm> ltm;
  Map<String, Ltm> trios;

  factory Stats.fromJson(Map<String, dynamic> json) => Stats(
        p2: json['p2'] == null
            ? null
            : Map.from(json["p2"])
                .map((k, v) => MapEntry<String, Ltm>(k, Ltm.fromJson(v))),
        p10: json['p10'] == null
            ? null
            : Map.from(json["p10"])
                .map((k, v) => MapEntry<String, Ltm>(k, Ltm.fromJson(v))),
        p9: json['p9'] == null
            ? null
            : Map.from(json["p9"])
                .map((k, v) => MapEntry<String, Ltm>(k, Ltm.fromJson(v))),
        ltm: json['ltm'] == null
            ? null
            : Map.from(json["ltm"])
                .map((k, v) => MapEntry<String, Ltm>(k, Ltm.fromJson(v))),
        trios: json['trios'] == null
            ? null
            : Map.from(json["trios"])
                .map((k, v) => MapEntry<String, Ltm>(k, Ltm.fromJson(v))),
      );

  Map<String, dynamic> toJson() => {
        "p2": Map.from(p2)
            .map((k, v) => MapEntry<String, dynamic>(k, v.toJson())),
        "p10": Map.from(p10)
            .map((k, v) => MapEntry<String, dynamic>(k, v.toJson())),
        "p9": Map.from(p9)
            .map((k, v) => MapEntry<String, dynamic>(k, v.toJson())),
        "ltm": Map.from(ltm)
            .map((k, v) => MapEntry<String, dynamic>(k, v.toJson())),
        "trios": Map.from(trios)
            .map((k, v) => MapEntry<String, dynamic>(k, v.toJson())),
      };
}

class Ltm {
  Ltm({
    this.label,
    this.field,
    this.category,
    this.valueDec,
    this.value,
    this.percentile,
    this.displayType,
    this.displayValue,
    this.rank,
    this.valueInt,
  });

  String label;
  String field;
  Category category;
  double valueDec;
  String value;
  double percentile;
  int displayType;
  String displayValue;
  int rank;
  int valueInt;

  factory Ltm.fromJson(Map<String, dynamic> json) => Ltm(
        label: json["label"],
        field: json["field"],
        category: categoryValues.map[json["category"]],
        valueDec: json["valueDec"] == null ? null : json["valueDec"].toDouble(),
        value: json["value"],
        percentile:
            json["percentile"] == null ? null : json["percentile"].toDouble(),
        displayType: json["displayType"],
        displayValue: json["displayValue"],
        rank: json["rank"] == null ? null : json["rank"],
        valueInt: json["valueInt"] == null ? null : json["valueInt"],
      );

  Map<String, dynamic> toJson() => {
        "label": label,
        "field": field,
        "category": categoryValues.reverse[category],
        "valueDec": valueDec == null ? null : valueDec,
        "value": value,
        "percentile": percentile == null ? null : percentile,
        "displayType": displayType,
        "displayValue": displayValue,
        "rank": rank == null ? null : rank,
        "valueInt": valueInt == null ? null : valueInt,
      };
}

enum Category { GENERAL, TOPS, RATING }

final categoryValues = EnumValues({
  "General": Category.GENERAL,
  "Rating": Category.RATING,
  "Tops": Category.TOPS
});

class EnumValues<T> {
  Map<String, T> map;
  Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    if (reverseMap == null) {
      reverseMap = map.map((k, v) => new MapEntry(v, k));
    }
    return reverseMap;
  }
}
