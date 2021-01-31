import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:grow/datacmodels/tracks.dart';
import 'package:grow/login/login.dart';
import 'package:grow/screens/gardenHome.dart';
import 'package:grow/services/firestore_service.dart';
import 'package:grow/services/setup_locator.dart';
import 'package:grow/tasks/task_view.dart';
import 'package:grow/widgets/track_card.dart';

class TracksView extends StatefulWidget {
  @override
  _TracksViewState createState() => _TracksViewState();
}

class _TracksViewState extends State<TracksView> {
  final FirebaseAuth auth = FirebaseAuth.instance;
  final GoogleSignIn googleSignIn = GoogleSignIn();
  final firestoreService = locator<FirestoreService>();
  var future;
  User user;
  @override
  void initState() {
    super.initState();
    user = auth.currentUser;
    future = firestoreService.fetchData(user.email);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff60316E),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                color: Color(0xff60316E),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    'Hello!',
                    style: GoogleFonts.ubuntu(
                        fontSize: 14, color: Color(0xffE8D5B5)),
                  ),
                  Text(user.displayName,
                      style: GoogleFonts.ubuntu(
                          fontSize: 20, color: Color(0xffE8D5B5)))
                ],
              ),
            ),
            ListTile(
              title: Text('Log out'),
              onTap: () async {
                await googleSignIn.signOut();
                Navigator.of(context).pushReplacement(
                  MaterialPageRoute(
                    builder: (context) => Login(),
                  ),
                );
              },
            )
          ],
        ),
      ),
      appBar: AppBar(
        backgroundColor: Color(0xff60316E),
        automaticallyImplyLeading: true,
        centerTitle: true,
        title: Padding(
          padding: const EdgeInsets.only(bottom: 16.0),
          child: Image.asset(
            'assets/Logo.png',
            fit: BoxFit.contain,
            height: 48,
          ),
        ),
      ),
      body: Center(
        child: FutureBuilder(
          future: future,
          builder: (BuildContext context,
                  AsyncSnapshot<List<Tracks>> snapshot) =>
              snapshot.hasData
                  ? SingleChildScrollView(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: 50,
                          ),
                          Text(
                            'commit to\n30 days of...',
                            style: GoogleFonts.ubuntu(
                                fontSize: 36,
                                color: Color(0xffC2A081),
                                fontWeight: FontWeight.w600),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 32),
                            child: ListView.builder(
                              physics: NeverScrollableScrollPhysics(),
                              itemCount: snapshot.data.length,
                              shrinkWrap: true,
                              itemBuilder: (context, index) => Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: GestureDetector(
                                  onTap: () async {
                                    await Navigator.of(context).push(
                                      MaterialPageRoute(
                                        builder: (context) => TaskView(
                                          id: snapshot.data[index].id,
                                          newTrack:
                                              snapshot.data[index].progress ==
                                                  -1,
                                          email: user.email,
                                        ),
                                      ),
                                    );
                                    refreshPage();
                                  },
                                  child: trackCard(snapshot.data[index]),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    )
                  : CircularProgressIndicator(),
        ),
      ),
    );
  }

  void refreshPage() {
    setState(() {
      future = firestoreService.fetchData(user.email);
    });
  }
}
