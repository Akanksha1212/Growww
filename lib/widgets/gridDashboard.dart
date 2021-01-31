import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:grow/widgets/customDialog.dart';

class GridDashboard extends StatelessWidget {
  Items item1 = new Items(
      title: "Day 1", img: "assets/tree.png", screen: CustomDialogBox());

  Items item2 = new Items(
    title: "Day 2",
    img: "assets/tree.png",
    screen: CustomDialogBox(),
  );
  Items item3 = new Items(
    title: "Day 3",
    img: "assets/tree.png",
    screen: CustomDialogBox(),
  );
  int index = 1;
  Items item4 = new Items(
      title: "", img: "assets/icons/med.png", screen: CustomDialogBox());
  Items item5 = new Items(
    title: "",
    img: "assets/icons/food.png",
    screen: CustomDialogBox(),
  );
  Items item6 = new Items(
      title: "", img: "assets/icons/info.png", screen: CustomDialogBox());
  @override
  Widget build(BuildContext context) {
    List<Items> myList = [
      item1,
      item2,
      item3,
      item4,
      item5,
      item6,
      item6,
      item6,
      item6,
      item6,
      item6,
      item6,
      item6,
      item6,
      item6,
      item6,
      item6,
      item6,
      item6,
    ];
    var color = 0xff433206;
    return Flexible(
      child: GridView.count(
          childAspectRatio: 1.0,
          padding: EdgeInsets.only(left: 5, right: 5, top: 10),
          crossAxisCount: 3,
          crossAxisSpacing: 2,
          mainAxisSpacing: 2,
          children: myList.map((data) {
            return GestureDetector(
              child: Container(
                decoration: BoxDecoration(
                  color: Color(color),
                  borderRadius: BorderRadius.circular(5),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Image.asset(
                      data.img,
                      width: 60,
                    ),
                    SizedBox(
                      height: 3,
                    ),
                    Text(
                      data.title,
                      style: GoogleFonts.openSans(
                          textStyle: TextStyle(
                              color: Colors.white,
                              fontSize: 15,
                              fontWeight: FontWeight.w600)),
                    ),
                    SizedBox(
                      height: 8,
                    ),
                  ],
                ),
              ),
              onTap: () {
                return showDialog(
                  context: context,
                  builder: (ctx) => AlertDialog(
                    title: Text(
                      "Day 1",
                      style: GoogleFonts.ubuntu(
                          textStyle: TextStyle(
                              color: Colors.black87,
                              fontSize: 30,
                              fontWeight: FontWeight.w500)),
                    ),
                    content: Text(
                      "Go for a walk",
                      style: GoogleFonts.ubuntu(
                          textStyle: TextStyle(
                              color: Colors.black87,
                              fontSize: 20,
                              fontWeight: FontWeight.w200)),
                    ),
                    actions: <Widget>[
                      FlatButton(
                        onPressed: () {
                          Navigator.of(ctx).pop();
                        },
                        child: RaisedButton(
                            color: Color(0xffBE82D0),
                            child: Text("Done"),
                            onPressed: null),
                      ),
                    ],
                  ),
                );
              },
            );
          }).toList()),
    );
  }
}

class Items {
  String title;
  String img;
  Widget screen;
  Items({this.title, this.img, this.screen});
}
