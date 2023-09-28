import 'package:flutter/material.dart';
import 'package:onetp/model/patient.dart';
import 'package:onetp/widget/text_input_field.dart';

class PatientsFormPage extends StatelessWidget {
  PatientsFormPage( {
    super.key,
  } ) ;

  @override
  Widget build(BuildContext context) {
    var patient = getPatient( ModalRoute.of( context )?.settings.arguments ) ;

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.of( context ).pop() ;
          },
          icon: const Icon( Icons.close ),
          tooltip: 'Close',
        ),
        title: const Text( 'Añadir paciente' ),
      ),

      body: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 24,
          horizontal: 16,
        ),
        child: Form(
          child: SizedBox(
            width: 300,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextInputField(
                  labelText: 'Apellido y nombres',
                  initialText: patient?.name,
                ),
                SizedBox( height: 16 ),

                TextInputField(
                  labelText: 'DNI',
                  initialText: patient?.dni,
                ),
                SizedBox( height: 16 ),
                
                InputDatePickerFormField(
                  fieldLabelText: 'Fecha de nacimiento',
                  firstDate: DateTime( 1500 ),
                  lastDate: DateTime.now(),
                  initialDate: patient?.birthDate,
                  keyboardType: TextInputType.datetime,
                ),
                SizedBox( height: 16 ),

                FilledButton(
                  onPressed: () {
                    Navigator.of( context ).pop() ;
                  },
                  child: patient == null
                    ? const Text( 'Añadir' )
                    : const Text( 'Actualizar' ),
                )
              ],
            ),
          ),
        ),
      ),
    ) ;
  }
}
