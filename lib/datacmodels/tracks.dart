// To parse this JSON data, do
//
//     final tracks = tracksFromJson(jsonString);

import 'dart:convert';

Tracks tracksFromJson(String str) => Tracks.fromJson(json.decode(str));

String tracksToJson(Tracks data) => json.encode(data.toJson());

class Tracks {
  Tracks({
    this.imgAsset,
    this.name,
    this.days,
    this.details,
    this.id,
    this.type,
    this.tasks,
  });

  String imgAsset;
  String name;
  String days;
  String details;
  String id;
  int type;
  List<Task> tasks;
  int progress = -1;

  factory Tracks.fromJson(Map<String, dynamic> json) => Tracks(
        imgAsset: json["img_asset"],
        name: json["name"],
        days: json["days"],
        details: json["details"],
        id: json["id"],
        type: json["type"],
        tasks: List<Task>.from(json["tasks"].map((x) => Task.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "img_asset": imgAsset,
        "name": name,
        "days": days,
        "details": details,
        "id": id,
        "type": type,
        "tasks": List<dynamic>.from(tasks.map((x) => x.toJson())),
      };
}

class Task {
  Task({
    this.details,
    this.title,
  });

  String details;
  String title;

  factory Task.fromJson(Map<String, dynamic> json) => Task(
        details: json["details"],
        title: json["title"],
      );

  Map<String, dynamic> toJson() => {
        "details": details,
        "title": title,
      };
}
