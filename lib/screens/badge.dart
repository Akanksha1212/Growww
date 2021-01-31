import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Badge extends StatefulWidget {
  @override
  _BadgeState createState() => _BadgeState();
}

class _BadgeState extends State<Badge> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff60316E),
      body: Container(
          margin: EdgeInsets.fromLTRB(20, 35, 20, 10),
          color: Color(0xffBE82D0),
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  CircleAvatar(
                      radius: 70,
                      backgroundColor: Color(0xffACF28B),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            '10',
                            style: GoogleFonts.ubuntu(
                                textStyle: TextStyle(
                                    color: Colors.black87,
                                    fontSize: 35,
                                    fontWeight: FontWeight.w500)),
                          ),
                          Text(
                            'points!',
                            style: GoogleFonts.ubuntu(
                                textStyle: TextStyle(
                                    color: Colors.black87,
                                    fontSize: 26,
                                    fontWeight: FontWeight.w400)),
                          ),
                        ],
                      )),
                  CircleAvatar(
                      radius: 70,
                      backgroundColor: Color(0xffE8B943),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            '20',
                            style: GoogleFonts.ubuntu(
                                textStyle: TextStyle(
                                    color: Colors.black87,
                                    fontSize: 35,
                                    fontWeight: FontWeight.w500)),
                          ),
                          Text(
                            'points!',
                            style: GoogleFonts.ubuntu(
                                textStyle: TextStyle(
                                    color: Colors.black87,
                                    fontSize: 26,
                                    fontWeight: FontWeight.w400)),
                          ),
                        ],
                      )),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  CircleAvatar(
                      radius: 70,
                      backgroundColor: Color(0xffAEA1EA),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            '30',
                            style: GoogleFonts.ubuntu(
                                textStyle: TextStyle(
                                    color: Colors.black87,
                                    fontSize: 35,
                                    fontWeight: FontWeight.w500)),
                          ),
                          Text(
                            'points!',
                            style: GoogleFonts.ubuntu(
                                textStyle: TextStyle(
                                    color: Colors.black87,
                                    fontSize: 26,
                                    fontWeight: FontWeight.w400)),
                          ),
                        ],
                      )),
                  CircleAvatar(
                      radius: 70,
                      backgroundColor: Color(0xffF493C2),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            '40',
                            style: GoogleFonts.ubuntu(
                                textStyle: TextStyle(
                                    color: Colors.black87,
                                    fontSize: 35,
                                    fontWeight: FontWeight.w500)),
                          ),
                          Text(
                            'points!',
                            style: GoogleFonts.ubuntu(
                                textStyle: TextStyle(
                                    color: Colors.black87,
                                    fontSize: 26,
                                    fontWeight: FontWeight.w400)),
                          ),
                        ],
                      )),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  CircleAvatar(
                      radius: 70,
                      backgroundColor: Color(0xffE8B943),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            '50',
                            style: GoogleFonts.ubuntu(
                                textStyle: TextStyle(
                                    color: Colors.black87,
                                    fontSize: 35,
                                    fontWeight: FontWeight.w500)),
                          ),
                          Text(
                            'points!',
                            style: GoogleFonts.ubuntu(
                                textStyle: TextStyle(
                                    color: Colors.black87,
                                    fontSize: 26,
                                    fontWeight: FontWeight.w400)),
                          ),
                        ],
                      )),
                  CircleAvatar(
                      radius: 70,
                      backgroundColor: Color(0xffACF28B),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            '60',
                            style: GoogleFonts.ubuntu(
                                textStyle: TextStyle(
                                    color: Colors.black87,
                                    fontSize: 35,
                                    fontWeight: FontWeight.w500)),
                          ),
                          Text(
                            'points!',
                            style: GoogleFonts.ubuntu(
                                textStyle: TextStyle(
                                    color: Colors.black87,
                                    fontSize: 26,
                                    fontWeight: FontWeight.w400)),
                          ),
                        ],
                      )),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  CircleAvatar(
                    radius: 70,
                    backgroundColor: Colors.transparent,
                    backgroundImage: AssetImage('assets/ques.png'),
                  ),
                  CircleAvatar(
                    radius: 70,
                    backgroundColor: Colors.transparent,
                    backgroundImage: AssetImage('assets/ques.png'),
                  ),
                ],
              ),
            ],
          )),
    );
  }
}
