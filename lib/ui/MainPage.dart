import 'package:flutter/material.dart';
import 'package:shoes/ui/pages/Favorite.dart';
import 'package:shoes/ui/pages/Home.dart';
import 'package:shoes/ui/pages/Message.dart';
import 'package:shoes/ui/pages/Profile.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int indexPage = 0;
  void updateIndex(int value) {
    setState(() {
      indexPage = value;
    });
    print(indexPage);
  }

  List page = [
    HomePage(),
    MessagePage(),
    FavoritePage(),
    ProfilePage(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: page[indexPage],
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
            border: Border(
                top: BorderSide(
                    width: 2, color: Color.fromARGB(255, 237, 237, 237)))),
        child: newMethod(),
      ),
    );
  }

  BottomNavigationBar newMethod() {
    return BottomNavigationBar(
      enableFeedback: false,
      onTap: updateIndex,
      unselectedIconTheme: IconThemeData(color: Colors.grey),
      selectedIconTheme: IconThemeData(color: Colors.blue),
      showUnselectedLabels: false,
      showSelectedLabels: false,
      items: [
        BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
              color: indexPage == 0 ? Colors.blue : Colors.grey,
            ),
            label: "Home"),
        BottomNavigationBarItem(
            icon: Icon(
              Icons.message,
              color: indexPage == 1 ? Colors.blue : Colors.grey,
            ),
            label: "Message"),
        BottomNavigationBarItem(
            icon: Icon(
              Icons.favorite,
              color: indexPage == 2 ? Colors.blue : Colors.grey,
            ),
            label: "Favorite"),
        BottomNavigationBarItem(
            icon: Icon(
              Icons.person,
              color: indexPage == 3 ? Colors.blue : Colors.grey,
            ),
            label: "Profile")
      ],
    );
  }
}
