import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:http/http.dart' as http;
import 'package:oonstagram/documents/account.dart';
import 'package:oonstagram/documents/configuration.dart';
import 'package:oonstagram/documents/post.dart';

import 'package:oonstagram/widgets/feed.dart';

void main() async {
  await Hive.initFlutter();

  Hive.registerAdapter(AccountAdapter());
  Hive.registerAdapter(ConfigurationAdapter());
  Hive.registerAdapter(PostAdapter());

  await Hive.openBox("settings");
  await Hive.openBox("accounts");
  await Hive.openBox("posts");

  runApp(App());
}


class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  List<Widget> _pages = [
    Feed(),
    Feed(),
    Feed(),
    Feed(),
    Feed(),
  ];

  int currentPage = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFEEEEEE),
      body: _pages[currentPage],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentPage,
        onTap: (i) {
          setState(() {
            currentPage = i;
          });
        },
        type: BottomNavigationBarType.fixed,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        selectedItemColor: Colors.black,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Foundation.home),
            label: "Feed",
          ),
          BottomNavigationBarItem(
            icon: Icon(Feather.search),
            label: "Search",
          ),
          BottomNavigationBarItem(
            icon: Icon(Feather.plus_square),
            label: "Upload",
          ),
          BottomNavigationBarItem(
            icon: Icon(Feather.heart),
            label: "Likes",
          ),
          BottomNavigationBarItem(
            icon: Icon(Feather.user),
            label: "Account",
          ),
        ],
      ),
    );
  }
}
