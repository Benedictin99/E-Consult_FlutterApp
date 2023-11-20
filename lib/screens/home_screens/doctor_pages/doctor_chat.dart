import 'package:flutter/cupertino.dart';

class DoctorChatPage extends StatefulWidget {
  const DoctorChatPage({super.key});

  @override
  State<DoctorChatPage> createState() => _DoctorChatPageState();
}

class _DoctorChatPageState extends State<DoctorChatPage> {
  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text('Discussion Doctor'),
    );
  }
}
