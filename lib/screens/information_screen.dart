import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_consult/screens/home_screens/patient_pages/patient_main.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import '../utils/widget.dart';
import 'home_screens/doctor_pages/doctor_main.dart';

class InformationScreen extends StatefulWidget {
  const InformationScreen({super.key});

  @override
  State<InformationScreen> createState() => _InformationScreenState();
}

class _InformationScreenState extends State<InformationScreen> {
  final _nomController = TextEditingController();
  final _prenomController = TextEditingController();
  final _adresseController = TextEditingController();
  final _birthController = TextEditingController();
  final _phoneController = TextEditingController();

  bool docChecked = false;
  bool malChecked = false;

  String? userId = FirebaseAuth.instance.currentUser?.email.toString();

  void _docCheckboxChange(bool? value) {
    setState(() {
      docChecked = value!;
    });
  }

  void _malCheckboxChange(bool? value) {
    setState(() {
      malChecked = value!;
    });
  }

  void _showMsg({required String msg}) {
    Fluttertoast.showToast(
      msg: msg,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      textColor: Colors.white,
      fontSize: 16,
      backgroundColor: Colors.black,
    );
  }

  Future<void> _addPatientCollection() async {
    String userName = _nomController.text.trim();
    String userLastName = _prenomController.text.trim();
    String userAdress = _adresseController.text.trim();
    String userBirth = _birthController.text.trim();
    var userPhone = _phoneController.text.trim();
    String userProfession = 'patient';

    CollectionReference patientCollection =
        FirebaseFirestore.instance.collection('patient');

    Map<String, dynamic> information = {
      'Nom': userName,
      'Prenom': userLastName,
      'Adresse': userAdress,
      'Naissance': userBirth,
      'Telephone': userPhone,
      'Profession': userProfession,
    };

    patientCollection.doc(userId).set(information).then((value) {
      _showMsg(msg: 'Information ajouter avec success');
    });
  }

  Future<void> _addDocteurCollection() async {
    String userName = _nomController.text.trim();
    String userLastName = _prenomController.text.trim();
    String userAdress = _adresseController.text.trim();
    String userBirth = _birthController.text.trim();
    var userPhone = _phoneController.text.trim();
    String userProfession = 'docteur';

    CollectionReference docteurCollection =
        FirebaseFirestore.instance.collection('docteur');

    Map<String, dynamic> information = {
      'Nom': userName,
      'Prenom': userLastName,
      'Adresse': userAdress,
      'Naissance': userBirth,
      'Telephone': userPhone,
      'Profession': userProfession,
    };

    docteurCollection.doc(userId).set(information).then((value) {
      _showMsg(msg: 'Information ajouter avec success');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 80),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              infoHeaderWidget(
                  image: const AssetImage('images/information.png'),
                  text: 'Entrer vos informations'),
              const SizedBox(height: 25),
              infoTextFieldWidget(
                controller: _nomController,
                keyboardType: TextInputType.text,
                label: const Text('Nom'),
                prefixIcon: const Icon(
                  Icons.person_2_outlined,
                  color: Colors.black,
                ),
              ),
              const SizedBox(height: 15),
              infoTextFieldWidget(
                controller: _prenomController,
                keyboardType: TextInputType.text,
                label: const Text('Prénom'),
                prefixIcon: const Icon(
                  Icons.person_2_outlined,
                  color: Colors.black,
                ),
              ),
              const SizedBox(height: 15),
              infoTextFieldWidget(
                controller: _adresseController,
                keyboardType: TextInputType.text,
                label: const Text('Adresse'),
                prefixIcon: const Icon(
                  Icons.home_work_outlined,
                  color: Colors.black,
                ),
              ),
              const SizedBox(height: 15),
              infoTextFieldWidget(
                controller: _birthController,
                keyboardType: TextInputType.text,
                label: const Text('Date de naissance'),
                prefixIcon: const Icon(
                  Icons.cake_outlined,
                  color: Colors.black,
                ),
              ),
              const SizedBox(height: 15),
              infoTextFieldWidget(
                controller: _phoneController,
                keyboardType: TextInputType.phone,
                label: const Text('Numéro de téléphone'),
                prefixIcon: const Icon(
                  Icons.phone_outlined,
                  color: Colors.black,
                ),
                maxLength: 10,
              ),
              Column(
                children: <Widget>[
                  Row(
                    children: [
                      Checkbox(
                        value: docChecked,
                        onChanged: _docCheckboxChange,
                      ),
                      const Text('Docteur'),
                    ],
                  ),
                  Row(
                    children: [
                      Checkbox(
                        value: malChecked,
                        onChanged: _malCheckboxChange,
                      ),
                      const Text('Malade'),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 15),
              btnWidget(
                onPressed: () {
                  if (docChecked && malChecked) {
                    _showMsg(msg: "Veuillez selectionner une seul case svp !");
                  } else if (docChecked) {
                    _addDocteurCollection().then((value) {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const DoctorMainPages(),
                        ),
                      );
                    });
                  } else if (malChecked) {
                    _addPatientCollection().then((value) {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const PatientMainPage(),
                        ),
                      );
                    });
                  } else {
                    _showMsg(msg: "Veuillez selectionner une case svp !");
                  }
                },
                text: 'ENREGISTRER',
              ),
              const SizedBox(height: 25),
            ],
          ),
        ),
      ),
    );
  }
}
