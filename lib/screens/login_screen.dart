import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_consult/screens/forgot_pass.dart';
import 'package:e_consult/screens/home_screens/doctor_pages/doctor_main.dart';
import 'package:e_consult/screens/home_screens/patient_pages/patient_main.dart';
import 'package:e_consult/screens/register_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import '../utils/widget.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _emailController = TextEditingController();
  final _passController = TextEditingController();
  bool passToggle = true;

  Future<bool> verifyDoctorUser(String userID) async {
    try {
      final collection = FirebaseFirestore.instance.collection('docteur');
      final userDoc = await collection.doc(userID).get();

      if (userDoc.exists) {
        return true;
      } else {
        return false;
      }
    } catch (e) {
      if (kDebugMode) {
        print('Error : $e');
      }
      return false;
    }
  }

  void loginBtn() {
    String email = _emailController.text.trim();
    String password = _passController.text.trim();

    FirebaseAuth.instance
        .signInWithEmailAndPassword(email: email, password: password)
        .then((value) async {
      if (kDebugMode) {
        print('Success');
      }

      if (await verifyDoctorUser(email)) {
        // ignore: use_build_context_synchronously
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => const DoctorMainPages(),
          ),
        );
      } else {
        // ignore: use_build_context_synchronously
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => const PatientMainPage(),
          ),
        );
      }
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
              headerWidget(
                titre: 'CONNEXION',
                image: const AssetImage('images/login.png'),
                sousTitre: 'Entrer vos informations de connexion',
              ),
              const SizedBox(height: 25),
              textFieldWidget(
                controller: _emailController,
                keyboardType: TextInputType.emailAddress,
                prefixIcon:
                    const Icon(Icons.email_outlined, color: Colors.black),
                label: const Text('Adresse email'),
                obscureText: false,
              ),
              const SizedBox(height: 25),
              textFieldWidget(
                controller: _passController,
                keyboardType: TextInputType.visiblePassword,
                prefixIcon: const Icon(Icons.lock_outline, color: Colors.black),
                label: const Text('Mot de passe'),
                obscureText: passToggle,
                suffixIcon: IconButton(
                  icon: Icon(
                    passToggle ? Icons.visibility : Icons.visibility_off,
                    color: Colors.black.withOpacity(0.5),
                  ),
                  onPressed: () {
                    setState(() {
                      passToggle = !passToggle;
                    });
                  },
                ),
              ),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const ForgotPass(),
                        ),
                      );
                    },
                    child: const Text('Mot de passe oublier ?'),
                  ),
                ],
              ),
              const SizedBox(height: 15),
              btnWidget(
                onPressed: () {
                  loginBtn();
                },
                text: 'CONNEXION',
              ),
              const SizedBox(height: 25),
              loginFootWidget(
                text1: 'Vous n\'avez pas un compte ? \n',
                text2: 'Inscription  ',
                icon: const Icon(Icons.arrow_circle_right, color: Colors.black),
                onTap: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const RegisterScreen(),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
