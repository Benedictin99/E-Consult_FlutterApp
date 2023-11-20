import 'package:flutter/cupertino.dart';

class DoctorConsultPage extends StatefulWidget {
  const DoctorConsultPage({super.key});

  @override
  State<DoctorConsultPage> createState() => _DoctorConsultPageState();
}

class _DoctorConsultPageState extends State<DoctorConsultPage> {
  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text('Consultation Doctor'),
    );
  }
}
