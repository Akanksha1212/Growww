import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:grow/datacmodels/tracks.dart';

Widget trackCard(Tracks track) {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: Card(
      color: Color(0xffBE82D0),
      elevation: 12,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(12))),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(track.name,
                  style: GoogleFonts.ubuntu(
                      fontSize: 32,
                      color: Color(0xff60316E),
                      fontWeight: FontWeight.w500)),
            ),
            track.progress != -1
                ? Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ClipRRect(
                      borderRadius: BorderRadius.all(Radius.circular(8)),
                      child: LinearProgressIndicator(
                        value: track.progress.toDouble() / 100,
                        valueColor:
                            AlwaysStoppedAnimation<Color>(Color(0xff75A843)),
                        backgroundColor: Color(0xffACF28B),
                        minHeight: 20,
                      ),
                    ),
                  )
                : Container(),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Card(
                  color: Color(0xffACF28B),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 8.0, horizontal: 48.0),
                    child: Text(
                      track.progress == -1 ? 'start' : 'continue',
                      style: GoogleFonts.ubuntu(
                        fontSize: 28,
                        color: Color(0xff75A843),
                      ),
                    ),
                  )),
            )
          ],
        ),
      ),
    ),
  );
}
