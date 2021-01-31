import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

Widget trackCard(String name, {int percentage}) {
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
              child: Text(name,
                  style: GoogleFonts.ubuntu(
                      fontSize: 32,
                      color: Color(0xff60316E),
                      fontWeight: FontWeight.w500)),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: FlatButton(
                  color: Color(0xffACF28B),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                  onPressed: () => null,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 8.0, horizontal: 24.0),
                    child: Text(
                      'start',
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
