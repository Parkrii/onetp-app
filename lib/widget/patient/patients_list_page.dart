import 'package:flutter/material.dart';
import 'package:onetp/model/patient.dart';
import 'package:onetp/model/person.dart';
import 'package:onetp/widget/patient/patient_tile.dart';

class PatientsListPage extends StatelessWidget {
  const PatientsListPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.of( context ).pop() ;
          },
          icon: const Icon( Icons.arrow_back ),
          tooltip: 'Volver',
        ),

        title: const Text( 'Pacientes' ),

        actions: [
          IconButton(
            onPressed: () {
              Navigator.of( context ).pushNamed( '/patient/add' ) ;
            },
            icon: const Icon( Icons.person_add ),
            tooltip: 'Añadir paciente',
          )
        ],
      ),

      body: Padding(
        padding: EdgeInsets.symmetric(
          vertical: 24,
          // horizontal: 16,
        ),
        child: ListView(
          children: [
            PatientTile(
              patient: Patient(
                name: 'Yomha, L. Nicolás',
                dni: '46113570',
                birthDate: DateTime( 2005, 1, 6 ),
                relatives: [
                  Person(
                    name: 'Luna, Nicolás. S.',
                    dni: '123434',
                    birthDate: DateTime( 2008, 6, 4 ),
                  ),
                  Person(
                    name: 'Cateano, Mirta D.',
                    dni: '26885633',
                    birthDate: DateTime( 1978, 9, 8 ),
                  ),
                ]
              ),
            )
          ],
        ),
      )
    );
  }
}
