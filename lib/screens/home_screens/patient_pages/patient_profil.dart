import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_consult/screens/login_screen.dart';
import 'package:e_consult/utils/text_box.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class PatientProfilPage extends StatefulWidget {
  const PatientProfilPage({super.key});

  @override
  State<PatientProfilPage> createState() => _PatientProfilPageState();
}

class _PatientProfilPageState extends State<PatientProfilPage> {
  final user = FirebaseAuth.instance.currentUser!;
  final CollectionReference userCollection =
      FirebaseFirestore.instance.collection('patient');

  Future<void> editField(String field) async {
    String newValue = "";
    await showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Changer le $field'),
        content: TextField(
          autofocus: true,
          decoration: InputDecoration(
            hintText: 'Entrer nouveau $field',
          ),
          onChanged: (value) {
            newValue = value;
          },
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Anuler'),
          ),
          TextButton(
            onPressed: () => Navigator.of(context).pop(newValue),
            child: const Text('Sauver'),
          ),
        ],
      ),
    );

    if (newValue.trim().isNotEmpty) {
      await userCollection.doc(user.email).update({field: newValue});
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('PROFIL'),
        centerTitle: true,
        backgroundColor: Colors.grey,
      ),
      body: StreamBuilder<DocumentSnapshot>(
        stream: userCollection.doc(user.email).snapshots(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            final userData = snapshot.data!.data() as Map<String, dynamic>;
            return ListView(
              children: [
                const SizedBox(height: 20),
                SingleChildScrollView(
                  child: Column(
                    children: [
                      Column(
                        children: [
                          GestureDetector(
                            onTap: () {},
                            child: const CircleAvatar(
                              backgroundImage: AssetImage('images/doctor.png'),
                              radius: 80,
                            ),
                          ),
                          const SizedBox(height: 5),
                          Text(
                            user.email!,
                            style: const TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 20),
                      MyTextBox(
                        text: 'Nom : ',
                        value: userData['Nom'],
                        onPressed: () => editField('Nom'),
                      ),
                      const SizedBox(height: 5),
                      MyTextBox(
                        text: 'Prénom : ',
                        value: userData['Prenom'],
                        onPressed: () => editField('Prenom'),
                      ),
                      const SizedBox(height: 5),
                      MyTextBox(
                        text: 'Adresse : ',
                        value: userData['Adresse'],
                        onPressed: () => editField('Adresse'),
                      ),
                      const SizedBox(height: 5),
                      MyTextBox(
                        text: 'Date de naissance : ',
                        value: userData['Naissance'],
                        onPressed: () => editField('Naissance'),
                      ),
                      const SizedBox(height: 5),
                      MyTextBox(
                        text: 'Téléphone : ',
                        value: userData['Telephone'],
                        onPressed: () => editField('Telephone'),
                      ),
                      const SizedBox(height: 35),
                      MaterialButton(
                        onPressed: () {
                          FirebaseAuth.instance.signOut().then((value) {
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const LoginScreen(),
                              ),
                            );
                          });
                        },
                        height: 45,
                        minWidth: 350,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                        color: Colors.black,
                        child: const Text(
                          'DECONNECTER',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            );
          } else if (snapshot.hasError) {
            return Center(
              child: Text('Error ${snapshot.error}'),
            );
          }
          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}
