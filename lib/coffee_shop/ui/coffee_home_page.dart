import 'package:flutter_examples/coffee_shop/model/coffee.dart';
import 'package:flutter_examples/coffee_shop/ui/coffee_list_page.dart';
import 'package:flutter_examples/coffee_shop/ui/widgets/coffee_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'dart:ui';

class CoffeeShop extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white,
        primarySwatch: Colors.brown,
        primaryColor: Colors.white,
        textTheme: TextTheme(
          headline5: GoogleFonts.poppins(
              color: Colors.brown[700],
              fontWeight: FontWeight.w600,
              fontSize: 28,
              height: 1.1),
          headline2:
              GoogleFonts.poppins(fontWeight: FontWeight.w600, fontSize: 64),
          headline6: GoogleFonts.poppins(
              fontWeight: FontWeight.w500, fontSize: 22, height: 1.1),
          subtitle1: GoogleFonts.poppins(
            color: Colors.brown[400],
            fontWeight: FontWeight.w300,
            fontSize: 18,
          ),
        ),
      ),
      home: CoffeeHomePage(),
    );
  }
}

class CoffeeHomePage extends StatelessWidget {
  void _openCoffeeListPage(BuildContext context, SliderAction sliderAction) {
    Navigator.push(
      context,
      PageRouteBuilder(
        transitionDuration: const Duration(milliseconds: 400),
        pageBuilder: (context, animation, secondaryAnimation) {
          return FadeTransition(
              opacity: animation,
              child: CoffeeListPage(
                initialAction: sliderAction,
              ));
        },
      ),
    );
  }

  void _onVerticalDragUpdate(BuildContext context, DragUpdateDetails details) {
    print(details.primaryDelta);

    if (details.primaryDelta > 2.0) {
      _openCoffeeListPage(context, SliderAction.Previous);
    } else if (details.primaryDelta < -2.0) {
      _openCoffeeListPage(context, SliderAction.Next);
    }
  }

  @override
  Widget build(BuildContext context) {
    final coffeeList = Coffee.coffeeList;
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          //--------------------------
          // Gradient Background
          //--------------------------
          const DecoratedBox(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment(0, -.3),
                colors: [Colors.brown, Colors.white],
              ),
            ),
          ),
          Column(
            children: [
              const CoffeeAppBar(brightness: Brightness.light),
              //----------------------
              // Coffee Images
              //----------------------
              Expanded(
                child: LayoutBuilder(
                  builder: (context, constraints) {
                    final height = constraints.maxHeight;
                    return GestureDetector(
                      onTap: () =>
                          _openCoffeeListPage(context, SliderAction.None),
                      onVerticalDragUpdate: (details) =>
                          _onVerticalDragUpdate(context, details),
                      child: Stack(
                        children: [
                          _CoffeeTransformedItem(
                            displacement: 0,
                            scale: .4,
                            endTransitionOpacity: .5,
                            coffee: coffeeList[0],
                          ),
                          _CoffeeTransformedItem(
                            displacement: height * .1,
                            scale: 1.1,
                            endTransitionOpacity: .8,
                            coffee: coffeeList[1],
                          ),
                          _CoffeeTransformedItem(
                            displacement: height * .23,
                            scale: 1.45,
                            isOverflowed: true,
                            fixedScale: 1.2,
                            coffee: coffeeList[2],
                          ),
                          //----------------------------
                          // App Coffee Title
                          //----------------------------
                          Align(
                            alignment: Alignment(0, .4),
                            child: Text.rich(
                              TextSpan(
                                text: 'Fika',
                                children: [
                                  TextSpan(
                                    text: '\nCoffee',
                                    style: GoogleFonts.poppins(
                                      height: 1.0,
                                      fontSize: 60,
                                    ),
                                  )
                                ],
                              ),
                              style: GoogleFonts.lilitaOne(
                                fontSize: 70,
                                color: Colors.white.withOpacity(.9),
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                          _CoffeeTransformedItem(
                            displacement: height * .75,
                            scale: 1.75,
                            fixedScale: 1.5,
                            isOverflowed: true,
                            coffee: coffeeList[3],
                          ),
                        ],
                      ),
                    );
                  },
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}

class _CoffeeTransformedItem extends StatelessWidget {
  const _CoffeeTransformedItem({
    Key key,
    @required this.displacement,
    @required this.coffee,
    this.endTransitionOpacity = 1.0,
    this.scale = 1.0,
    this.fixedScale,
    this.isOverflowed = false,
  }) : super(key: key);

  final double displacement;
  final double scale;
  final double fixedScale;
  final bool isOverflowed;
  final double endTransitionOpacity;
  final Coffee coffee;

  @override
  Widget build(BuildContext context) {
    return Transform.translate(
      offset: Offset(0, displacement),
      child: Transform.scale(
        scale: scale,
        alignment: Alignment.topCenter,
        child: AspectRatio(
          aspectRatio: .85,
          child: Hero(
            tag: coffee.name,
            flightShuttleBuilder: (_, animation, __, ___, ____) {
              return AnimatedBuilder(
                animation: animation,
                builder: (_, child) {
                  return Transform.scale(
                    scale: isOverflowed
                        ? lerpDouble(fixedScale, 1.0, animation.value)
                        : 1.0,
                    child: Opacity(
                      opacity: lerpDouble(
                        1.0,
                        endTransitionOpacity,
                        animation.value,
                      ),
                      child: child,
                    ),
                  );
                },
                child: Image.asset(coffee.pathImage),
              );
            },
            child: Image.asset(coffee.pathImage),
          ),
        ),
      ),
    );
  }
}
