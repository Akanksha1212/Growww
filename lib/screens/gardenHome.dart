import 'package:flutter/material.dart';
import 'package:grow/screens/map.dart';

import 'badge.dart';
import 'garden.dart';

class GardenHome extends StatefulWidget {
  @override
  _GardenHomeState createState() => new _GardenHomeState();
}

class _GardenHomeState extends State<GardenHome> {
  int _pageIndex = 0;
  PageController _pageController;

  List<Widget> tabPages = [
    MapScreen(),
    Garden(),
    Badge(),
  ];

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: _pageIndex);
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff60316E),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _pageIndex,
        onTap: onTabTapped,
        backgroundColor: Color(0xff60316E),
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
              icon: new Image.asset('assets/map.png'), title: Text("")),
          BottomNavigationBarItem(
              icon: new Image.asset('assets/flower.png'), title: Text("")),
          BottomNavigationBarItem(
              icon: new Image.asset('assets/badge.png'), title: Text("")),
        ],
      ),
      body: PageView(
        children: tabPages,
        onPageChanged: onPageChanged,
        controller: _pageController,
      ),
    );
  }

  void onPageChanged(int page) {
    setState(() {
      this._pageIndex = page;
    });
  }

  void onTabTapped(int index) {
    this._pageController.animateToPage(index,
        duration: const Duration(milliseconds: 500), curve: Curves.easeInOut);
  }
}
