import 'package:flutter/material.dart';

/// SCREENS
import '../home/home_screen.dart';

import '../search/search_screen.dart';

import '../calendar/calendar_screen.dart';

import '../profile/profile_screen.dart';

class BottomNavScreen
    extends StatefulWidget {

  const BottomNavScreen({
    super.key,
  });

  @override
  State<BottomNavScreen> createState() =>
      _BottomNavScreenState();

}

class _BottomNavScreenState
    extends State<BottomNavScreen> {

  /// CURRENT TAB
  int currentIndex = 0;

  /// PAGES
  final List<Widget> pages = const [

    HomeScreen(),

    SearchScreen(),

    CalendarScreen(),

    ProfileScreen(),

  ];

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      extendBody: true,

      /// BODY
      body: AnimatedSwitcher(

        duration:
            const Duration(
          milliseconds: 300,
        ),

        child: pages[currentIndex],

      ),

      /// PREMIUM NAV BAR
      bottomNavigationBar:
          Container(

        margin:
            const EdgeInsets.only(

          left: 16,

          right: 16,

          bottom: 14,

        ),

        padding:
            const EdgeInsets.symmetric(
          vertical: 8,
        ),

        decoration:
            BoxDecoration(

          color:
              Theme.of(context)
                  .bottomNavigationBarTheme
                  .backgroundColor,

          borderRadius:
              BorderRadius.circular(
            28,
          ),

          boxShadow: [

            BoxShadow(

              color:
                  Colors.black
                      .withOpacity(
                0.08,
              ),

              blurRadius: 20,

              offset:
                  const Offset(
                0,
                10,
              ),

            ),

          ],

        ),

        child: BottomNavigationBar(

          currentIndex:
              currentIndex,

          onTap: (index) {

            setState(() {

              currentIndex =
                  index;

            });

          },

          backgroundColor:
              Colors.transparent,

          elevation: 0,

          type:
              BottomNavigationBarType.fixed,

          selectedItemColor:
              const Color(
            0xff5DADE2,
          ),

          unselectedItemColor:
              Colors.grey,

          selectedFontSize: 12,

          unselectedFontSize: 11,

          showUnselectedLabels:
              true,

          items: [

            BottomNavigationBarItem(

              icon:
                  buildNavIcon(

                icon:
                    Icons.home_rounded,

                isSelected:
                    currentIndex == 0,

              ),

              label: 'Home',

            ),

            BottomNavigationBarItem(

              icon:
                  buildNavIcon(

                icon:
                    Icons.search_rounded,

                isSelected:
                    currentIndex == 1,

              ),

              label: 'Search',

            ),

            BottomNavigationBarItem(

              icon:
                  buildNavIcon(

                icon:
                    Icons.calendar_month_rounded,

                isSelected:
                    currentIndex == 2,

              ),

              label: 'Calendar',

            ),

            BottomNavigationBarItem(

              icon:
                  buildNavIcon(

                icon:
                    Icons.person_rounded,

                isSelected:
                    currentIndex == 3,

              ),

              label: 'Profile',

            ),

          ],

        ),

      ),

    );

  }

  /// NAV ICON
  Widget buildNavIcon({

    required IconData icon,

    required bool isSelected,

  }) {

    return AnimatedContainer(

      duration:
          const Duration(
        milliseconds: 250,
      ),

      padding:
          const EdgeInsets.all(
        10,
      ),

      decoration:
          BoxDecoration(

        color:
            isSelected

                ? const Color(
                    0xff5DADE2,
                  ).withOpacity(
                    0.15,
                  )

                : Colors.transparent,

        borderRadius:
            BorderRadius.circular(
          16,
        ),

      ),

      child: Icon(

        icon,

        size: 26,

        color:
            isSelected

                ? const Color(
                    0xff5DADE2,
                  )

                : Colors.grey,

      ),

    );

  }

}