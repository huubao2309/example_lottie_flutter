import 'package:custom_navigator/custom_navigator.dart';
import 'package:flutter/material.dart';

import 'lottie_screen/lottie_load_file.dart';
import 'lottie_screen/lottie_load_url.dart';

//give a navigator key to [MaterialApp] if you want to use the default navigation
//anywhere in your app eg: line 15 & line 93
GlobalKey<NavigatorState> mainNavigatorKey = GlobalKey<NavigatorState>();

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      navigatorKey: mainNavigatorKey,
      title: 'Lottie Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Lottie Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Page _page = Page(0); // First init
  int _currentIndex = 0;

  // Custom navigator takes a global key if you want to access the
  // navigator from outside it's widget tree subtree
  GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        items: _items,
        onTap: (index) {
          // here we used the navigator key to pop the stack to get back to our
          // main page
          navigatorKey.currentState.maybePop();
          setState(
            () => _page = Page(index),
          );
          _currentIndex = index;
        },
        currentIndex: _currentIndex,
      ),
      body: CustomNavigator(
        navigatorKey: navigatorKey,
        home: _page,
        //Specify your page route [PageRoutes.materialPageRoute] or [PageRoutes.cupertinoPageRoute]
        pageRoute: PageRoutes.materialPageRoute,
      ),
    );
  }

  final _items = [
    BottomNavigationBarItem(
      icon: Icon(Icons.network_wifi),
      title: Text('Lottie URL'),
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.file_download),
      title: Text('Lottie File'),
    ),
  ];
}

class Page extends StatelessWidget {
  final int index;

  const Page(this.index) : assert(index != null);

  @override
  Widget build(BuildContext context) {
    // Change page
    switch (index) {
      case 0:
        return LottieLoadURLScreen();
      case 1:
        return LottieLoadFileScreen();
      default:
        return LottieLoadURLScreen();
    }
  }
}
