import 'package:flutter/material.dart';
import 'package:flutter_examples/menu_drag/menu_drag.dart';
import 'package:flutter_examples/shoes_store/shoes_store_page.dart';
import 'package:flutter_examples/boats_store/ui/boat_list_page.dart';
import 'package:flutter_examples/coffee_shop/ui/coffee_home_page.dart';
import 'package:flutter_examples/sports_store/sports_store_page.dart';

void main() => runApp(MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyApp(),
    ));

class MyApp extends StatefulWidget {
  @override
  MyAppState createState() {
    return MyAppState();
  }
}

class MyAppState extends State<MyApp> {
  onButtonTap(Widget page) {
    Navigator.push(
        context, MaterialPageRoute(builder: (BuildContext context) => page));
  }

  @override
  Widget build(BuildContext context) {
    // SystemChrome.setEnabledSystemUIOverlays([SystemUiOverlay.bottom]);
    return Scaffold(
      appBar: AppBar(
        title: Text("Flutter Samples"),
      ),
      body: Padding(
        padding: EdgeInsets.all(15.0),
        child: ListView(
          children: <Widget>[
            MyMenuButton(
              title: "Shoes Store",
              actionTap: () {
                onButtonTap(
                  ShoesStorePage(),
                );
              },
            ),
            MyMenuButton(
                title: "Boat store",
                actionTap: () {
                  onButtonTap(
                    BoatListPage(),
                  );
                }),
            MyMenuButton(
              title: "Coffee shop",
              actionTap: () {
                onButtonTap(
                  CoffeeShop(),
                );
              },
            ),
            MyMenuButton(
              title: "Sports Store",
              actionTap: () {
                onButtonTap(
                  SportsStorePage(),
                );
              },
            ),
            MyMenuButton(
              title: "Menu drag animation",
              actionTap: () {
                onButtonTap(
                  MenuDrag(),
                );
              },
            ),
            // MyMenuButton(
            //   title: "ScrollController and ScrollNotification",
            //   actionTap: () {
            //     onButtonTap(
            //       MainScrollController(),
            //     );
            //   },
            // ),
            // MyMenuButton(
            //   title: "Apps Clone",
            //   actionTap: () {
            //     onButtonTap(
            //       MainAppsClone(),
            //     );
            //   },
            // ),
            // MyMenuButton(
            //   title: "Animations",
            //   actionTap: () {
            //     onButtonTap(
            //       MainAnimations(),
            //     );
            //   },
            // ),
            // MyMenuButton(
            //   title: "Communication Widgets",
            //   actionTap: () {
            //     onButtonTap(
            //       MainCommunicationWidgets(),
            //     );
            //   },
            // ),
            // MyMenuButton(
            //   title: "Split Image",
            //   actionTap: () {
            //     onButtonTap(MainSplitImage());
            //   },
            // ),
            // MyMenuButton(
            //   title: "Custom AppBar & SliverAppBar",
            //   actionTap: () {
            //     onButtonTap(MainAppBarSliverAppBar());
            //   },
            // ),
            // MyMenuButton(
            //   title: "Menu Navigations",
            //   actionTap: () {
            //     onButtonTap(MainMenuNavigations());
            //   },
            // ),
          ],
        ),
      ),
    );
  }
}

class MyMenuButton extends StatelessWidget {
  final String title;
  final VoidCallback actionTap;

  MyMenuButton({this.title, this.actionTap});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: MaterialButton(
        height: 50.0,
        color: Theme.of(context).primaryColor,
        textColor: Colors.white,
        child: new Text(title),
        onPressed: actionTap,
      ),
    );
  }
}
