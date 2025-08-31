// To parse this JSON data, do
//
//     final reportStatistic = reportStatisticFromJson(jsonString);

import 'dart:convert';

ReportStatistic reportStatisticFromJson(String str) =>
    ReportStatistic.fromJson(json.decode(str));

String reportStatisticToJson(ReportStatistic data) =>
    json.encode(data.toJson());

class ReportStatistic {
  String? message;
  Data? data;

  ReportStatistic({this.message, this.data});

  factory ReportStatistic.fromJson(Map<String, dynamic> json) =>
      ReportStatistic(
        message: json["message"],
        data: json["data"] == null ? null : Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {"message": message, "data": data?.toJson()};
}

class Data {
  int? masuk;
  int? proses;
  int? selesai;

  Data({this.masuk, this.proses, this.selesai});

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    masuk: json["masuk"],
    proses: json["proses"],
    selesai: json["selesai"],
  );

  Map<String, dynamic> toJson() => {
    "masuk": masuk,
    "proses": proses,
    "selesai": selesai,
  };
}
