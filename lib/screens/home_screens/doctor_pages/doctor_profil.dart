import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_consult/utils/text_box.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../../login_screen.dart';

class DoctorProfilPage extends StatefulWidget {
  const DoctorProfilPage({super.key});

  @override
  State<DoctorProfilPage> createState() => _DoctorProfilPageState();
}

class _DoctorProfilPageState extends State<DoctorProfilPage> {
  final user = FirebaseAuth.instance.currentUser!;
  final CollectionReference userCollection =
      FirebaseFirestore.instance.collection('docteur');

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
        stream: FirebaseFirestore.instance
            .collection('docteur')
            .doc(user.email)
            .snapshots(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            final userData = snapshot.data!.data() as Map<String, dynamic>;
            return ListView(
              children: [
                const SizedBox(height: 20),
                const CircleAvatar(
                  backgroundImage: AssetImage('images/doctor.png'),
                  radius: 80,
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
                const SizedBox(height: 20),
                MyTextBox(
                  text: 'Prénom : ',
                  value: userData['Prenom'],
                  onPressed: () => editField('Prenom'),
                ),
                const SizedBox(height: 20),
                Container(
                  padding: const EdgeInsets.all(10),
                  decoration: const BoxDecoration(
                    color: Colors.black,

                  ),
                  child: MaterialButton(
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
                    height: 50,
                    minWidth: double.infinity,
                    child: const Text('Deconnecter'),
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
