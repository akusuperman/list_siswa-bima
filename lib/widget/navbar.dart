import 'package:application/view/history_view.dart';
import 'package:application/view/home_view.dart';
import 'package:application/view/profile_view.dart';
import 'package:circle_nav_bar/circle_nav_bar.dart';
import 'package:flutter/material.dart';

class Navbar extends StatefulWidget {
  const Navbar({super.key, required selectedIndex, required onItemTapped});

  @override
  State<Navbar> createState() => _NavbarState();
}

class _NavbarState extends State<Navbar> {
  int _currentIndex = 0;
  int get tabIndex => _currentIndex;
  set tabIndex(int v) {
    _currentIndex = v;
    setState(() {});
  }

  final tabs = [const HomeView(), const ProfileView(), const HistoryView()];


  late PageController pageController; 

  @override
  void initState() {
    super.initState();
    pageController = PageController(initialPage: _currentIndex);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      bottomNavigationBar: CircleNavBar(
        activeIcons: const [
          Icon(Icons.home, color: Colors.deepPurple),
          Icon(Icons.person, color: Colors.deepPurple),
          Icon(Icons.history, color: Colors.deepPurple),
        ],
        inactiveIcons: const [
          Text("Home"),
          Text("Profile"),
          Text("History"),
        ],
        color: Colors.white,
        height: 60,
        circleWidth: 60,
        activeIndex: _currentIndex,
        onTap: (index) {
          _currentIndex = index;
          pageController.jumpToPage(index);
        },
        padding: const EdgeInsets.only(left: 16, right: 16, bottom: 20),
        cornerRadius: const BorderRadius.only(
          topLeft: Radius.circular(8),
          topRight: Radius.circular(8),
          bottomRight: Radius.circular(24),
          bottomLeft: Radius.circular(24),
        ),
        shadowColor: Colors.deepPurple,
        elevation: 10,
      ),
      body: PageView(
        controller: pageController,
        onPageChanged: (v) {
          tabIndex = v;
        },
        children: const [HomeView(), ProfileView(), HistoryView()],
      ),
    );
  }
}