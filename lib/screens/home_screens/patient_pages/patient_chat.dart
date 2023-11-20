import 'package:flutter/cupertino.dart';

class PatientChatPage extends StatefulWidget {
  const PatientChatPage({super.key});

  @override
  State<PatientChatPage> createState() => _PatientChatPageState();
}

class _PatientChatPageState extends State<PatientChatPage> {
  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text('Discussion Patient'),
    );
  }
}
