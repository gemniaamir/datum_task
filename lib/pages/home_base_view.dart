import 'dart:developer';

import 'package:datum/pages/homepage.dart';
import 'package:datum/pages/homepage1.dart';
import 'package:flutter/material.dart';
import 'package:flutter_snake_navigationbar/flutter_snake_navigationbar.dart';
import 'package:flutter_svg/svg.dart';

import '../utils/theme_style.dart';

class HomeBaseView extends StatefulWidget {
  const HomeBaseView({super.key});

  @override
  State<HomeBaseView> createState() => _HomeBaseViewState();
}

class _HomeBaseViewState extends State<HomeBaseView> {
  late PageController pageController;
  late double viewHeight;

  @override
  void initState() {
    pageController = PageController();
    super.initState();
  }

  @override
  void dispose() {
    pageController.dispose();

    super.dispose();
  }

  _onTapped(index) {
    setState(() {
      _selectedItemPosition = index;
    });
    pageController.jumpToPage(index);
  }

  ///
  /// Configuration for Snake Bottom Navigation Bar - STARTS
  ///
  final BorderRadius _borderRadius = const BorderRadius.only(
    topLeft: Radius.circular(25),
    topRight: Radius.circular(25),
  );

  ShapeBorder? bottomBarShape = const RoundedRectangleBorder(
    borderRadius: BorderRadius.all(Radius.circular(25)),
  );
  SnakeBarBehaviour snakeBarStyle = SnakeBarBehaviour.floating;
  EdgeInsets padding = const EdgeInsets.only(left: 30, right: 30, bottom: 10);
  late double bottomBarHeight;

  int _selectedItemPosition = 0;
  SnakeShape snakeShape = SnakeShape.circle;

  bool showSelectedLabels = false;
  bool showUnselectedLabels = false;

  Color selectedColor = ThemeStyle.primaryColor;
  Color unselectedColor = ThemeStyle.accentColor;

  Gradient selectedGradient =
      const LinearGradient(colors: [Colors.red, Colors.amber]);
  Gradient unselectedGradient =
      const LinearGradient(colors: [Colors.red, Color(0xFF2F2E41)]);

  Color? containerColor;
  List<Color> containerColors = [
    const Color(0xFFFDE1D7),
    const Color(0xFFE4EDF5),
    const Color(0xFFE7EEED),
    const Color(0xFFF4E4CE),
  ];

  ///
  /// Configuration for Snake Bottom Navigation Bar - ENDS
  ///

  @override
  void didChangeDependencies() {
    ThemeStyle(context);
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    ///
    /// Bottom Nav Bar height
    bottomBarHeight = MediaQuery.of(context).size.height * .09;

    log('Screen Height : ${MediaQuery.of(context).size.height}');
    log('Padding Top : ${MediaQuery.of(context).padding.top}');
    log('Padding Bottom : ${MediaQuery.of(context).padding.bottom}');
    log('View Height : ${MediaQuery.of(context).size.height - (MediaQuery.of(context).padding.bottom + bottomBarHeight + 10)}');

    viewHeight = MediaQuery.of(context).size.height -
        (bottomBarHeight + MediaQuery.of(context).padding.bottom + 10);
    return Scaffold(
      body: AnimatedContainer(
        color: Colors.white,
        duration: const Duration(seconds: 1),
        child: PageView(
          physics: const NeverScrollableScrollPhysics(),
          controller: pageController,
          onPageChanged: _onPageChanged,
          children: <Widget>[
            HomePage(
              viewHeight: viewHeight,
            ),
            Container()
          ],
        ),
      ),

      ///
      /// Snake Bottom Navigation Bar
      backgroundColor: ThemeStyle.primaryColor,
      bottomNavigationBar: SnakeNavigationBar.color(
        height: bottomBarHeight,
        backgroundColor: Colors.white,
        behaviour: snakeBarStyle,
        snakeShape: snakeShape,
        shape: bottomBarShape,
        padding: padding,
        snakeViewColor: Colors.white,
        selectedItemColor: ThemeStyle.primaryColor,
        unselectedItemColor: ThemeStyle.accentColor,
        showUnselectedLabels: showUnselectedLabels,
        showSelectedLabels: showSelectedLabels,
        currentIndex: _selectedItemPosition,
        onTap: _onTapped,
        items: [
          BottomNavigationBarItem(
              icon: SvgPicture.asset(
                'assets/images/home.svg',
                color: _selectedItemPosition == 0
                    ? selectedColor
                    : unselectedColor,
              ),
              label: 'home'),
          BottomNavigationBarItem(
              icon: SvgPicture.asset(
                'assets/images/gifts.svg',
                color: _selectedItemPosition == 1
                    ? selectedColor
                    : unselectedColor,
              ),
              label: 'home1'),
        ],
        selectedLabelStyle: const TextStyle(fontSize: 14),
        unselectedLabelStyle: const TextStyle(fontSize: 10),
      ),
    );
  }

  void _onPageChanged(int page) {
    setState(() {
      _selectedItemPosition = page;
    });
  }
}
