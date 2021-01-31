import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:grow/datacmodels/tracks.dart';
import 'package:grow/datacmodels/user.dart';

class FirestoreService {
  final firestoreInstance = FirebaseFirestore.instance;
  List<Tracks> _tracks = [];

  /// This function takes [email] and returns list of all tracks, along with user progress
  Future<List<Tracks>> fetchData(String email) async {
    final userData = await getActiveTracks(email);
    _tracks.clear();
    await firestoreInstance.collection('tracks').get().then(
          (value) => value.docs.forEach(
            (element) {
              var track = tracksFromJson(json.encode(element.data()));
              userData.tracks.forEach((element) {
                if (element.data.id == track.id) {
                  track.progress =
                      (element.data.taskList.length * 10 / 3).round();
                }
              });
              _tracks.add(track);
              return;
            },
          ),
        );
    return _tracks;
  }

  /// Checks if an [email] is already registered or is a new user
  Future<void> isUser(String email) async {
    await firestoreInstance
        .collection('users')
        .where("email", isEqualTo: email)
        .get()
        .then((value) {
      if (value.docs.length == 0) addUser(email);
    });
  }

  /// If user is a new user, adds a document coresponding to the user
  Future<void> addUser(String email) {
    Map<String, dynamic> dataMap = {"email": email, "tracks": []};
    firestoreInstance.collection('users').add(dataMap);
    return null;
  }

  /// Gets [UserData], which contais user's email and list of tracks
  Future<UserData> getActiveTracks(String email) async {
    var toreturn;
    await firestoreInstance
        .collection('users')
        .where('email', isEqualTo: email)
        .get()
        .then((value) => toreturn = value.docs[0].data());
    return userDataFromJson(json.encode(toreturn));
  }

  /// Given a track id and user email, returns a [List<TaskList>]
  /// A [TaskList] is added to a track when user confirms a task in a track
  Future<List<TaskList>> getTrackState(String trackId, String email) async {
    var userData = await getActiveTracks(email);
    bool contains = false;
    for (Track t in userData.tracks) {
      if (t.data.id == trackId) {
        contains = true;
        break;
      }
    }
    if (contains)
      return userData.tracks
          .firstWhere((element) => element.data.id == trackId.toString())
          .data
          .taskList;
    else {
      await addTrackToUser(email, trackId);
      return [];
    }
  }

  ///Internal purpose
  Future<String> getDocumentKey(String email) async {
    String id;
    await firestoreInstance
        .collection('users')
        .where('email', isEqualTo: email)
        .get()
        .then((value) => id = value.docs[0].id);
    return id;
  }

  /// If a user starts out with a new track, a JSONObject is added to the user tracks, alongwith the track id
  Future<void> addTrackToUser(String email, String trackId) async {
    var userData = await getActiveTracks(email);
    userData.tracks.add(Track(
      data: Data(id: trackId, taskList: []),
    ));
    await firestoreInstance
        .collection('users')
        .doc(await getDocumentKey(email))
        .update(json.decode(userDataToJson(userData)));
  }

  /// Append a task to a user's already completed task
  Future<void> addTaskToTrack(
      {String details, String trackId, String timestamp, String email}) async {
    var userData = await getActiveTracks(email);
    for (int i = 0; i < userData.tracks.length; i++) {
      var track = userData.tracks[i];
      if (track.data.id == trackId) {
        userData.tracks[i].data.taskList
            .add(TaskList(details: details, timestamp: timestamp));
      }
    }
    await firestoreInstance
        .collection('users')
        .doc(await getDocumentKey(email))
        .update(json.decode(userDataToJson(userData)));
  }

  /// Helpful for a track with predefined tasks
  Future<Tracks> getTrackDetails(String trackId) async {
    Tracks return_track;
    await firestoreInstance.collection('tracks').get().then(
          (value) => value.docs.forEach(
            (element) {
              var track = tracksFromJson(json.encode(element.data()));
              if (track.id == trackId) return_track = track;
            },
          ),
        );
    return return_track;
  }
}
