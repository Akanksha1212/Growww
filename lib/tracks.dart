import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:grow/login/login.dart';

class TracksView extends StatefulWidget {
  @override
  _TracksViewState createState() => _TracksViewState();
}

class _TracksViewState extends State<TracksView> {
  final FirebaseAuth auth = FirebaseAuth.instance;
  final GoogleSignIn googleSignIn = GoogleSignIn();

  User user;
  @override
  void initState() {
    super.initState();
    user = auth.currentUser;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                    style: Theme.of(context).textTheme.bodyText1.copyWith(
                          color: Color(0xffE8D5B5),
                        ),
                  ),
                  Text(user.displayName,
                      style: Theme.of(context).textTheme.headline6.copyWith(
                            color: Color(0xffE8D5B5),
                            fontWeight: FontWeight.bold,
                          ))
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
        title: Text("Tracks"),
      ),
    );
  }
}
