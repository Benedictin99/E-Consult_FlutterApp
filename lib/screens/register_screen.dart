import 'package:e_consult/screens/information_screen.dart';
import 'package:e_consult/screens/login_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import '../utils/widget.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _emailController = TextEditingController();
  final _passController = TextEditingController();
  final _repassController = TextEditingController();
  bool passToggle = true;
  bool repassToggle = true;

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

  void registerBtn() {
    if (_passController.text.trim() == _repassController.text.trim()) {
      FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: _emailController.text,
        password: _passController.text,
      ).then((value) {
        _showMsg(msg: 'Inscription réussi !');
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => const InformationScreen(),
          ),
        );
      }).onError((error, stackTrace) {
        _showMsg(msg: 'Erreur : ${error.toString()}');
      });
    } else {
      _showMsg(msg: 'Mot de passe non conforme');
    }
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
                  titre: 'INSCRIPTION',
                  image: const AssetImage('images/register.png'),
                  sousTitre: 'Entrer vos informations pour continuer'),
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
                keyboardType: TextInputType.text,
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
              const SizedBox(height: 25),
              textFieldWidget(
                controller: _repassController,
                keyboardType: TextInputType.text,
                prefixIcon: const Icon(Icons.lock_outline, color: Colors.black),
                label: const Text('Repeter le mot de passe'),
                obscureText: repassToggle,
                suffixIcon: IconButton(
                  icon: Icon(
                    repassToggle ? Icons.visibility : Icons.visibility_off,
                    color: Colors.black.withOpacity(0.5),
                  ),
                  onPressed: () {
                    setState(() {
                      repassToggle = !repassToggle;
                    });
                  },
                ),
              ),
              const SizedBox(height: 35),
              btnWidget(
                onPressed: () {
                  registerBtn();
                },
                text: 'INSCRIPTION',
              ),
              const SizedBox(height: 25),
              registerFootWidget(
                icon: const Icon(Icons.arrow_circle_left, color: Colors.black),
                text1: 'Vous avez déjà un compte ? \n',
                text2: ' Connexion',
                onTap: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const LoginScreen(),
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
