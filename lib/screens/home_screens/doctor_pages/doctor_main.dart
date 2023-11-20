import 'package:flutter/material.dart';
import 'package:e_consult/screens/home_screens/doctor_pages/doctor_chat.dart';
import 'package:e_consult/screens/home_screens/doctor_pages/doctor_consult.dart';
import 'package:e_consult/screens/home_screens/doctor_pages/doctor_home.dart';
import 'package:e_consult/screens/home_screens/doctor_pages/doctor_profil.dart';

import '../../../utils/widget.dart';

class DoctorMainPages extends StatefulWidget {
  const DoctorMainPages({super.key});

  @override
  State<DoctorMainPages> createState() => _DoctorMainPageState();
}

class _DoctorMainPageState extends State<DoctorMainPages> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: doctorPageList[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          onTap: (index) {
            setState(() {
              _currentIndex = index;
            });
          },
          currentIndex: _currentIndex,
          selectedItemColor: Colors.black,
          unselectedIconTheme: const IconThemeData(color: Colors.grey),
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home_outlined),
              activeIcon: Icon(Icons.home_sharp),
              label: 'Acueil',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.medical_services_outlined),
              activeIcon: Icon(Icons.medical_information),
              label: 'Consultation',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.message_outlined),
              activeIcon: Icon(Icons.local_library_rounded),
              label: 'Discussion',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person_pin_outlined),
              activeIcon: Icon(Icons.person_pin_rounded),
              label: 'Profile',
            ),
          ]),
    );
  }
}
