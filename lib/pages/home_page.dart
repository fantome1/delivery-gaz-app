import 'package:flutter/material.dart';
import 'package:gaz_app/constants.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;
  void _onMenuIndexTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  final List<Widget> _widgetOptions = <Widget>[
    Container(
      color: Colors.red,
    ),
    Container(
      color: Colors.yellow,
    ),
    Container(
      color: Colors.green,
    ),
    Container(
      color: Colors.grey,
    ),
    Container(
      color: Colors.orange,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(0),
          child: AppBar(backgroundColor: backgroundColor),
        ),
        body: Center(child: _widgetOptions.elementAt(_selectedIndex)),
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Colors.white,
          unselectedItemColor: Colors.grey,
          selectedItemColor: buttonPrimaryColor,
          unselectedLabelStyle: GoogleFonts.openSans(
            color: Colors.grey,
            fontSize: 12,
          ),
          type: BottomNavigationBarType.fixed,
          selectedLabelStyle: GoogleFonts.openSans(),
          showUnselectedLabels: true,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Accueil',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.local_gas_station_outlined),
              label: 'Gaz',
            ),
            BottomNavigationBarItem(
                icon: Icon(Icons.history_outlined), label: 'Historiques'),
            BottomNavigationBarItem(
              icon: Icon(Icons.discount_outlined),
              label: 'Promo',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: 'Profil',
            ),
          ],
          currentIndex: _selectedIndex,
          onTap: _onMenuIndexTapped,
        ));
  }
}


/**
 * Container(
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              blurRadius: 20,
              color: Colors.black.withOpacity(.1),
            )
          ],
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
            child: GNav(
              rippleColor: Colors.grey[400]!,
              hoverColor: Colors.grey[200]!,
              gap: 5,
              activeColor: buttonPrimaryColor,
              iconSize: 18,
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
              duration: const Duration(milliseconds: 400),
              tabBackgroundColor: Colors.grey[100]!,
              color: Colors.black54,
              textStyle: GoogleFonts.openSans(color: buttonPrimaryColor),
              tabs: const [
                GButton(
                  icon: Icons.home,
                  iconSize: 22,
                  text: 'Accueil',
                ),
                GButton(
                  icon: Icons.local_gas_station_outlined,
                  iconSize: 22,
                  text: 'Gaz',
                ),
                GButton(
                  icon: Icons.history_rounded,
                  iconSize: 22,
                  text: 'Historiques',
                ),
                GButton(
                  icon: Icons.discount_outlined,
                  iconSize: 22,
                  text: 'Promo',
                ),
                GButton(
                  icon: Icons.person_4_rounded,
                  iconSize: 22,
                  text: 'Profil',
                ),
              ],
              selectedIndex: _selectedIndex,
              onTabChange: (index) {
                setState(() {
                  _selectedIndex = index;
                });
              },
            ),
          ),
        ),
      ),
 */