import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../../utils/doctor_list.dart';

class PatientHomePage extends StatefulWidget {
  const PatientHomePage({super.key});

  @override
  State<PatientHomePage> createState() => _PatientHomePageState();
}

class _PatientHomePageState extends State<PatientHomePage> {
  final user = FirebaseAuth.instance.currentUser!;
  final CollectionReference userCollection =
      FirebaseFirestore.instance.collection('patient');

  List<QueryDocumentSnapshot> mesDocuments = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    docDocument().then((document) {
      setState(() {
        mesDocuments = document;
      });
    });
  }

  final conseil = [
    {
      'icon': Icons.add_box_outlined,
      'color': Colors.green,
      'title': 'Donner 1',
    },
    {
      'icon': Icons.ac_unit,
      'color': Colors.amber,
      'title': 'Donner 2',
    },
    {
      'icon': Icons.access_alarms,
      'color': Colors.indigo,
      'title': 'Donner 3',
    },
    {
      'icon': Icons.accessibility,
      'color': Colors.red,
      'title': 'Donner 4',
    },
    {
      'icon': Icons.account_balance,
      'color': Colors.deepPurpleAccent,
      'title': 'Donner 5',
    }
  ];

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      body: StreamBuilder<DocumentSnapshot>(
        stream: userCollection.doc(user.email).snapshots(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            final userData = snapshot.data!.data() as Map<String, dynamic>;

            return CustomScrollView(
              slivers: [
                // App Bar
                SliverAppBar(
                  pinned: true,
                  title: const Text('Acueil'),
                  leading: IconButton(
                      onPressed: () {}, icon: const Icon(Icons.menu)),
                  actions: [
                    IconButton(onPressed: () {}, icon: const Icon(Icons.flag))
                  ],
                ),

                // Section En-tête
                SliverList(
                  delegate: SliverChildListDelegate([
                    Stack(
                      children: [
                        Column(
                          children: [
                            Container(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 30),
                              height: size.height / 5.5,
                              decoration: const BoxDecoration(
                                color: Colors.grey,
                                borderRadius: BorderRadius.vertical(
                                  bottom: Radius.circular(45),
                                ),
                                boxShadow: [
                                  BoxShadow(
                                    blurRadius: 5,
                                  ),
                                ],
                              ),
                              child: Column(
                                children: [
                                  const SizedBox(height: 20),
                                  Row(
                                    children: [
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          const Text(
                                            'BIENVENUE',
                                            style: TextStyle(fontSize: 20),
                                          ),
                                          Text(
                                            userData['Prenom'],
                                            style: const TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 35),
                                          ),
                                        ],
                                      ),
                                      const Spacer(),
                                      const CircleAvatar(
                                        radius: 65,
                                        child: Image(
                                          image:
                                              AssetImage('images/doctor.png'),
                                        ),
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            ),
                            const SizedBox(height: 35),
                          ],
                        ),

                        // Recherche section
                        Positioned(
                          bottom: 0,
                          child: SizedBox(
                            height: 50,
                            width: size.width,
                            child: Card(
                              elevation: 3,
                              margin:
                                  const EdgeInsets.symmetric(horizontal: 50),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15),
                              ),
                              child: TextFormField(
                                decoration: InputDecoration(
                                  border: InputBorder.none,
                                  hintText: 'Recherche...',
                                  contentPadding: const EdgeInsets.only(
                                    left: 20,
                                    top: 20,
                                    bottom: 16,
                                  ),
                                  suffixIcon: IconButton(
                                    onPressed: () {},
                                    icon: const Icon(
                                      Icons.search,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ]),
                ),

                // Corps du page
                SliverList(
                  delegate: SliverChildListDelegate([
                    Container(
                      padding: const EdgeInsets.all(20),
                      height: size.height,
                      decoration: const BoxDecoration(
                        color: Colors.grey,
                        borderRadius: BorderRadius.vertical(
                          top: Radius.circular(45),
                        ),
                        boxShadow: [
                          BoxShadow(
                            blurRadius: 5,
                          ),
                        ],
                      ),
                      child: Column(
                        children: [

                          //Section pour vous
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                'Pour vous',
                                style: TextStyle(
                                    fontSize: 25, fontWeight: FontWeight.bold),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 10),
                                child: SingleChildScrollView(
                                  scrollDirection: Axis.horizontal,
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      GestureDetector(
                                        onTap: () {
                                          print('taper c1');
                                        },
                                        child: Column(
                                          children: [
                                            Container(
                                              height: 100,
                                              width: 100,
                                              decoration: BoxDecoration(
                                                color: Colors.red,
                                                borderRadius:
                                                    BorderRadius.circular(20),
                                              ),
                                              child: const Icon(
                                                Icons.person,
                                                size: 80,
                                                color: Colors.white,
                                              ),
                                            ),
                                            const Text(
                                              'conseil 1',
                                              style: TextStyle(
                                                fontSize: 18,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      const SizedBox(width: 20),
                                      GestureDetector(
                                        onTap: () {
                                          print('taper c2');
                                        },
                                        child: Column(
                                          children: [
                                            Container(
                                              height: 100,
                                              width: 100,
                                              decoration: BoxDecoration(
                                                color: Colors.red,
                                                borderRadius:
                                                    BorderRadius.circular(20),
                                              ),
                                              child: const Icon(
                                                Icons.person,
                                                size: 80,
                                                color: Colors.white,
                                              ),
                                            ),
                                            const Text(
                                              'conseil 2',
                                              style: TextStyle(
                                                fontSize: 18,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      const SizedBox(width: 20),
                                      GestureDetector(
                                        onTap: () {
                                          print('taper c3');
                                        },
                                        child: Column(
                                          children: [
                                            Container(
                                              height: 100,
                                              width: 100,
                                              decoration: BoxDecoration(
                                                color: Colors.red,
                                                borderRadius:
                                                    BorderRadius.circular(20),
                                              ),
                                              child: const Icon(
                                                Icons.person,
                                                size: 80,
                                                color: Colors.white,
                                              ),
                                            ),
                                            const Text(
                                              'conseil 3',
                                              style: TextStyle(
                                                fontSize: 18,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      const SizedBox(width: 20),
                                      GestureDetector(
                                        onTap: () {
                                          print('taper c4');
                                        },
                                        child: Column(
                                          children: [
                                            Container(
                                              height: 100,
                                              width: 100,
                                              decoration: BoxDecoration(
                                                color: Colors.red,
                                                borderRadius:
                                                    BorderRadius.circular(20),
                                              ),
                                              child: const Icon(
                                                Icons.person,
                                                size: 80,
                                                color: Colors.white,
                                              ),
                                            ),
                                            const Text(
                                              'conseil 4',
                                              style: TextStyle(
                                                fontSize: 18,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      const SizedBox(width: 20),
                                      GestureDetector(
                                        onTap: () {
                                          print('taper c5');
                                        },
                                        child: Column(
                                          children: [
                                            Container(
                                              height: 100,
                                              width: 100,
                                              decoration: BoxDecoration(
                                                color: Colors.red,
                                                borderRadius:
                                                    BorderRadius.circular(20),
                                              ),
                                              child: const Icon(
                                                Icons.person,
                                                size: 80,
                                                color: Colors.white,
                                              ),
                                            ),
                                            const Text(
                                              'conseil 5',
                                              style: TextStyle(
                                                fontSize: 18,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      const SizedBox(width: 20),
                                      GestureDetector(
                                        onTap: () {
                                          print('taper c6');
                                        },
                                        child: Column(
                                          children: [
                                            Container(
                                              height: 100,
                                              width: 100,
                                              decoration: BoxDecoration(
                                                color: Colors.red,
                                                borderRadius:
                                                    BorderRadius.circular(20),
                                              ),
                                              child: const Icon(
                                                Icons.person,
                                                size: 80,
                                                color: Colors.white,
                                              ),
                                            ),
                                            const Text(
                                              'conseil 6',
                                              style: TextStyle(
                                                fontSize: 18,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      const SizedBox(width: 20),
                                      GestureDetector(
                                        onTap: () {
                                          print('taper c7');
                                        },
                                        child: Column(
                                          children: [
                                            Container(
                                              height: 100,
                                              width: 100,
                                              decoration: BoxDecoration(
                                                color: Colors.red,
                                                borderRadius:
                                                    BorderRadius.circular(20),
                                              ),
                                              child: const Icon(
                                                Icons.person,
                                                size: 80,
                                                color: Colors.white,
                                              ),
                                            ),
                                            const Text(
                                              'conseil 7',
                                              style: TextStyle(
                                                fontSize: 18,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      const SizedBox(width: 20),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 35),

                          //Section docteurList
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                'Liste docteur',
                                style: TextStyle(
                                  fontSize: 30,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              mesDocuments.isNotEmpty
                                  ? AfficheDocteur(documents: mesDocuments)
                                  : const CircularProgressIndicator(),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ]),
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
