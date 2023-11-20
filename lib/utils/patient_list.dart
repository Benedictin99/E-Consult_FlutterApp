import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

Future<List<QueryDocumentSnapshot>> malDocument() async {
  QuerySnapshot snapshot =
  await FirebaseFirestore.instance.collection('patient').get();
  return snapshot.docs;
}

class AffichePatient extends StatelessWidget {
  final List<QueryDocumentSnapshot> documents;

  const AffichePatient({super.key, required this.documents});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: documents.length,
      itemBuilder: (context, index) {
        final document = documents[index];
        final data = document.data() as Map<String, dynamic>;

        return Column(
          children: [
            Container(
              height: 150,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.amber,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const Icon(
                    Icons.person,
                    size: 150,
                  ),
                  //const Spacer(),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        data['Nom'],
                        style: const TextStyle(fontSize: 35),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        data['Prenom'],
                        style: const TextStyle(
                          fontSize: 20,
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 10),
          ],
        );
      },
    );
  }
}
