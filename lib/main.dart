import 'package:application/view/history_view.dart';
import 'package:application/view/home_view.dart';
import 'package:application/view/profile_view.dart';
import 'package:application/widget/navbar.dart';
import 'package:flutter/material.dart';

void main() => runApp(const Home());

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "PPLG Apps",
      initialRoute: '/home',
      routes: {
        '/home': (context) => const MainPage(),
        '/profile': (context) => const ProfileView(),
        '/history': (context) => const HistoryView(),
      },
    );
  }
}

class MainPage extends StatefulWidget {
const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {

  int _tabIndex = 0;

  final List<Widget> _pages = const [
    HomeView(),   
    ProfileView(),
    HistoryView(),
  ];

  void _onTabChage(int index) {
    setState(() {
      _tabIndex = index;
    });
  }
@override
Widget build(BuildContext context) {
  return Scaffold(
    body: _pages[_tabIndex],
      bottomNavigationBar: Navbar(
      selectedIndex: _tabIndex,
      onItemTapped: _onTabChage,
    ),
  );
}
}
