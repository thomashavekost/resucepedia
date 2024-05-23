import 'package:RescuePedia/pages/cpr_page.dart';
import 'package:RescuePedia/pages/home_page.dart';
import 'package:flutter/material.dart';

class BottomBar extends StatefulWidget {
  const BottomBar({super.key});

  @override
  State<BottomBar> createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  int _selectedIndex = 0;

  @override
  void initState() {
    super.initState();
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: _selectedIndex,
      selectedItemColor: Theme.of(context).colorScheme.primary,
      unselectedItemColor: Colors.black,
      showUnselectedLabels: true,
      onTap: _onItemTapped,
      items: [
        BottomNavigationBarItem(
            icon: Icon(Icons.add),
          label: 'Notfall',
          backgroundColor: Colors.white
        ),
        BottomNavigationBarItem(
            icon: Icon(Icons.calculate),
            label: 'Medikamente',
            backgroundColor: Colors.white
        ),
        BottomNavigationBarItem(
            icon: Icon(Icons.flash_on),
            label: 'REA',
          backgroundColor: Colors.redAccent
        ),
        BottomNavigationBarItem(
            icon: Icon(Icons.add_chart),
            label: 'SOP',
            backgroundColor: Colors.white
        ),
        BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Einstellungen',
            backgroundColor: Colors.white
        ),
      ],
    );
  }
}
