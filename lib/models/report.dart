// To parse this JSON data, do
//
//     final trashbagReport = trashbagReportFromJson(jsonString);

import 'dart:convert';

TrashbagReport trashbagReportFromJson(String str) =>
    TrashbagReport.fromJson(json.decode(str));

String trashbagReportToJson(TrashbagReport data) => json.encode(data.toJson());

class TrashbagReport {
  String? message;
  List<Datum>? data;

  TrashbagReport({this.message, this.data});

  factory TrashbagReport.fromJson(Map<String, dynamic> json) => TrashbagReport(
    message: json["message"],
    data: json["data"] == null
        ? []
        : List<Datum>.from(json["data"]!.map((x) => Datum.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "message": message,
    "data": data == null
        ? []
        : List<dynamic>.from(data!.map((x) => x.toJson())),
  };
}

class Datum {
  int? id;
  String? userId;
  String? judul;
  String? isi;
  String? status;
  DateTime? createdAt;
  DateTime? updatedAt;
  String? imagePath;
  String? lokasi;
  String? imageUrl;
  User? user;

  Datum({
    this.id,
    this.userId,
    this.judul,
    this.isi,
    this.status,
    this.createdAt,
    this.updatedAt,
    this.imagePath,
    this.lokasi,
    this.imageUrl,
    this.user,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    id: json["id"],
    userId: json["user_id"],
    judul: json["judul"],
    isi: json["isi"],
    status: json["status"],
    createdAt: json["created_at"] == null
        ? null
        : DateTime.parse(json["created_at"]),
    updatedAt: json["updated_at"] == null
        ? null
        : DateTime.parse(json["updated_at"]),
    imagePath: json["image_path"],
    lokasi: json["lokasi"],
    imageUrl: json["image_url"],
    user: json["user"] == null ? null : User.fromJson(json["user"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "user_id": userId,
    "judul": judul,
    "isi": isi,
    "status": status,
    "created_at": createdAt?.toIso8601String(),
    "updated_at": updatedAt?.toIso8601String(),
    "image_path": imagePath,
    "lokasi": lokasi,
    "image_url": imageUrl,
    "user": user?.toJson(),
  };
}

class User {
  int? id;
  String? name;
  String? email;
  dynamic emailVerifiedAt;
  DateTime? createdAt;
  DateTime? updatedAt;

  User({
    this.id,
    this.name,
    this.email,
    this.emailVerifiedAt,
    this.createdAt,
    this.updatedAt,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
    id: json["id"],
    name: json["name"],
    email: json["email"],
    emailVerifiedAt: json["email_verified_at"],
    createdAt: json["created_at"] == null
        ? null
        : DateTime.parse(json["created_at"]),
    updatedAt: json["updated_at"] == null
        ? null
        : DateTime.parse(json["updated_at"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "email": email,
    "email_verified_at": emailVerifiedAt,
    "created_at": createdAt?.toIso8601String(),
    "updated_at": updatedAt?.toIso8601String(),
  };
}
