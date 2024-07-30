// To parse this JSON data, do
//
//     final photoListModel = photoListModelFromJson(jsonString);

import 'dart:convert';

List<PhotoListModel> photoListModelFromJson(String str) =>
    List<PhotoListModel>.from(
        json.decode(str).map((x) => PhotoListModel.fromJson(x)));

String photoListModelToJson(List<PhotoListModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class PhotoListModel {
  final int? albumId;
  final int? id;
  final String? title;
  final String? url;
  final String? thumbnailUrl;

  PhotoListModel({
    this.albumId,
    this.id,
    this.title,
    this.url,
    this.thumbnailUrl,
  });

  factory PhotoListModel.fromJson(Map<String, dynamic> json) => PhotoListModel(
        albumId: json["albumId"],
        id: json["id"],
        title: json["title"],
        url: json["url"],
        thumbnailUrl: json["thumbnailUrl"],
      );

  Map<String, dynamic> toJson() => {
        "albumId": albumId,
        "id": id,
        "title": title,
        "url": url,
        "thumbnailUrl": thumbnailUrl,
      };
}
