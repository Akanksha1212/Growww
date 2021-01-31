import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';

class Tracks {
  final String days;
  final String details;
  final String id;
  final String img_asset;
  final String name;
  final String type;
  Tracks({
    this.days,
    this.details,
    this.id,
    this.img_asset,
    this.name,
    this.type,
  });

  factory Tracks.fromSnapshot(DocumentSnapshot map) {
    if (map == null) return null;

    return Tracks(
        days: map['days'].toString(),
        details: map['details'],
        id: map['id'].toString(),
        img_asset: map['img_asset'],
        name: map['name'],
        type: map['type'].toString());
  }
}
