// To parse this JSON data, do
//
//     final userData = userDataFromJson(jsonString);

import 'dart:convert';

UserData userDataFromJson(String str) => UserData.fromJson(json.decode(str));

String userDataToJson(UserData data) => json.encode(data.toJson());

class UserData {
    UserData({
        this.tracks,
        this.email,
    });

    List<Track> tracks;
    String email;

    factory UserData.fromJson(Map<String, dynamic> json) => UserData(
        tracks: List<Track>.from(json["tracks"].map((x) => Track.fromJson(x))),
        email: json["email"],
    );

    Map<String, dynamic> toJson() => {
        "tracks": List<dynamic>.from(tracks.map((x) => x.toJson())),
        "email": email,
    };
}

class Track {
    Track({
        this.data,
    });

    Data data;

    factory Track.fromJson(Map<String, dynamic> json) => Track(
        data: Data.fromJson(json["data"]),
    );

    Map<String, dynamic> toJson() => {
        "data": data.toJson(),
    };
}

class Data {
    Data({
        this.id,
        this.taskList,
    });

    String id;
    List<TaskList> taskList;

    factory Data.fromJson(Map<String, dynamic> json) => Data(
        id: json["id"],
        taskList: List<TaskList>.from(json["task_list"].map((x) => TaskList.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "task_list": List<dynamic>.from(taskList.map((x) => x.toJson())),
    };
}

class TaskList {
    TaskList({
        this.details,
        this.timestamp,
    });

    String details;
    String timestamp;

    factory TaskList.fromJson(Map<String, dynamic> json) => TaskList(
        details: json["details"],
        timestamp: json["timestamp"],
    );

    Map<String, dynamic> toJson() => {
        "details": details,
        "timestamp": timestamp,
    };
}
