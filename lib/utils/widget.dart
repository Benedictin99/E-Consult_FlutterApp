import 'package:flutter/material.dart';
import '../screens/home_screens/doctor_pages/doctor_chat.dart';
import '../screens/home_screens/doctor_pages/doctor_consult.dart';
import '../screens/home_screens/doctor_pages/doctor_home.dart';
import '../screens/home_screens/doctor_pages/doctor_profil.dart';
import '../screens/home_screens/patient_pages/patient_chat.dart';
import '../screens/home_screens/patient_pages/patient_consult.dart';
import '../screens/home_screens/patient_pages/patient_home.dart';
import '../screens/home_screens/patient_pages/patient_profil.dart';

//List des pages docteur
List doctorPageList = [
  const DoctorHomePages(),
  const DoctorConsultPage(),
  const DoctorChatPage(),
  const DoctorProfilPage(),
];

//List des pages patient
List patientPageList = [
  const PatientHomePage(),
  const PatientConsultPage(),
  const PatientChatPage(),
  const PatientProfilPage(),
];

//Login & Register Header Widget
Widget headerWidget({
  required String titre,
  required image,
  required String sousTitre,
}) {
  return Column(
    children: [
      Text(
        titre,
        style: const TextStyle(
          fontSize: 35,
          fontWeight: FontWeight.bold,
          color: Colors.black,
        ),
      ),
      const SizedBox(height: 40),
      Image(
        alignment: Alignment.center,
        image: image,
        height: 200,
        width: 200,
      ),
      const SizedBox(height: 20),
      Text(
        sousTitre,
        style: const TextStyle(
          color: Colors.black,
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
      ),
    ],
  );
}

Widget infoHeaderWidget({
  required image,
  required String text,
}) {
  return Column(
    children: [
      Image(
        alignment: Alignment.center,
        image: image,
        height: 200,
        width: 200,
      ),
      const SizedBox(height: 20),
      Text(
        text,
        style: const TextStyle(
          color: Colors.black,
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
      ),
    ],
  );
}

//Information textField
Widget infoTextFieldWidget(
    {required controller,
    required keyboardType,
    required prefixIcon,
    required label,
    maxLength}) {
  return TextField(
    controller: controller,
    maxLength: maxLength,
    keyboardType: keyboardType,
    decoration: InputDecoration(
      prefixIcon: prefixIcon,
      label: label,
      border: const OutlineInputBorder(
        borderSide: BorderSide(
          color: Colors.black,
          width: 5,
        ),
      ),
      focusedBorder: const OutlineInputBorder(
        borderSide: BorderSide(
          color: Colors.black,
          width: 1,
        ),
      ),
      floatingLabelStyle: const TextStyle(
        color: Colors.black,
      ),
    ),
  );
}

//Login & Register textField
Widget textFieldWidget({
  required controller,
  required keyboardType,
  required prefixIcon,
  required label,
  required bool obscureText,
  suffixIcon,
}) {
  return TextField(
    controller: controller,
    keyboardType: keyboardType,
    obscureText: obscureText,
    decoration: InputDecoration(
      prefixIcon: prefixIcon,
      suffixIcon: suffixIcon,
      label: label,
      border: const OutlineInputBorder(
        borderSide: BorderSide(
          color: Colors.black,
          width: 5,
        ),
      ),
      focusedBorder: const OutlineInputBorder(
        borderSide: BorderSide(
          color: Colors.black,
          width: 1,
        ),
      ),
      floatingLabelStyle: const TextStyle(
        color: Colors.black,
      ),
    ),
  );
}

Widget registerFootWidget({
  required icon,
  required String text1,
  required String text2,
  required Function() onTap,
}) {
  return Container(
    padding: const EdgeInsets.all(20),
    child: Column(
      children: [
        Text(
          text1,
          style: const TextStyle(fontSize: 15),
        ),
        GestureDetector(
          onTap: onTap,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              icon,
              Text(
                text2,
                style:
                    const TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
      ],
    ),
  );
}

Widget loginFootWidget({
  required String text1,
  required String text2,
  required Function() onTap,
  required icon,
}) {
  return Container(
    padding: const EdgeInsets.all(20),
    child: Column(
      children: [
        Text(
          text1,
          style: const TextStyle(fontSize: 15),
        ),
        GestureDetector(
          onTap: onTap,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                text2,
                style:
                    const TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
              ),
              icon,
            ],
          ),
        ),
      ],
    ),
  );
}

Widget btnWidget({required String text, required Function() onPressed}) {
  return MaterialButton(
    onPressed: onPressed,
    color: Colors.black,
    height: 40,
    minWidth: 350,
    textColor: Colors.white,
    shape: OutlineInputBorder(
      borderRadius: BorderRadius.circular(20),
    ),
    child: Text(text),
  );
}
