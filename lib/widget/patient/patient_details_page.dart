import 'package:flutter/material.dart';
import 'package:onetp/model/patient.dart';
import 'package:onetp/widget/back_button.dart';
import 'package:onetp/widget/person/person_details.dart';
import 'package:onetp/widget/person/person_tile.dart';

class PatientDetailsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var patient = getPatient(ModalRoute.of(context)!.settings.arguments)!;

    return Scaffold(
      appBar: AppBar(
        leading: AppBarBackButton(),

        title: const Text( 'Información del paciente'),
      ),

      body: Column(
        children: [
          SizedBox( height: 32,),
          PersonDetails(person: patient),
          SizedBox( height: 48,),

          Expanded( child: ListView( children: [
            ListTitle( 'Familiares' ),
            for ( final person in patient.relatives )
              PersonTile(person: person )
          ],),)
        ],
      ),
    ) ;
  }
}

class ListTitle extends StatelessWidget {
  final String text ;

  const ListTitle( this.text, { super.key });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 12,
      ),
      child: Text( text,
        style: Theme.of(context).textTheme.titleMedium,
      ),
    );
  }
}