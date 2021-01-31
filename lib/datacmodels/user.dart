import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';

class UserData {
  final String email;
  final Map<String, String> tracks;
  UserData({
    this.email,
    this.tracks,
  });

  factory UserData.fromSnapshot(DocumentSnapshot map) {
    if (map == null) return null;

    return UserData(
      email: map['email'],
      tracks: Map<String, String>.from(map['tracks']),
    );
  }
}

// class UserTrack {
//   final String task;
//   final DateTime timestamp;
//   UserTrack({
//     this.task,
//     this.timestamp,
//   });

//   factory UserTrack.fromMap(Map<String, dynamic> map) {
//     if (map == null) return null;

//     return UserTrack(
//       task: map['task'],
//       timestamp: DateTime.fromMillisecondsSinceEpoch(map['timestamp']),
//     );
//   }
// }
