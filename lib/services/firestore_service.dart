import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:grow/datacmodels/tracks.dart';

class FirestoreService {
  final firestoreInstance = FirebaseFirestore.instance;
  List<Tracks> _tracks = [];
  Future<List<Tracks>> fetchData() async {
    _tracks.clear();
    await firestoreInstance.collection('tracks').get().then(
          (value) => value.docs.forEach(
            (element) => _tracks.add(
              Tracks.fromSnapshot(element),
            ),
          ),
        );
    return _tracks;
  }
}
