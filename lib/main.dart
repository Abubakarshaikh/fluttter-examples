import 'package:flutter/material.dart';
import 'package:flutter_examples/android_messages/android_messages_page.dart';
import 'package:flutter_examples/collapsing_toolbar/main_collapsing_toolbar.dart';
import 'package:flutter_examples/credit_cards_concept/credit_cards_concept_page.dart';
import 'package:flutter_examples/custom_sliverheader/custom_sliver_header.dart';
import 'package:flutter_examples/menu_drag/menu_drag.dart';
import 'package:flutter_examples/persistent_tabbar/main_persistent_tabbar.dart';
import 'package:flutter_examples/shoes_store/shoes_store_page.dart';
import 'package:flutter_examples/boats_store/ui/boat_list_page.dart';
import 'package:flutter_examples/coffee_shop/ui/coffee_home_page.dart';
import 'package:flutter_examples/sports_store/sports_store_page.dart';
import 'package:flutter_examples/twitter_profile/twitter_profile_page.dart';
import 'photo_concept/photo_concept_page.dart';
import 'circular_list/circular_list_page.dart';

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
            MyMenuButton(
              title: "Android Messages Page",
              actionTap: () {
                onButtonTap(
                  AndroidMessagesPage(),
                );
              },
            ),
            MyMenuButton(
              title: "Persistent TabBar  ",
              actionTap: () {
                onButtonTap(
                  MainPersistentTabBar(),
                );
              },
            ),
            MyMenuButton(
              title: "Collapsing Toolbar",
              actionTap: () {
                onButtonTap(
                  MainCollapsingToolbar(),
                );
              },
            ),
            MyMenuButton(
              title: "Twitter Profile Page",
              actionTap: () {
                onButtonTap(
                  TwitterProfilePage(),
                );
              },
            ),
            MyMenuButton(
              title: "Custom Sliver Header",
              actionTap: () {
                onButtonTap(
                  CustomSliverHeader(),
                );
              },
            ),
            MyMenuButton(
              title: "CreditCard Concept Page",
              actionTap: () {
                onButtonTap(
                  CreditCardConceptPage(),
                );
              },
            ),
            MyMenuButton(
              title: "Photo Concept Page",
              actionTap: () {
                onButtonTap(
                  PhotoConceptPage(),
                );
              },
            ),
            MyMenuButton(
              title: "Circular List Page",
              actionTap: () {
                onButtonTap(
                  CircularListPage(),
                );
              },
            ),
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
