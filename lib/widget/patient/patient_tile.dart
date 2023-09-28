import 'package:flutter/material.dart';
import 'package:onetp/model/patient.dart';
import 'package:onetp/widget/person/person_tile.dart';

class PatientTile extends StatelessWidget {
  final Patient patient;

  const PatientTile({
    super.key,
    required this.patient,
  });

  @override
  Widget build(BuildContext context) {
    return PersonTile(
      person: patient,
      onTap: () {
        Navigator.of(context).pushNamed(
          '/patient/details',
          arguments: { 'patient': patient, }
        );
      },
      onEdit: () {
        Navigator.of(context).pushNamed(
          '/patient/edit',
          arguments: { 'patient': patient, },
        );
      },
    );
  }
}
