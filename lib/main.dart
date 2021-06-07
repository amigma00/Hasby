import 'package:flutter/material.dart';
import 'package:hasby/Pages/create.dart';
import 'package:hasby/Pages/homefeed.dart';
import 'package:hasby/Pages/search.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      themeMode: ThemeMode.dark,
      darkTheme: ThemeData(brightness: Brightness.dark),
      theme: ThemeData(
          //primarySwatch: Colors.blue,
          ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _currentindex = 0;
  PageController _pageController = PageController();
  List<Widget> _screens = [HomeFeed(), Search(), Create()];

  void _onPageChanged(int index) {
    setState(() {
      _currentindex = index;
    });
  }

  void _onItemTapped(int selectedIndex) {
    _pageController.jumpToPage(selectedIndex);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Stack(children: [
        PageView(
          controller: _pageController,
          children: _screens,
          onPageChanged: _onPageChanged,
          //physics: NeverScrollableScrollPhysics(),
        ),
        Align(
            alignment: Alignment.bottomCenter,
            child: BottomNavigationBar(
              elevation: 0,
              backgroundColor: Colors.transparent,
             selectedItemColor: Colors.black,
              unselectedItemColor: Colors.grey[300],
              currentIndex: _currentindex,
              onTap: _onItemTapped,
              items: [
                BottomNavigationBarItem(
                    icon: Icon(
                      Icons.feed,
                      color: Colors.black,
                    ),
                    label: "Feed",),
                BottomNavigationBarItem(
                    icon: Icon(
                      Icons.search,
                      color: Colors.black,
                    ),
                    label: "Search",),
                BottomNavigationBarItem(
                    icon: Icon(
                      Icons.add,
                      color: Colors.black,
                    ),
                    label: "Create"),
              ],
            ))
      ]),
      //bottomNavigationBar: )
    ));
  }
}
