import 'dart:async';

import 'package:RescuePedia/pages/medications_page.dart';
import 'package:RescuePedia/pages/settings_page.dart';
import 'package:RescuePedia/pages/sop_start_page.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:responsive_grid_list/responsive_grid_list.dart';
import 'package:slider_button/slider_button.dart';

import '../components/drug_component.dart';
import '../components/layout/appbar.dart';
import '../components/layout/bottom_bar.dart';
import '../services/drug_service.dart';
import 'cpr_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<Widget> _widgetOptions = [
    const CPRPage(),
    const MedicationsPage(),
    const CPRPage(),
    const SOPStartPage(),
    const SettingsPage(),
  ];
  int _selectedIndex = 2;

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
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
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
      ),
      drawer: Drawer(),
      backgroundColor: Theme.of(context).colorScheme.background,
      body: _widgetOptions.elementAt(_selectedIndex),
    );
  }
}
