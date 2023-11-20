import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

Future<List<QueryDocumentSnapshot>> docDocument() async {
  QuerySnapshot snapshot =
      await FirebaseFirestore.instance.collection('docteur').get();
  return snapshot.docs;
}

class AfficheDocteur extends StatefulWidget {
  final List<QueryDocumentSnapshot> documents;

  const AfficheDocteur({super.key, required this.documents});

  @override
  State<AfficheDocteur> createState() => _AfficheDocteurState();
}

class _AfficheDocteurState extends State<AfficheDocteur> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: widget.documents.length,
      itemBuilder: (context, index) {
        final document = widget.documents[index];
        final data = document.data() as Map<String, dynamic>;

        return Padding(
          padding: const EdgeInsets.only(top: 10),
          child: Container(
            decoration: BoxDecoration(
              color: Colors.amber.shade50,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Padding(
              padding: const EdgeInsets.only(right: 20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const Icon(
                    Icons.person,
                    size: 80,
                  ),
                  //const Spacer(),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        data['Nom'],
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 5),
                      Text(
                        data['Prenom'],
                        style: const TextStyle(
                          fontSize: 15,
                        ),
                      )
                    ],
                  ),
                  const Spacer(),
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.message_outlined,
                      size: 35,
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
