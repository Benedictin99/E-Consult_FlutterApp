import 'package:flutter/material.dart';

class DoctorHomePages extends StatefulWidget {
  const DoctorHomePages({super.key});

  @override
  State<DoctorHomePages> createState() => _DoctorHomePageState();
}

class _DoctorHomePageState extends State<DoctorHomePages> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      body: CustomScrollView(
        slivers: [

          // App Bar
          SliverAppBar(
            pinned: true,
            title: const Text('Section Docteur'),
            leading: IconButton(onPressed: () {}, icon: const Icon(Icons.menu)),
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
                        padding: const EdgeInsets.symmetric(horizontal: 30),
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
                        child: const Column(
                          children: [
                            SizedBox(height: 20),
                            Row(
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'BIENVENUE',
                                      style: TextStyle(fontSize: 20),
                                    ),
                                    Text(
                                      'Dr Arnold',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 35),
                                    ),
                                    Text(
                                      'arnold@gmail.com',
                                      style: TextStyle(
                                          fontWeight: FontWeight.w300,
                                          fontSize: 15),
                                    ),
                                  ],
                                ),
                                Spacer(),
                                CircleAvatar(
                                  radius: 65,
                                  child: Image(
                                    image: AssetImage('images/doctor.png'),
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
                  Positioned(
                    bottom: 0,
                    child: SizedBox(
                      height: 50,
                      width: size.width,
                      child: Card(
                        elevation: 3,
                        margin: const EdgeInsets.symmetric(horizontal: 50),
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
                color: Colors.grey,
                child: const Text(
                  'Scroller',
                  style: TextStyle(fontSize: 300),
                ),
              ),
            ]),
          ),
        ],
      ),
    );
  }
}
