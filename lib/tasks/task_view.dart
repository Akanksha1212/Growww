import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:grow/datacmodels/user.dart';
import 'package:grow/services/firestore_service.dart';
import 'package:grow/services/setup_locator.dart';

class TaskView extends StatefulWidget {
  final String id;
  final bool newTrack;
  final String email;
  TaskView({@required this.id, @required this.newTrack, @required this.email});
  @override
  _TaskViewState createState() => _TaskViewState();
}

class _TaskViewState extends State<TaskView> {
  /// This is the service that deals with all the firebase CRUD operations
  final firebaseService = locator<FirestoreService>();

  /// These two lines, along with the init gets us an instance of user from any screen beyond login. Necessary to get emails
  final FirebaseAuth auth = FirebaseAuth.instance;
  User user;

  Future<List<TaskList>> future;

  @override
  void initState() {
    super.initState();
    user = auth.currentUser;
    firebaseService.getTrackState(widget.id, widget.email);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: firebaseService.getTrackState(widget.id, widget.email),
        builder:
            (BuildContext context, AsyncSnapshot<List<TaskList>> snapshot) {
          return snapshot.hasData
              ? Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(snapshot.data.length.toString()),
                      FlatButton(
                          color: Colors.purpleAccent,
                          onPressed: () async {
                            await firebaseService.addTaskToTrack(
                                details:
                                    "Demo ${DateTime.now().millisecondsSinceEpoch.toString()}",
                                timestamp: DateTime.now()
                                    .millisecondsSinceEpoch
                                    .toString(),
                                email: widget.email,
                                trackId: widget.id);
                            setState(() {
                              future = firebaseService.getTrackState(
                                  widget.id, widget.email);
                            });
                          },
                          child: Text("Add task!")),
                    ],
                  ),
                )
              : Center(child: CircularProgressIndicator());
        },
      ),
    );
  }

  /// DEMO: To get all the data about a specific track for a user
  /// for eg: Track gratitude, which has id 001
  void getUserData() async {
    var userData = await firebaseService.getTrackState(widget.id, widget.email);
    userData.length; // Tells us how many days tasks they have completed
    userData.forEach(
      (task) {
        task.details; // Task added by the user
        task.timestamp; // Time of task completion
      },
    );
  }

  /// DEMO: to get details of a track with predefined track
  void getTrackData() async {
    var trackData = await firebaseService.getTrackDetails(widget.id);
    trackData
        .tasks; // These tasks are manually entered in firebase, 30 in count. [trackData.tasks[day-1]] gives task of that day
  }

  /// Add a task to a track for a user
  void addTaskToTrack() async {
    await firebaseService.addTaskToTrack(
        details:
            "Add details here", // For track where we take user input, pass that, else pass the details by fetching from the [getTrackData()] example above
        timestamp: DateTime.now()
            .millisecondsSinceEpoch
            .toString(), // In case we plan to use time at any point
        email: widget.email,
        trackId: widget.id);
  }
}
